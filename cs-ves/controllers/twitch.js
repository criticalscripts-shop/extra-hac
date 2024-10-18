// An expansion controller for loading Twitch URLs, use at your own risk!
// Append the following code inside the "cs-ves/client/dui/javascript/controllers/expansions.js" file to enable this controller.

;(() => {
    Twitch = undefined

    const twitchScript = document.createElement('script')

    twitchScript.src = 'https://player.twitch.tv/js/embed/v1.js'

    document.head.append(twitchScript)

    const vodCheckerIntervalMs = 500
    const buttonsCheckIntervalMs = 500
    const seekedDelayMs = 1000
    const playerCheckTimeoutMs = 5000
    const elementId = 'twitch-controller'
    
    class TwitchController extends DummyController {
        constructor(manager, cb) {
            super(manager, false)
    
            this.key = 'twitch'
            this.manager = manager
            this.context = this.manager.context
    
            this.element = null
            this.source = null
            this.duration = null
            this.media = null
            this.playerButtonsInterval = null
            this.vodCheckerInterval = null
            this.playerCheckTimeout = null
            this.seekTimeout = null
            this.pending.pause = false
            this.pending.seek = null
            this.awaitingPlayingEvent = false
            this.playing = false
            this.stopped = true
            this.hooked = false
            this.showing = true
    
            const placeholder = document.createElement('div')
    
            placeholder.id = elementId
            placeholder.classList.add('expansion-controller')
    
            this.container = document.body.appendChild(placeholder)
            this.container.style.display = 'none'
            this.ready = true
    
            setTimeout(() => cb(), 0)
        }
    
        attachPlayer(source, type) {
            if (this.player)
                this.detachPlayer()
    
            const player = new Twitch.Player(elementId, {
                width: '100%',
                height: '100%',
                [type]: source,
                autoplay: false,
                parent: location.hostname
            })
    
            player.addEventListener(Twitch.Player.READY, event => {
                this.container = document.getElementById(elementId)
    
                if (this.container.querySelector('iframe').contentDocument && this.container.querySelector('iframe').contentDocument.querySelector('div.content-overlay-gate__allow-pointers > button:not([data-a-target="player-overlay-mature-accept"])')) {
                    this.manager.controllerError(this, 'E_SOURCE_ERROR')
                    this.stop()
                }
            })
    
            player.addEventListener(Twitch.Player.PLAY, event => {
                if (!this.hooked)
                    this.hook()
    
                if (this.showing)
                    this.container.style.display = 'block'
    
                this.playing = true
                this.stopped = false
            })
    
            player.addEventListener(Twitch.Player.PLAYING, event => {
                this.awaitingPlayingEvent = false
    
                this.controls(this.container.querySelector('iframe').contentWindow.navigator.mediaSession)
    
                if (!this.duration)
                    this.duration = player.getDuration() === Infinity ? -1 : player.getDuration()
    
                clearInterval(this.playerButtonsInterval)
    
                this.playerButtonsInterval = setInterval(() => {
                    if (!this.container.querySelector('iframe').contentDocument)
                        return
    
                    const mutedElement = this.container.querySelector('iframe').contentDocument.querySelector('div.muted-segments-alert__content')
                    const mutedButton = mutedElement ? mutedElement.querySelector('button') : null
                    const matureButton = this.container.querySelector('iframe').contentDocument.querySelector('button[data-a-target="player-overlay-mature-accept"]')
                    const contentClassificationButton = this.container.querySelector('iframe').contentDocument.querySelector('button[data-a-target="content-classification-gate-overlay-start-watching-button"]')
    
                    if (mutedButton)
                        mutedButton.click()
    
                    if (matureButton)
                        matureButton.click()
    
                    if (contentClassificationButton)
                        contentClassificationButton.click()
                }, buttonsCheckIntervalMs)
    
                this.manager.hideSpinner()
    
                if (this.pending.pause)
                    this.pause()
    
                if (this.pending.seek)
                    this.seek(this.pending.seek)
            })
    
            player.addEventListener(Twitch.Player.PAUSE, event => {
                this.playing = false
            })
    
            player.addEventListener(Twitch.Player.PLAYBACK_BLOCKED, event => {
                if (this.source && this.source.replace('channel:', '') === player.getChannel()) {
                    this.manager.controllerError(this, 'E_SOURCE_ERROR')
                    this.stop()
                }
            })
    
            player.addEventListener(Twitch.Player.OFFLINE, event => {
                if (this.source && this.source.replace('channel:', '') === player.getChannel()) {
                    this.manager.controllerError(this, 'E_SOURCE_NOT_FOUND')
                    this.stop()
                }
            })
    
            player.addEventListener(Twitch.Player.ENDED, event => {
                if (this.playing)
                    this.manager.controllerEnded(this)
    
                this.stop()
            })
    
            this.player = player
        }
    
        detachPlayer() {
            document.getElementById(elementId).innerHTML = ''
            this.player = null
            this.hooked = false
        }
    
        hook() {
            const element = this.container.querySelector('iframe').contentDocument.getElementsByTagName('video')[0]
    
            if (!element) {
                this.manager.controllerError(this, 'E_SOURCE_NOT_FOUND')
                this.hooked = false
                this.element = null
                this.stop()
                return
            }
    
            if (element !== this.element) {
                if (this.media)
                    this.media.disconnect()
    
                this.element = element
    
                this.element.addEventListener('seeked', event => {
                    clearTimeout(this.seekTimeout)
                    this.seekTimeout = setTimeout(() => this.seeked(), seekedDelayMs)
                })
    
                this.media = this.context.createMediaElementSource(this.element)
                this.manager.controllerHooked(this)
            }
    
            this.hooked = true
        }
    
        play(muted) {
            if ((!this.source) || (!this.ready))
                return
    
            this.manager.showSpinner()
    
            if (this.stopped)
                this.set(this.source)
    
            this.awaitingPlayingEvent = true
            this.pending.pause = false
    
            if (this.player) {
                this.player.setMuted(muted || this.pending.seek ? true : false)
                this.player.play()
            }
    
            clearTimeout(this.playerCheckTimeout)
            clearInterval(this.vodCheckerInterval)
    
            this.playerCheckTimeout = setTimeout(() => {
                if (this.awaitingPlayingEvent)
                    this.manager.controllerResync(this)
            }, playerCheckTimeoutMs)
    
            this.vodCheckerInterval = setInterval(() => {
                if (this.container.querySelector('iframe') && this.container.querySelector('iframe').contentDocument.querySelector('div.content-overlay-gate__allow-pointers > button:not([data-a-target="player-overlay-mature-accept"])')) {
                    this.manager.controllerError(this, 'E_SOURCE_ERROR')
                    this.stop()
                    clearInterval(this.vodCheckerInterval)
                } else if (this.playing)
                    clearInterval(this.vodCheckerInterval)
            }, vodCheckerIntervalMs)
        }
    
        pause() {
            if ((!this.source) || (!this.ready))
                return
    
            this.awaitingPlayingEvent = false
            this.pending.pause = false
    
            clearTimeout(this.playerCheckTimeout)
            clearInterval(this.vodCheckerInterval)
    
            if (this.playing) {
                this.duration = null
    
                if (this.player)
                    this.player.pause()
            } else
                this.pending.pause = true
        }
    
        stop() {
            if ((!this.source) || (!this.ready))
                return
    
            this.duration = null
            this.awaitingPlayingEvent = false
            this.stopped = true
            this.pending.pause = false
            this.pending.seek = null
            this.container.style.display = 'none'
    
            if (this.player)
                this.player.pause()
    
            clearTimeout(this.playerCheckTimeout)
            clearInterval(this.vodCheckerInterval)
    
            this.manager.hideSpinner()
            this.seeked()
        }
    
        seek(time) {
            if ((!this.source) || (!this.ready))
                return
    
            clearTimeout(this.seekTimeout)
    
            this.seeking = true
    
            if (this.playing) {
                this.pending.seek = null
    
                if (this.player) {
                    this.player.seek(time)
                    this.player.setMuted(false)
                }
            } else
                this.pending.seek = time
        }
    
        set(source) {
            if ((!this.ready) || source === this.source)
                return
    
            if (!source) {
                this.stop()
                this.source = null
                this.detachPlayer()
                return
            }
    
            if (source.startsWith('channel:'))
                this.attachPlayer(source.replace('channel:', ''), 'channel')
            else if (source.startsWith('video:'))
                this.attachPlayer(source.replace('video:', ''), 'video')
    
            this.container.style.display = 'none'
    
            if (this.player)
                this.player.pause()
    
            clearTimeout(this.playerCheckTimeout)
            clearInterval(this.vodCheckerInterval)
    
            this.playing = false
            this.awaitingPlayingEvent = false
            this.stopped = true
            this.source = source
            this.duration = null
            this.seeked()
    
        }
    
        time() {
            return (this.source && this.ready && this.player && this.player.getCurrentTime()) || 0
        }
    
        show() {
            this.showing = true
    
            if (!this.stopped)
                this.container.style.display = 'block'
        }
    
        hide() {
            this.showing = false
            this.container.style.display = 'none'
        }
    }

    RegisterExpansionController(TwitchController, 'twitch', source => {
        const twitchChannel = source.match(/^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/([A-z0-9_]+)($|\?)/i)
        const twitchVideo = source.match(/^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/videos\/([0-9]+)($|\?)/i)

        if (twitchChannel?.[1])
            return `channel:${twitchChannel[1]}`
        else if (twitchVideo?.[1])
            return `video:${twitchVideo[1]}`
    })

    class TwitchClipController extends FrameController {
        constructor(manager, cb) {
            super(manager, cb)
        }
    }

    RegisterExpansionController(TwitchClipController, 'twitchClip', source => {
        const twitchClip = source.match(/(?:(?:^(?:https?:\/\/)?clips\.twitch\.tv\/([A-z0-9_-]+)(?:$|\?))|(?:^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/(?:[A-z0-9_-]+)\/clip\/([A-z0-9_-]+)($|\?)))/)

        if (twitchClip?.[1] || twitchClip?.[2])
            return `${source}&parent=${location.hostname}`
    })
}) ();

// An expansion controller for loading YouTube URLs, use at your own risk!
// Append the following code inside the "cs-hall/client/dui/javascript/controllers/expansions.js" file to enable this controller.

;(() => {
    YT = undefined

    const ytScript = document.createElement('script')

    ytScript.src = 'https://www.youtube.com/iframe_api'

    document.head.append(ytScript)

    const pauseSeekedTimeoutMs = 250
    const playingSeekedTimeoutMs = 250
    const checkIntervalMs = 500

    class YouTubeController extends DummyController {
        constructor(manager, cb) {
            super(manager, false)

            this.key = 'youtube'
            this.manager = manager
            this.context = this.manager.context

            this.element = null
            this.source = null
            this.duration = null
            this.media = null
            this.playCheckInterval = null
            this.pauseSeekedTimeout = null
            this.playingSeekedTimeout = null
            this.pending.seek = null
            this.pending.stop = false
            this.pending.pause = false
            this.pending.play = false
            this.playing = false
            this.stopped = true
            this.hooked = false
            this.showing = true

            this.canvas = document.createElement('canvas')

            const placeholder = document.createElement('div')
            const elementId = 'youtube-controller'

            placeholder.id = elementId
            placeholder.classList.add('expansion-controller')
            
            this.container = document.body.appendChild(placeholder)
            this.container.style.display = 'none'
            
            const setPlayer = () => {
                if ((!YT) || (!YT.Player))
                    return setTimeout(setPlayer, checkIntervalMs)

                this.player = new YT.Player(elementId, {
                    width: '100%',
                    height: '100%',

                    playerVars: {
                        autoplay: 0,
                        muted: 1,
                        controls: 0,
                        playsinline: 1,
                        showinfo: 0,
                        rel: 0,
                        cc_load_policy: 3,
                        iv_load_policy: 3,
                        modestbranding: 1
                    },

                    embedOptions: {},
                    preload: true,
                    events: {
                        onReady: event => {
                            this.container = document.getElementById(elementId)
                            this.hook()
                        },

                        onError: event => {
                            if (this.source)
                                if (event.data === 2)
                                    this.play()
                                else {
                                    this.set(null)
                                    this.manager.controllerError(this, 'E_SOURCE_ERROR')
                                }

                            const ytVideoId = this.player.getVideoUrl().match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i)

                            if (((!ytVideoId) || ytVideoId[1] !== this.source) && this.source !== null)
                                return

                            if ((this.player.getPlayerState() === YT.PlayerState.ENDED || this.player.getPlayerState() === -1) && this.playing)
                                this.manager.controllerEnded(this)

                            if (this.player.getPlayerState() === YT.PlayerState.PLAYING)
                                this.playing = true
                            else
                                this.playing = false

                            if (this.playing && (!this.source)) {
                                this.stopped = true
                                this.player.stopVideo()
                            }
                        },

                        onStateChange: event => {
                            const ytVideoId = this.player.getVideoUrl().match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i)

                            if (((!ytVideoId) || ytVideoId[1] !== this.source) && this.source !== null)
                                return

                            if (this.player.getPlayerState() === YT.PlayerState.PLAYING)
                                this.controls(this.player.getIframe().contentWindow.navigator.mediaSession)

                            if ((this.player.getPlayerState() === YT.PlayerState.ENDED || this.player.getPlayerState() === -1) && this.playing)
                                this.manager.controllerEnded(this)

                            if (this.player.getPlayerState() === YT.PlayerState.PLAYING)
                                this.playing = true
                            else
                                this.playing = false

                            if (this.playing && (!this.source)) {
                                this.stopped = true
                                this.player.stopVideo()
                            }

                            if (this.pending.pause && this.player.getPlayerState() === YT.PlayerState.PLAYING)
                                this.pause()

                            if (this.pending.stop && this.player.getPlayerState() === YT.PlayerState.PLAYING)
                                this.stop()

                            if ((this.player.getPlayerState() === YT.PlayerState.PLAYING || this.player.getPlayerState() === YT.PlayerState.PAUSED || this.player.getPlayerState() === YT.PlayerState.BUFFERING) && this.showing && this.player.getCurrentTime() > 0)
                                this.container.style.display = 'block'
                            else
                                this.container.style.display = 'none'

                            if (this.pending.seek && (this.player.getPlayerState() === YT.PlayerState.PLAYING || this.player.getPlayerState() === YT.PlayerState.PAUSED))
                                this.seek(this.pending.seek)

                            if (this.hooked && (this.player.getPlayerState() === YT.PlayerState.ENDED || this.player.getPlayerState() === -1))
                                this.hooked = false
                            else if ((this.player.getPlayerState() === YT.PlayerState.PLAYING || this.player.getPlayerState() === YT.PlayerState.BUFFERING) && (!this.hooked))
                                this.hook()

                            if (this.player.getPlayerState() === YT.PlayerState.PLAYING && (!this.duration))
                                this.duration = (!this.player.getDuration()) || this.player.getDuration() < 1 ? null : this.player.getDuration()
                        }
                    }
                })
            }

            if (YT)
                setPlayer(this)
            else
                window.onYouTubeIframeAPIReady = () => setPlayer(this)

            const checkInterval = setInterval(() => {
                if (this.container && this.player && this.player.cueVideoById) {
                    this.ready = true
                    cb()
                    clearInterval(checkInterval)
                }
            }, checkIntervalMs)
        }

        hook() {
            const element = this.player.getIframe().contentDocument.getElementsByTagName('video')[0]

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
                this.media = this.context.createMediaElementSource(this.element)
                this.manager.controllerHooked(this)
            }

            this.hooked = true
        }

        play(muted) {
            if ((!this.source) || (!this.ready))
                return
            
            this.pending.stop = false
            this.pending.pause = false
            this.pending.play = this.source

            if (muted || this.pending.seek)
                this.player.mute()
            else
                this.player.unMute()

            this.stopped = false

            clearInterval(this.playCheckInterval)

            this.playCheckInterval = setInterval(() => {
                if (typeof(this.player.getPlayerState()) === 'undefined')
                    return

                if (this.pending.play) {
                    const ytVideoId = this.player.getVideoUrl().match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i)

                    if (ytVideoId && ytVideoId[1] === this.pending.play) {
                        if (this.playing) {
                            this.pending.play = false
                            this.seeked()
                        }

                        this.player.playVideo()
                    }
                } else
                    clearInterval(this.playCheckInterval)
            }, 50)
        }

        pause() {
            if ((!this.source) || (!this.ready))
                return

            this.pending.play = false

            clearInterval(this.playCheckInterval)

            if (this.player.getPlayerState() === YT.PlayerState.PLAYING) {
                this.pending.pause = false
                this.player.pauseVideo()
            } else
                this.pending.pause = true
        }

        stop() {
            if ((!this.source) || (!this.ready))
                return

            this.duration = null
            this.pending.seek = null
            this.pending.pause = false
            this.pending.play = false
            this.seeked()

            clearInterval(this.playCheckInterval)
    
            if (this.player.getPlayerState() === YT.PlayerState.PLAYING || this.player.getPlayerState() === YT.PlayerState.PAUSED) {
                this.pending.stop = false
                this.stopped = true
                this.player.stopVideo()
            } else
                this.pending.stop = true
        }

        seek(time) {
            if ((!this.source) || (!this.ready))
                return

            if ((this.player.getPlayerState() === YT.PlayerState.PLAYING || this.player.getPlayerState() === YT.PlayerState.PAUSED) && (!this.stopped)) {
                this.pending.seek = null
                this.player.seekTo(time)
                this.seeking = true

                clearTimeout(this.pauseSeekedTimeout)

                this.pauseSeekedTimeout = setTimeout(() => {
                    if (!this.playing)
                        this.seeked()
                }, pauseSeekedTimeoutMs)

                clearTimeout(this.playingSeekedTimeout)

                this.playingSeekedTimeout = setTimeout(() => {
                    if (this.seeking && this.player.getPlayerState() === YT.PlayerState.PLAYING)
                        this.seeked()
                }, playingSeekedTimeoutMs)
            } else
                this.pending.seek = time
        }

        set(source) {
            if ((!this.ready) || source === this.source)
                return
            
            if (!source) {
                this.stop()
                this.source = null
                return
            }

            this.source = source
            this.duration = null

            this.player.cueVideoById(this.source)
        }

        time() {
            return (this.source && this.ready && this.player.getCurrentTime()) || 0
        }

        show() {
            this.showing = true

            if (this.player.getCurrentTime() > 0 && (this.player.getPlayerState() === YT.PlayerState.PLAYING || this.player.getPlayerState() === YT.PlayerState.PAUSED || this.player.getPlayerState() === YT.PlayerState.BUFFERING))
                this.container.style.display = 'block'
        }

        screenshot() {
            if ((!this.element) || (!this.playing) || (!this.source) || (!this.player) || this.element.clientWidth <= 0 || this.element.clientHeight <= 0)
                return null
    
            this.canvas.width = this.element.clientWidth
            this.canvas.height = this.element.clientHeight
            this.canvas.getContext('2d').drawImage(this.element, 0, 0, this.canvas.width, this.canvas.height)
    
            const image = new Image()
    
            image.width = this.canvas.width
            image.height = this.canvas.height
            image.src = this.canvas.toDataURL()
    
            return image
        }
    
        dynamic() {
            return true
        }

        hide() {
            this.showing = false
            this.container.style.display = 'none'
        }

        seeked() {
            super.seeked()

            clearTimeout(this.pauseSeekedTimeout)
            clearTimeout(this.playingSeekedTimeout)
        }
    }

    RegisterExpansionController(YouTubeController, 'youtube', source => {
        const ytVideoId = source.match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i)

        if (ytVideoId?.[1])
            return ytVideoId[1]
    })
}) ();

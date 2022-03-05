const _CSS_notchOffset = '16.5%' // If your phone is using a skin with a notch you can specify the top distance it takes here.
const _CSS_bottomToTop = '5px' // The distance from bottom to top to animate the bottom elements to.
const _CSS_topToBottom = '15px' // The distance from top to bottom to animate the top elements to.

if (typeof(sendData) !== 'function')
    throw new Error('[criticalscripts.shop] cs-stories could not be hooked to your phone. Make sure you are using the correct hook.')

jQuery('body').on('click', '.phone-go-home', () => window.CS_STORIES.onHome()) // Calling this if the phone directs us to go back to the home view.
jQuery('body').on('click', '.phone-go-back', () => window.CS_STORIES.onBack()) // Calling this if the phone directs us to go back on the previous view.

window.CS_STORIES.hookInterface = () => {
    const _CSS_container = jQuery(`
        <div style="display: none">
            <div class="cs-stories-inner-container">
                <div class="cs-stories-info-wrapper"></div>

                <div class="cs-stories-close-record-wrapper">
                    <span data-action="cs-stories-close-record">
                        <button class="cs-stories-bg-grey"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21,3H3v18h18V3z M17,15.59L15.59,17L12,13.41L8.41,17L7,15.59L10.59,12L7,8.41L8.41,7L12,10.59L15.59,7L17,8.41L13.41,12 L17,15.59z"></path></svg></button>
                    </span>
                </div>

                <div class="cs-stories-play-indicator">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"><path d="M 10 5.25 L 10 44.746094 L 43.570313 25 Z"></path></svg>
                </div>

                <div class="cs-stories-loading-wrapper">
                    <div class="cs-stories-loading-indicator">
                        <svg class="cs-stories-spinner">
                            <circle cx="20" cy="20" r="18"></circle>
                        </svg>
                    </div>
                </div>

                <div class="cs-stories-video-wrapper">
                    <canvas id="cs-stories-self-video"></canvas>
                    <canvas id="cs-stories-video-clone"></canvas>
                    <canvas id="cs-stories-thumbnail-generator"></canvas>
                    <video id="cs-stories-video-player" preload="none"></video>

                    <div id="cs-stories-video-time">
                        <span></span>
                    </div>

                    <video id="cs-stories-virtual-video"></video>
                </div>

                <div class="cs-stories-wrapper"></div>

                <div class="cs-stories-bar-wrapper">
                    <div class="cs-stories-home-wrapper">
                        <span data-action="cs-stories-open-record">
                            <button class="cs-stories-bg-orange"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M 12 2 A 2 2 0 0 0 10 4 A 2 2 0 0 0 12 6 A 2 2 0 0 0 14 4 A 2 2 0 0 0 12 2 z M 12 7 C 9.269 7 7 7.9087969 7 9.2167969 L 7 10 L 4 10 L 4 11 L 4 22 L 20 22 L 20 10 L 17 10 L 17 9.2167969 C 17 7.9087969 14.731 7 12 7 z M 6 12 L 18 12 L 18 20 L 15.962891 20 C 15.77054 18.812134 14.05927 18 12 18 C 9.9407301 18 8.2294596 18.812134 8.0371094 20 L 6 20 L 6 12 z M 12 13 A 2 2 0 0 0 10 15 A 2 2 0 0 0 12 17 A 2 2 0 0 0 14 15 A 2 2 0 0 0 12 13 z"></path></svg></button>
                        </span>

                        <span data-action="cs-stories-close-home">
                            <button class="cs-stories-bg-grey"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21,3H3v18h18V3z M17,15.59L15.59,17L12,13.41L8.41,17L7,15.59L10.59,12L7,8.41L8.41,7L12,10.59L15.59,7L17,8.41L13.41,12 L17,15.59z"></path></svg></button>
                        </span>
                    </div>

                    <div class="cs-stories-close-video-wrapper">
                        <span data-action="cs-stories-delete-video">
                            <button class="cs-stories-bg-orange"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M 10 2 L 9 3 L 4 3 L 4 5 L 5 5 L 5 20 C 5 20.522222 5.1913289 21.05461 5.5683594 21.431641 C 5.9453899 21.808671 6.4777778 22 7 22 L 17 22 C 17.522222 22 18.05461 21.808671 18.431641 21.431641 C 18.808671 21.05461 19 20.522222 19 20 L 19 5 L 20 5 L 20 3 L 15 3 L 14 2 L 10 2 z M 7 5 L 17 5 L 17 20 L 7 20 L 7 5 z M 9 7 L 9 18 L 11 18 L 11 7 L 9 7 z M 13 7 L 13 18 L 15 18 L 15 7 L 13 7 z"></path></svg></button>
                        </span>

                        <span data-action="cs-stories-close-video">
                            <button class="cs-stories-bg-grey"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21,3H3v18h18V3z M17,15.59L15.59,17L12,13.41L8.41,17L7,15.59L10.59,12L7,8.41L8.41,7L12,10.59L15.59,7L17,8.41L13.41,12 L17,15.59z"></path></svg></button>
                        </span>
                    </div>

                    <div class="cs-stories-video-delete-wrapper">
                        <span data-action="cs-stories-delete-video-confirm">
                            <button class="cs-stories-bg-green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d="M 14 4 C 13.477778 4 12.94539 4.1913289 12.568359 4.5683594 C 12.191329 4.9453899 12 5.4777778 12 6 L 12 7 L 7 7 L 6 7 L 6 9 L 7 9 L 7 25 C 7 26.645455 8.3545455 28 10 28 L 17 28 L 17 27.855469 C 18.367249 30.320181 20.996209 32 24 32 C 28.4 32 32 28.4 32 24 C 32 19.939374 28.931363 16.567445 25 16.070312 L 25 9 L 26 9 L 26 7 L 25 7 L 20 7 L 20 6 C 20 5.4777778 19.808671 4.9453899 19.431641 4.5683594 C 19.05461 4.1913289 18.522222 4 18 4 L 14 4 z M 14 6 L 18 6 L 18 7 L 14 7 L 14 6 z M 9 9 L 23 9 L 23 16.070312 C 22.301956 16.158582 21.631165 16.334117 21 16.591797 L 21 12 L 19 12 L 19 17.771484 C 18.18962 18.424016 17.507605 19.229482 17 20.144531 L 17 12 L 15 12 L 15 23 L 16.070312 23 C 16.028764 23.32857 16 23.660626 16 24 C 16 24.691044 16.098874 25.35927 16.265625 26 L 10 26 C 9.4454545 26 9 25.554545 9 25 L 9 9 z M 11 12 L 11 23 L 13 23 L 13 12 L 11 12 z M 24 18 C 27.3 18 30 20.7 30 24 C 30 27.3 27.3 30 24 30 C 20.7 30 18 27.3 18 24 C 18 20.7 20.7 18 24 18 z M 21.699219 20.300781 L 20.300781 21.699219 L 22.599609 24 L 20.300781 26.300781 L 21.699219 27.699219 L 24 25.400391 L 26.300781 27.699219 L 27.699219 26.300781 L 25.400391 24 L 27.699219 21.699219 L 26.300781 20.300781 L 24 22.599609 L 21.699219 20.300781 z"></path></svg></button>
                        </span>

                        <span data-action="cs-stories-delete-video-cancel">
                            <button class="cs-stories-bg-red"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21,3H3v18h18V3z M17,15.59L15.59,17L12,13.41L8.41,17L7,15.59L10.59,12L7,8.41L8.41,7L12,10.59L15.59,7L17,8.41L13.41,12 L17,15.59z"></path></svg></button>
                        </span>
                    </div>

                    <div class="cs-stories-record-wrapper">
                        <span data-action="cs-stories-swap-filter">
                            <button class="cs-stories-bg-teal"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"><path d="M 4 2 C 3.398438 2 3 2.398438 3 3 L 3 6 C 3 6.300781 3.113281 6.488281 3.3125 6.6875 L 19.3125 23.6875 C 19.511719 23.886719 19.800781 24 20 24 L 30 24 C 30.300781 24 30.488281 23.886719 30.6875 23.6875 L 46.6875 6.6875 C 46.886719 6.488281 47 6.300781 47 6 L 47 3 C 47 2.398438 46.601563 2 46 2 Z M 19 26 L 19 41 C 19 41.398438 19.199219 41.707031 19.5 41.90625 L 29.5 47.90625 C 29.601563 48.007813 29.800781 48 30 48 C 30.199219 48 30.300781 48.007813 30.5 47.90625 C 30.800781 47.707031 31 47.398438 31 47 L 31 26 Z"></path></svg></button>
                        </span>

                        <span data-action="cs-stories-record-video">
                            <button class="cs-stories-bg-red"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><path d="M 2 6 C 0.895 6 0 6.895 0 8 L 0 22 C 0 23.105 0.895 24 2 24 L 19 24 C 20.105 24 21 23.105 21 22 L 21 8 C 21 6.895 20.105 6 19 6 L 2 6 z M 29 8 A 1 1 0 0 0 28.302734 8.2832031 L 23 13 L 23 15 L 23 17 L 28.324219 21.736328 L 28.339844 21.75 A 1 1 0 0 0 29 22 A 1 1 0 0 0 30 21 L 30 15 L 30 9 A 1 1 0 0 0 29 8 z"></path></svg></button>
                        </span>

                        <span class="cs-stories-progress-ring">
                            <svg width="120" height="120">
                                <circle class="cs-stories-progress-ring-circle" stroke="white" stroke-width="4" fill="transparent" r="52" cx="60" cy="60" />
                            </svg>
                        </span>

                        <span data-action="cs-stories-swap-camera">
                            <button class="cs-stories-bg-purple"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M16 15L24 15 20 20zM8 9L0 9 4 4z"></path><path d="M21 6c0-1.654-1.346-3-3-3H7.161l1.6 2H18c.551 0 1 .448 1 1v10h2V6zM3 18c0 1.654 1.346 3 3 3h10.839l-1.6-2H6c-.551 0-1-.448-1-1V8H3V18z"></path></svg></button>
                        </span>
                    </div>

                    <div class="cs-stories-upload-wrapper">
                        <span data-action="cs-stories-upload-video">
                            <button class="cs-stories-bg-green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><path d="M 6 4 C 4.895 4 4 4.895 4 6 L 4 20 C 4 21.105 4.895 22 6 22 L 20 22 C 21.105 22 22 21.105 22 20 L 22 6 C 22 4.895 21.104 4 20 4 L 6 4 z M 19 8 C 19.25575 8 19.511531 8.0974688 19.707031 8.2929688 C 20.098031 8.6839688 20.098031 9.3160312 19.707031 9.7070312 L 12.146484 17.267578 C 11.958484 17.455578 11.704453 17.560547 11.439453 17.560547 C 11.174453 17.560547 10.919422 17.455578 10.732422 17.267578 L 7.2792969 13.814453 C 6.8882969 13.423453 6.8882969 12.791391 7.2792969 12.400391 C 7.6702969 12.009391 8.3023594 12.009391 8.6933594 12.400391 L 11.439453 15.146484 L 18.292969 8.2929688 C 18.488469 8.0974688 18.74425 8 19 8 z M 24 8 L 24 20 C 24 22.209 22.209 24 20 24 L 8 24 C 8 25.105 8.895 26 10 26 L 24 26 C 25.105 26 26 25.105 26 24 L 26 10 C 26 8.895 25.104 8 24 8 z"></path></svg></button>
                        </span>

                        <span data-action="cs-stories-discard-video">
                            <button class="cs-stories-bg-red"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21,3H3v18h18V3z M17,15.59L15.59,17L12,13.41L8.41,17L7,15.59L10.59,12L7,8.41L8.41,7L12,10.59L15.59,7L17,8.41L13.41,12 L17,15.59z"></path></svg></button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    `)

    // If you want to edit the app's position, name, icon or color you may do so here.
    const _CSS_button = jQuery(`
        <div class="phone-application" data-toggle="tooltip" data-placement="bottom" style="background: #ff015f" title="Stories">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height: 65%; fill: white; margin-top: 15%"><path d="M 12 2 A 2 2 0 0 0 10 4 A 2 2 0 0 0 12 6 A 2 2 0 0 0 14 4 A 2 2 0 0 0 12 2 z M 12 7 C 9.269 7 7 7.9087969 7 9.2167969 L 7 10 L 6 10 C 4.9069372 10 4 10.906937 4 12 L 4 20 C 4 21.093063 4.9069372 22 6 22 L 18 22 C 19.093063 22 20 21.093063 20 20 L 20 12 C 20 10.906937 19.093063 10 18 10 L 17 10 L 17 9.2167969 C 17 7.9087969 14.731 7 12 7 z M 6 12 L 18 12 L 18 20 L 15.962891 20 C 15.77054 18.812134 14.05927 18 12 18 C 9.9407301 18 8.2294596 18.812134 8.0371094 20 L 6 20 L 6 12 z M 12 13 A 2 2 0 0 0 10 15 A 2 2 0 0 0 12 17 A 2 2 0 0 0 14 15 A 2 2 0 0 0 12 13 z"></path></svg>
        </div>
    `)

    jQuery('.phone-home-applications').append(_CSS_button)
    jQuery('.phone-container').prepend(_CSS_container)

    return {
        container: _CSS_container,
        button: _CSS_button,
        notchOffset: _CSS_notchOffset,
        bottomToTop: _CSS_bottomToTop,
        topToBottom: _CSS_topToBottom
    }
}

window.CS_STORIES.onShowStories = () => {} // What to do when cs-stories is shown.
window.CS_STORIES.onHideStories = () => {} // What to do when cs-stories is hidden.

window.CS_STORIES.getStoryTemplate = (story, lang) => { // Each individual story's template.
    return `
        <div class="cs-stories-story-entry" data-uuid="${story.uuid}" data-tempId="${story.tempId}" data-location="${story.location}" data-timestamp="${story.timestamp}" data-author="${story.author}" data-deletable="${story.deletable}">
            <img src="${story.thumbnail}" alt="${story.uuid}.jpg" class="cs-stories-story-thumbnail" />

            <div class="cs-stories-story-data">
                <div class="cs-stories-story-inner">
                    <div class="cs-stories-story-author">${story.author}</div>
                    <div class="cs-stories-story-time" data-timestamp="${story.timestamp}">${moment(story.timestamp).fromNow()}</div>
                    <div class="cs-stories-story-location">${story.location}</div>
                </div>
            </div>

            <span class="cs-stories-key-label cs-stories-go-up">${(!lang.controls) || lang.controls.arrowUp === null ? '' : `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M 12 2.9296875 L 4.9296875 10 L 6.4296875 11.5 L 11 6.9296875 L 11 21 L 13 21 L 13 6.9296875 L 17.570312 11.5 L 19.070312 10 L 12 2.9296875 z"></path></svg>${lang.controls.arrowUp ? `&nbsp;${lang.controls.arrowUp}` : ''}`}</span>
            <span class="cs-stories-key-label cs-stories-view">${(!lang.controls) || lang.controls.enter === null ? '' : `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><path d="M 15 5 C 6.081703 5 0.32098813 14.21118 0.21679688 14.378906 A 1 1 0 0 0 0 15 A 1 1 0 0 0 0.16210938 15.544922 A 1 1 0 0 0 0.16601562 15.550781 C 0.18320928 15.586261 5.0188313 25 15 25 C 24.938822 25 29.767326 15.678741 29.826172 15.564453 A 1 1 0 0 0 29.837891 15.544922 A 1 1 0 0 0 30 15 A 1 1 0 0 0 29.785156 14.380859 A 1 1 0 0 0 29.783203 14.378906 C 29.679012 14.21118 23.918297 5 15 5 z M 15 8 C 18.866 8 22 11.134 22 15 C 22 18.866 18.866 22 15 22 C 11.134 22 8 18.866 8 15 C 8 11.134 11.134 8 15 8 z M 15 12 A 3 3 0 0 0 12 15 A 3 3 0 0 0 15 18 A 3 3 0 0 0 18 15 A 3 3 0 0 0 15 12 z"></path></svg>${lang.controls.enter ? `&nbsp;${lang.controls.enter}` : ''}`}</span>
            <span class="cs-stories-key-label cs-stories-go-down">${(!lang.controls) || lang.controls.arrowDown === null ? '' : `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M 11 3 L 11 17.070312 L 6.4296875 12.5 L 4.9296875 14 L 12 21.070312 L 19.070312 14 L 17.570312 12.5 L 13 17.070312 L 13 3 L 11 3 z"></path></svg>${lang.controls.arrowDown ? `&nbsp;${lang.controls.arrowDown}` : ''}`}</span>
        </div>
    `
}

window.CS_STORIES.hookDocument()

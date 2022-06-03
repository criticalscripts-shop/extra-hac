window.CS_VIDEO_CALL.hookInterface = () => {
    const screen = jQuery('.screen').length > 0 ? jQuery('.screen') : jQuery('.case').next()
    const toastifyVersion = jQuery('.Toastify__toast-body .actions').length > 0
    const alert = toastifyVersion ? jQuery('.Toastify__toast-body .actions') : jQuery('.grid.gap-1 .flex.gap-1')

    screen.prepend(`
        <canvas id="cs-video-call-video-clone"></canvas>
        <video id="cs-video-call-virtual-video"></video>

        <div id="cs-video-call-self-video-container">
            <canvas id="cs-video-call-self-video"></canvas>

            <div class="cs-video-call-buttons-container">
                <span data-action="cs-video-call-swap-filter">
                    <button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><path d="M 4 4 A 1.0001 1.0001 0 1 0 4 6 L 4.8007812 6 L 12 15 L 18 15 L 25.199219 6 L 26 6 A 1.0001 1.0001 0 1 0 26 4 L 4 4 z M 12 17 L 12 26 L 18 24 L 18 17 L 12 17 z"></path></svg></button>
                </span>

                <span data-action="cs-video-call-swap-camera">
                    <button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><path d="M 15 3 C 12.031398 3 9.3028202 4.0834384 7.2070312 5.875 A 1.0001 1.0001 0 1 0 8.5058594 7.3945312 C 10.25407 5.9000929 12.516602 5 15 5 C 20.19656 5 24.450989 8.9379267 24.951172 14 L 22 14 L 26 20 L 30 14 L 26.949219 14 C 26.437925 7.8516588 21.277839 3 15 3 z M 4 10 L 0 16 L 3.0507812 16 C 3.562075 22.148341 8.7221607 27 15 27 C 17.968602 27 20.69718 25.916562 22.792969 24.125 A 1.0001 1.0001 0 1 0 21.494141 22.605469 C 19.74593 24.099907 17.483398 25 15 25 C 9.80344 25 5.5490109 21.062074 5.0488281 16 L 8 16 L 4 10 z"></path></svg></button>
                </span>

                <span data-action="cs-video-call-swap-elements">
                    <button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128"><path d="M36,67h56c13.8,0,25-11.2,25-25s-11.2-25-25-25H21.2L32.1,6.1c1.2-1.2,1.2-3.1,0-4.2c-1.2-1.2-3.1-1.2-4.2,0l-16,16 c-1.2,1.2-1.2,3.1,0,4.2l16,16c0.6,0.6,1.4,0.9,2.1,0.9s1.5-0.3,2.1-0.9c1.2-1.2,1.2-3.1,0-4.2L21.2,23H92c10.5,0,19,8.5,19,19 s-8.5,19-19,19H36c-13.8,0-25,11.2-25,25s11.2,25,25,25h70.8l-10.9,10.9c-1.2,1.2-1.2,3.1,0,4.2c0.6,0.6,1.4,0.9,2.1,0.9 s1.5-0.3,2.1-0.9l16-16c1.2-1.2,1.2-3.1,0-4.2l-16-16c-1.2-1.2-3.1-1.2-4.2,0c-1.2,1.2-1.2,3.1,0,4.2l10.9,10.9H36 c-10.5,0-19-8.5-19-19S25.5,67,36,67z"></path></svg></button>
                </span>
            </div>
        </div>

        <video id="cs-video-call-remote-video"></video>
    `)

    alert.prepend(`<span style="position: absolute;right: 13%;top: ${toastifyVersion ? '45' : '5'}%;z-index: 3;zoom: 0.3"><span data-action="cs-video-call-swap-transmission" style="display: none;"><svg enable-background="new 0 0 488.3 488.3" version="1.1" viewBox="0 0 488.3 488.3" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="m488.3 142.5v203.1c0 15.7-17 25.5-30.6 17.7l-84.6-48.8v13.9c0 41.8-33.9 75.7-75.7 75.7h-221.7c-41.8 0-75.7-33.9-75.7-75.7v-168.5c0-41.8 33.9-75.7 75.7-75.7h221.8c41.8 0 75.7 33.9 75.7 75.7v13.9l84.6-48.8c13.5-8 30.5 1.9 30.5 17.5z" /></svg></span></span>`)

    return screen
}

jQuery('body').on('DOMSubtreeModified', event => {
    if (jQuery('.Toastify__toast-body .decline').length > 0 || jQuery('.grid.gap-1 .flex.gap-1 .w-6.h-6.bg-red-500').length > 0)
        window.CS_VIDEO_CALL.hookDocument()
    else
        window.CS_VIDEO_CALL.unhookDocument()
})

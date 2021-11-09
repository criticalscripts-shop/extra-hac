gabz_mrpd_training_room: {
    enabled: true,

    idleWallpaperUrl: 'https://files.criticalscripts.shop/resources/cs-hall/wallpaper.png',

    area: {
        range: 24.0,
        center: [444.93, -985.62, 34.97],

        polygons: {
            applyLowPassFilterOutside: true,

            entries: [
                {
                    height: {
                        min: 34.0,
                        max: 37.0
                    },

                    points: [
                        [439.57, -990.6],
                        [448.61, -990.52],
                        [450.29, -988.71],
                        [450.06, -982.84],
                        [448.46, -981.31],
                        [439.62, -981.36],
                    ]
                }
            ]
        }
    },

    scaleform: {
        solid: false,
        position: [439.47, -987.10, 36.91],
        rotation: [0, 0, -90],
        scale: [0.102, 0.075, 0.0]
    },

    speakers: [
        {
            hash: 'v_res_fh_speaker',
            visible: false,
            position: [439.75, -990.14, 37.59],
            heading: 94.32,
            refDistance: 12.0,
            rolloffFactor: 2,
            lowPassGainReductionPercent: 75
        },

        {
            hash: 'v_res_fh_speaker',
            visible: false,
            position: [439.58, -981.60, 37.59],
            heading: 7.07,
            refDistance: 12.0,
            rolloffFactor: 2,
            lowPassGainReductionPercent: 75
        }
    ]
},

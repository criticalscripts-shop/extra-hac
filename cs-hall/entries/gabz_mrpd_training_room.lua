-- The map for this entry can be found at: https://fivem.gabzv.com/package/4724502

['gabz_mrpd_training_room'] = {
    ['enabled'] = true,
    ['autoAdjustTime'] = false,
    ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-hall-dui/wallpaper.png',
    ['maxVolumePercent'] = 50,
    ['smokeFxMultiplier'] = 3,
    ['smokeTimeoutMs'] = 5000,
    ['sparklerFxMultiplier'] = 1,
    ['sparklerTimeoutMs'] = 1500,
    ['delayBetweenSmokeChainMs'] = 1500,
    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
    ['featureDelayWithControllerInterfaceClosedMs'] = 500,

    ['bass'] = nil,

    ['area'] = {
        ['range'] = 32.0,
        ['center'] = vector3(444.93, -985.62, 34.97),
        ['height'] = nil,

        ['polygons'] = {
            ['applyLowPassFilterOutside'] = true,
            ['invertLowPassApplication'] = false,
            ['hideReplacersOutside'] = true,

            ['entries'] = {
                {
                    ['height'] = {
                        ['min'] = 34.0,
                        ['max'] = 37.0
                    },

                    ['points'] = {
                        vector2(439.57, -990.6),
                        vector2(448.61, -990.52),
                        vector2(450.29, -988.71),
                        vector2(450.06, -982.84),
                        vector2(448.46, -981.31),
                        vector2(439.62, -981.36)
                    }
                }
            }
        }
    },

    ['disableEmitters'] = nil,

    ['scaleform'] = {
        ['solid'] = false,
        ['flag'] = false,
        ['position'] = vector3(439.47, -987.10, 36.91),
        ['rotation'] = vector3(0.0, 0.0, -90.0),
        ['scale'] = vector3(0.102, 0.075, 0.0)
    },

    ['replacers'] = nil,
    ['monitors'] = nil,
    ['screens'] = nil,
    ['spotlights'] = nil,
    ['smokers'] = nil,
    ['sparklers'] = nil,

    ['speakers'] = {
        {
            ['hash'] = 'v_res_fh_speaker',
            ['visible'] = false,
            ['position'] = vector3(439.75, -990.14, 37.59),
            ['rotation'] = nil,
            ['heading'] = 94.32,
            ['lodDistance'] = nil,
            ['soundOffset'] = nil,
            ['distanceOffset'] = nil,
            ['maxDistance'] = 8.0,
            ['refDistance'] = 4.0,
            ['rolloffFactor'] = 2,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = 75
        },

        {
            ['hash'] = 'v_res_fh_speaker',
            ['visible'] = false,
            ['position'] = vector3(439.58, -981.60, 37.59),
            ['rotation'] = nil,
            ['heading'] = 7.07,
            ['lodDistance'] = nil,
            ['soundOffset'] = nil,
            ['distanceOffset'] = nil,
            ['maxDistance'] = 8.0,
            ['refDistance'] = 4.0,
            ['rolloffFactor'] = 2,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = 75
        }
    }
},

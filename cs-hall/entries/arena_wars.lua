-- The map for this entry can be found at: https://forum.cfx.re/t/release-arena-war-dlc-arena-ipl-location/234585

['arena_wars'] = {
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
        ['range'] = 128.0,
        ['center'] = vector3(2799.85, -3801.06, 201.93),
        ['height'] = nil,
        ['polygons'] = nil
    },

    ['disableEmitters'] = nil,
    ['scaleform'] = nil,

    ['replacers'] = {
        ['xs_prop_arena_bigscreen_01'] = 'script_rt_bigscreen_01'
    },

    ['monitors'] = nil,
    ['screens'] = nil,
    ['spotlights'] = nil,
    ['smokers'] = nil,
    ['sparklers'] = nil,

    ['speakers'] = {
        {
            ['hash'] = 'xs_propintarena_speakers_01a',
            ['visible'] = false,
            ['position'] = vector3(2799.85, -3801.06, 201.93),
            ['rotation'] = nil,
            ['heading'] = nil,
            ['lodDistance'] = nil,
            ['soundOffset'] = nil,
            ['distanceOffset'] = nil,
            ['maxDistance'] = 32.0,
            ['refDistance'] = 16.0,
            ['rolloffFactor'] = 1.25,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = 15
        }
    }
},

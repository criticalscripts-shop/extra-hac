-- The map for this entry can be found at: https://richard-maps.tebex.io/package/5062883

['desert_festival_coachella'] = {
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

    ['bass'] = {
        ['smoke'] = {
            ['cooldownMs'] = 30000,
            ['colorWithDynamicSpotlights'] = true
        },

        ['sparklers'] = nil
    },

    ['area'] = {
        ['range'] = 128.0,
        ['center'] = vector3(1356.05, 3168.19, 40.47),
        ['height'] = nil,
        ['polygons'] = nil
    },

    ['disableEmitters'] = nil,
    ['scaleform'] = nil,

    ['replacers'] = {
        ['palco_coachella'] = 'M_HATers_Steel_01_diffuse',
        ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
        ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
    },

    ['monitors'] = {
        {
            ['hash'] = 'ba_prop_battle_club_screen_02',
            ['position'] = vector3(-3044.9343261719, 28.274089813232, 11.118411064148),
            ['rotation'] = nil,
            ['heading'] = 321.99,
            ['lodDistance'] = 128
        }
    },

    ['screens'] = nil,

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1342.783, 3168.718, 47.21169),
            ['rotation'] = nil,
            ['heading'] = 30.0,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1337.658, 3167.348, 47.16412),
            ['rotation'] = nil,
            ['heading'] = 30.0,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1367.019, 3174.858, 47.17853),
            ['rotation'] = nil,
            ['heading'] = 30.0,
            ['lodDistance'] = 128,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1372.0, 3176.188, 47.18555),
            ['rotation'] = nil,
            ['heading'] = 30.0,
            ['lodDistance'] = 128,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1343.98, 3173.05, 46.47),
            ['rotation'] = nil,
            ['heading'] = 90.0,
            ['lodDistance'] = 128,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1362.03, 3177.67, 46.85),
            ['rotation'] = nil,
            ['heading'] = 296.34,
            ['lodDistance'] = 128,
            ['color'] = {255, 5, 190}
        }
    },

    ['smokers'] = {
        {
            ['hash'] = 'ba_prop_club_smoke_machine',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ba_club',
                ['effect'] = 'scr_ba_club_smoke_machine',
            },

            ['position'] = vector3(1347.5, 3170.48, 40.43064),
            ['rotation'] = nil,
            ['heading'] = 90.0,
            ['lodDistance'] = 128,
            ['color'] = {0, 0, 0}
        },

        {
            ['hash'] = 'ba_prop_club_smoke_machine',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ba_club',
                ['effect'] = 'scr_ba_club_smoke_machine',
            },

            ['position'] = vector3(1360.43, 3174.37, 40.43064),
            ['rotation'] = nil,
            ['heading'] = 296.34,
            ['lodDistance'] = 128,
            ['color'] = {0, 0, 0}
        }
    },

    ['sparklers'] = nil,

    ['speakers'] = {
        {
            ['hash'] = 'xs_propintarena_speakers_01a',
            ['visible'] = false,
            ['position'] = vector3(1356.05, 3168.19, 40.47),
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

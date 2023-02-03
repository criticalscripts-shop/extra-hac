-- This entry does not require an extra map.

['parking_cinema'] = {
    ['enabled'] = true,
    ['autoAdjustTime'] = false,
    ['idleWallpaperUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
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
        ['center'] = vector3(-1707.6466, -905.0017, 9.855809),
        ['height'] = nil,
        ['polygons'] = nil
    },

    ['disableEmitters'] = nil,
    ['scaleform'] = nil,

    ['replacers'] = {
        ['big_screens'] = 'script_rt_big_disp'
    },

    ['monitors'] = {
        {
            ['hash'] = 'prop_huge_display_01',
            ['position'] = vector3(-1707.6466, -905.0017, 9.855809),
            ['rotation'] = nil,
            ['heading'] = 139.5905,
            ['lodDistance'] = 128
        },
        
        {
            ['hash'] = 'prop_billb_frame04b',
            ['position'] = vector3(-1708.3318, -905.8888, 6.707863),
            ['rotation'] = nil,
            ['heading'] = 139.5905,
            ['lodDistance'] = 128
        }
    },
    
    ['screens'] = nil,

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1702.9702, -909.14044, 13.335346),
            ['rotation'] = vector3(79.81944, 39.95835, 168.51068),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1702.9897, -909.1311, 14.115081),
            ['rotation'] = vector3(-89.1767, 15.263356, 62.73788),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1712.557, -900.9786, 13.335346),
            ['rotation'] = vector3(79.819565, 39.95832, 4.302759),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1712.5664, -900.98206, 14.115081),
            ['rotation'] = vector3(-89.17813, 15.263419, -116.71412),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1707.7294, -905.12115, 14.465001),
            ['rotation'] = vector3(0.6012018, -179.44646, -39.102104),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        }
    },

    ['smokers'] = nil,
    ['sparklers'] = nil,

    ['speakers'] = {
        {
            ['hash'] = 'ba_prop_battle_club_speaker_large',
            ['visible'] = true,
            ['position'] = vector3(-1702.5338, -909.6881, 6.7168493),
            ['rotation'] = nil,
            ['heading'] = 148.89508,
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
        },
        
        {
            ['hash'] = 'ba_prop_battle_club_speaker_large',
            ['visible'] = true,
            ['position'] = vector3(-1713.173, -900.6479, 6.72717),
            ['rotation'] = nil,
            ['heading'] = 120.33357,
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

['parking_cinema'] = {
    ['enabled'] = true,

    ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-hall-dui/wallpaper.png',

    ['area'] = {
        ['range'] = 256.0,
        ['center'] = vector3(-1707.6466, -905.0017, 9.855809)
    },

    ['replacers'] = {
        ['big_screens'] = 'script_rt_big_disp'
    },

    ['monitors'] = {
        {
            ['hash'] = 'prop_huge_display_01',
            ['position'] = vector3(-1707.6466, -905.0017, 9.855809),
            ['heading'] = 139.5905,
            ['lodDistance'] = 256
        },
        
        {
            ['hash'] = 'prop_billb_frame04b',
            ['position'] = vector3(-1708.3318, -905.8888, 6.707863),
            ['heading'] = 139.5905
        }
    },

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1702.9702, -909.14044, 13.335346),
            ['rotation'] = vector3(79.81944, 39.95835, 168.51068),
            ['lodDistance'] = 256,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1702.9897, -909.1311, 14.115081),
            ['rotation'] = vector3(-89.1767, 15.263356, 62.73788),
            ['lodDistance'] = 256,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1712.557, -900.9786, 13.335346),
            ['rotation'] = vector3(79.819565, 39.95832, 4.302759),
            ['lodDistance'] = 256,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1712.5664, -900.98206, 14.115081),
            ['rotation'] = vector3(-89.17813, 15.263419, -116.71412),
            ['lodDistance'] = 256,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(-1707.7294, -905.12115, 14.465001),
            ['rotation'] = vector3(0.6012018, -179.44646, -39.102104),
            ['lodDistance'] = 256,
            ['color'] = {255, 1, 1}
        }
    },

    ['speakers'] = {
        {
            ['hash'] = 'ba_prop_battle_club_speaker_large',
            ['visible'] = true,
            ['position'] = vector3(-1702.5338, -909.6881, 6.7168493),
            ['heading'] = 148.89508,
            ['soundOffset'] = vector3(0, 0, 0),
            ['refDistance'] = 32.0,
            ['lodDistance'] = 256,
            ['rolloffFactor'] = 1.5
        },
        
        {
            ['hash'] = 'ba_prop_battle_club_speaker_large',
            ['visible'] = true,
            ['position'] = vector3(-1713.173, -900.6479, 6.72717),
            ['heading'] = 120.33357,
            ['soundOffset'] = vector3(0, 0, 0),
            ['refDistance'] = 32.0,
            ['lodDistance'] = 256,
            ['rolloffFactor'] = 1.5
        }
    }
},

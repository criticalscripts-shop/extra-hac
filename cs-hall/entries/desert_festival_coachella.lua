-- The map for this entry can be found at: https://richard-maps.tebex.io/package/5062883

['desert_festival_coachella'] = {
    ['enabled'] = true,

    ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-hall-dui/wallpaper.png',

    ['bass'] = {
        ['smoke'] = {
            ['cooldownMs'] = 30000,
            ['colorWithDynamicSpotlights'] = true
        },

        ['sparklers'] = {
            ['cooldownMs'] = 30000,
            ['colorWithDynamicSpotlights'] = true
        }
    },

    ['area'] = {
        ['range'] = 300.0,
        ['center'] = vector3(1356.05, 3168.19, 40.47)
    },

    ['replacers'] = {
        ['palco_coachella'] = 'M_HATers_Steel_01_diffuse',
        ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
        ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
    },

    ['monitors'] = {
        {
            ['hash'] = 'ba_prop_battle_club_screen_02',
            ['position'] = vector3(-3044.9343261719, 28.274089813232, 11.118411064148),
            ['heading'] = 321.99
        }
    },

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1342.783, 3168.718, 47.21169),
            ['heading'] = 30.0,
            ['color'] = {255, 1, 1}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1337.658, 3167.348, 47.16412),
            ['heading'] = 30.0,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1367.019, 3174.858, 47.17853),
            ['heading'] = 30.0,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1372.0, 3176.188, 47.18555),
            ['heading'] = 30.0,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1343.98, 3173.05, 46.47),
            ['heading'] = 90.0,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1362.03, 3177.67, 46.85),
            ['heading'] = 296.34,
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

            ['position'] = vector3(1347.5,3170.48,40.43064),
            ['heading'] = 90.0,
            ['color'] = {0, 0, 0}
        },

        {
            ['hash'] = 'ba_prop_club_smoke_machine',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ba_club',
                ['effect'] = 'scr_ba_club_smoke_machine',
            },

            ['position'] = vector3(1360.43, 3174.37,40.43064),
            ['heading'] = 296.34,
            ['color'] = {0, 0, 0}
        }
    }
},

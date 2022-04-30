-- The map for this entry can be found at: https://forum.cfx.re/t/release-arena-war-dlc-arena-ipl-location/234585

['arena_wars'] = {
    ['enabled'] = true,

    ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-hall-dui/wallpaper.png',

    ['area'] = {
        ['range'] = 256.0,
        ['center'] = vector3(2799.85, -3801.06, 201.93)
    },

    ['replacers'] = {
        ['xs_prop_arena_bigscreen_01'] = 'script_rt_bigscreen_01'
    },

    ['speakers'] = {
        {
            ['hash'] = 'xs_propintarena_speakers_01a',
            ['visible'] = false,
            ['position'] = vector3(2799.85, -3801.06, 201.93),
            ['heading'] = 0,
            ['soundOffset'] = vector3(0, 0, 0),
            ['coneOuterGain'] = 1.0,
            ['refDistance'] = 128.0,
            ['rolloffFactor'] = 1.25
        }
    }
},

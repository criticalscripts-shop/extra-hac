-- This model does not require an addon.

['rcbandito'] = {
    ['enabled'] = true,
    ['range'] = 16.0,
    ['autoAdjustTime'] = false,
    ['maxVolumePercent'] = 50,

    ['idleWallpaperUrl'] = 'https://files.criticalscripts.shop/cs-ves-dui/wallpaper.png',
    ['lowPass'] = nil,

    ['replacers'] = {
        {
            ['name'] = 'xs_prop_arena_tablet_drone',
            ['texture'] = 'prop_arena_tablet_drone_screen_d',
            ['range'] = 8.0
        }
    },

    ['monitors'] = {
        {
            ['hash'] = 'xs_prop_arena_tablet_drone_01',
            ['position'] = vector3(0.005, -0.275, 0.2975),
            ['rotation'] = vector3(-17.5, -90.0, -2.0),
            ['bone'] = 'chassis',
            ['lodDistance'] = 16
        }
    },

    ['speakers'] = {
        {
            ['soundOffset'] = nil,
            ['distanceOffset'] = nil,
            ['maxDistance'] = 8.0,
            ['refDistance'] = 4.0,
            ['rolloffFactor'] = 1.25,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = 0
        }
    }
},

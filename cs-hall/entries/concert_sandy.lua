-- The ready-to-use map for this entry can be found at: https://github.com/criticalscripts-shop/extra-hac/tree/main/cs-hall/maps/concert-sandy
-- The original map this entry was inspired for can be found at: https://gta5-mods.com/maps/concert-los-santos

['concert_sandy'] = {
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

    ['bass'] = {
        ['smoke'] = {
            ['cooldownMs'] = 30000,
            ['colorWithDynamicSpotlights'] = false
        },

        ['sparklers'] = {
            ['cooldownMs'] = 30000,
            ['colorWithDynamicSpotlights'] = false
        }
    },

    ['area'] = {
        ['range'] = 256.0,
        ['center'] = vector3(1565.25, 3213.44, 43.42),
        ['height'] = nil,
        ['polygons'] = nil
    },

    ['disableEmitters'] = nil,
    ['scaleform'] = nil,

    ['replacers'] = {
        ['big_screens'] = 'script_rt_big_disp'
    },

    ['monitors'] = nil,

    ['screens'] = {
        {
            ['hash'] = 'prop_huge_display_01',
            ['position'] = vector3(1576.3103027344, 3204.2980957031, 37.021266937256),
            ['rotation'] = nil,
            ['heading'] = 105.99956512451,
            ['lodDistance'] = 256,

            ['advance'] = {
                ['durationMs'] = 15000,
                ['position'] = vector3(1576.3103027344, 3204.2980957031, 43.653057098389),
            }
        },

        {
            ['hash'] = 'prop_huge_display_01',
            ['position'] = vector3(1570.9542236328, 3225.544921875, 36.821266937256),
            ['rotation'] = nil,
            ['heading'] = 103.99956512451,
            ['lodDistance'] = 256,

            ['advance'] = {
                ['durationMs'] = 15000,
                ['position'] = vector3(1570.9542236328, 3225.544921875, 43.853057098389),
            }
        }
    },

    ['spotlights'] = {
        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1575.8421630859, 3198.0434570313, 49.709320068359),
            ['rotation'] = vector3(51.568656921387, -131.74703979492, 90.198829650879),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 0}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1575.734375, 3198.5405273438, 49.437355041504),
            ['rotation'] = vector3(51.568656921387, -131.74703979492, 90.198829650879),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {3, 83, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1566.8919677734, 3231.2272949219, 49.728706359863),
            ['rotation'] = vector3(53.141719818115, -169.84701538086, 85.386192321777),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 5, 190}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1566.9793701172, 3230.7966308594, 49.47940826416),
            ['rotation'] = vector3(53.141719818115, -169.84701538086, 85.386192321777),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {15, 3, 255}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1570.6510009766, 3208.8859863281, 52.603187561035),
            ['rotation'] = vector3(-66.816497802734, -170.07302856445, -65.090980529785),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1567.9012451172, 3219.3422851563, 52.603187561035),
            ['rotation'] = vector3(-66.816497802734, -170.07302856445, -65.090980529785),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1569.703125, 3212.4050292969, 52.566082000732),
            ['rotation'] = vector3(65.005317687988, -23.222478866577, -35.762630462646),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
        },

        {
            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
            ['hash'] = 'cs_prop_hall_spotlight',
            ['position'] = vector3(1568.7893066406, 3215.908203125, 52.566082000732),
            ['rotation'] = vector3(70.837097167969, 13.167973518372, -70.67626953125),
            ['heading'] = nil,
            ['lodDistance'] = 128,
            ['color'] = {255, 1, 1}
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

            ['position'] = vector3(1575.7359619141,3200.5314941406, 40.282474517822),
            ['rotation'] = nil,
            ['heading'] = 76.0,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'ba_prop_club_smoke_machine',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ba_club',
                ['effect'] = 'scr_ba_club_smoke_machine',
            },

            ['position'] = vector3(1568.0212402344, 3229.1960449219, 40.265705108643),
            ['rotation'] = nil,
            ['heading'] = 165.0,
            ['lodDistance'] = 128,
            ['color'] = {255, 255, 255}
        }
    },

    ['sparklers'] = {
        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1586.9285888672, 3214.5187988281, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1584.9113769531, 3222.25, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1582.1751708984, 3213.3032226563, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1578.0192871094, 3212.2856445313, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1580.8919677734, 3221.2060546875, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1576.5671386719, 3220.1418457031, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1574.3088378906, 3211.3469238281, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        },

        {
            ['hash'] = 'prop_cs_pour_tube',
            ['visible'] = true,

            ['fx'] = {
                ['library'] = 'scr_ih_club',
                ['effect'] = 'scr_ih_club_sparkler',
            },

            ['position'] = vector3(1572.6644287109, 3219.1496582031, 40.68),
            ['rotation'] = nil,
            ['heading'] = 0.0,
            ['lodDistance'] = nil,
            ['color'] = {255, 255, 255}
        }
    },

    ['speakers'] = {
        {
            ['hash'] = 'ba_prop_battle_club_speaker_large',
            ['visible'] = false,
            ['position'] = vector3(1567.5899658203, 3200.0532226563, 48.92),
            ['rotation'] = nil,
            ['heading'] = 106.06,
            ['lodDistance'] = nil,
            ['soundOffset'] = vector3(0.0, 0.0, 0.0),
            ['distanceOffset'] = nil,
            ['maxDistance'] = 256.0,
            ['refDistance'] = 32.0,
            ['rolloffFactor'] = 1.25,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = nil
        },
        
        {
            ['hash'] = 'ba_prop_battle_club_speaker_large',
            ['visible'] = false,
            ['position'] = vector3(1559.4200439453, 3227.0422363281, 48.919998168945),
            ['rotation'] = nil,
            ['heading'] = 106.06,
            ['lodDistance'] = nil,
            ['soundOffset'] = vector3(0.0, 0.0, 0.0),
            ['distanceOffset'] = nil,
            ['maxDistance'] = 256.0,
            ['refDistance'] = 32.0,
            ['rolloffFactor'] = 1.25,
            ['coneInnerAngle'] = 90,
            ['coneOuterAngle'] = 180,
            ['coneOuterGain'] = 0.5,
            ['fadeDurationMs'] = 250,
            ['volumeMultiplier'] = 1.0,
            ['lowPassGainReductionPercent'] = nil
        }
    }
},

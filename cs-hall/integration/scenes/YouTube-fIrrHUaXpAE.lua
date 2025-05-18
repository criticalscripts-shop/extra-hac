RegisterScene('Url:https://www.youtube.com/watch?v=fIrrHUaXpAE', {
    'vanilla_unicorn',
    'gabz_vanilla_unicorn'
}, function(identifier)
    Scene.SetSpotlightsSettings(false, false, true)
    Scene.SetVideoToggle(true)

    local smokers = Scene.GetSmokers()
    local sparklers = Scene.GetSparklers()
    local spotlights = Scene.GetSpotlights()
    local speakers = Scene.GetSpeakers()

    for i = 1, #smokers do
        Scene.SetSmokerColor({255, 255, 255}, i)
    end

    for i = 1, #sparklers do
        Scene.SetSparklerColor({255, 255, 255}, i)
    end

    Scene.SetSmokeBassSettings('off')
    Scene.SetSparklersBassSettings('off')

    for i = 1, #speakers do
        Scene.SetSpeakerVolume(i, 0.75)
    end

    local function SpotlightsLeft()
        Scene.SetSpotlightColor(2, {255, 255, 255})
        Scene.SetSpotlightColor(3, {255, 255, 255})
        Scene.SetSpotlightColor(4, {0, 0, 0})
        Scene.SetSpotlightColor(5, {0, 0, 0})
    end

    local function SpotlightsRight()
        Scene.SetSpotlightColor(2, {0, 0, 0})
        Scene.SetSpotlightColor(3, {0, 0, 0})
        Scene.SetSpotlightColor(4, {255, 255, 255})
        Scene.SetSpotlightColor(5, {255, 255, 255})
    end

    local function SpotlightsOff()
        Scene.SetSpotlightColor(2, {0, 0, 0})
        Scene.SetSpotlightColor(3, {0, 0, 0})
        Scene.SetSpotlightColor(4, {0, 0, 0})
        Scene.SetSpotlightColor(5, {0, 0, 0})
    end

    local function ListenRight(sleep, msOn, msOff)
        for i = 1, #speakers do
            Scene.SetSpeakerVolume(i, 0.25)
        end

        Scene.SetSpeakerVolume(2, 0.75)

        Wait(sleep)

        Scene.SetSpotlightState(4, true)
        Scene.SetSpotlightState(5, true)

        Scene.LerpCallback(0, 255, msOn, 75, function(val)
            val = tonumber(tostring(Round(val)):sub(1, -3))
            val = val and val > 255 and 255 or val

            Scene.SetSpotlightColor(4, {val, val, val})
            Scene.SetSpotlightColor(5, {val, val, val})
        end, nil, function()
            Scene.LerpCallback(255, 0, msOff, 75, function(val)
                val = tonumber(tostring(Round(val)):sub(1, -3))
                val = val and val > 0 and val or 0

                Scene.SetSpotlightColor(4, {val, val, val})
                Scene.SetSpotlightColor(5, {val, val, val})
            end)
        end)
    end

    local function ListenLeft(sleep, msOn, msOff)
        for i = 1, #speakers do
            Scene.SetSpeakerVolume(i, 0.25)
        end
        
        Scene.SetSpeakerVolume(1, 0.75)

        Wait(sleep)

        Scene.SetSpotlightState(2, true)
        Scene.SetSpotlightState(3, true)

        Scene.LerpCallback(0, 255, msOn, 75, function(val)
            val = tonumber(tostring(Round(val)):sub(1, -3))
            val = val and val > 255 and 255 or val

            Scene.SetSpotlightColor(2, {val, val, val})
            Scene.SetSpotlightColor(3, {val, val, val})
        end, nil, function()
            Scene.LerpCallback(255, 0, msOff, 75, function(val)
                val = tonumber(tostring(Round(val)):sub(1, -3))
                val = val and val > 0 and val or 0

                Scene.SetSpotlightColor(2, {val, val, val})
                Scene.SetSpotlightColor(3, {val, val, val})
            end)
        end)
    end

    local staticRegisters = {
        ['init'] = {
            hittableAt = 102,
            hittableUntil = 240,
    
            fn = function()
                Scene.SetIdleWallpaperUrl('none')
    
                for i = 1, #spotlights do
                    Scene.SetSpotlightState(i, false)
                end
    
                Scene.SetVideoToggle(false)
                Scene.SetSpotlightsSettings(false, false, false)
            end
        },

        ['hype'] = {
            hittableAt = 239,
    
            fn = function()
                Wait(750)

                Scene.TriggerSparklers({255, 255, 255})
                Scene.TriggerSmoke({255, 255, 255})

                for i = 1, #spotlights do
                    Scene.SetSpotlightState(i, nil)
                    Scene.SetSpotlightColor(i, nil)
                end
    
                Scene.SetSpotlightsSettings(false, false, true)
                Scene.SetSmokeBassSettings(nil)
                Scene.SetSparklersBassSettings(nil)
                Scene.SetVideoToggle(true)
            end
        },

        ['end'] = {
            hittableAt = 314,
    
            fn = function()
                Wait(250)

                Scene.TriggerSparklers({255, 255, 255})
                Scene.TriggerSmoke({255, 255, 255})

                for i = 1, #speakers do
                    Scene.SetSpeakerVolume(i, 1.25)
                end
            end
        }
    }

    local dynamicRegisters = {
        [133] = {
            fn = function()
                Wait(200)
                Scene.SetVideoToggle(true)
                Wait(200)
                Scene.SetVideoToggle(false)
                Wait(200)
                Scene.SetVideoToggle(true)
                Wait(200)
                Scene.SetVideoToggle(false)
                Wait(200)
                Scene.SetVideoToggle(true)
                Wait(200)
                Scene.SetVideoToggle(false)
            end
        },

        [136] = {
            fn = function()
                Wait(750)

                for ii = 1, 7 do
                    for i = 1, #spotlights do
                        Scene.SetSpotlightState(i, true)
                        Scene.SetSpotlightColor(i, {255, 255, 255})
                    end
    
                    Wait(100)

                    for i = 1, #spotlights do
                        Scene.SetSpotlightColor(i, {0, 0, 0})
                    end

                    Wait(50)
                end
            end
        },

        [140] = {
            fn = function()
                Wait(750)

                for ii = 1, 6 do
                    for i = 1, #spotlights do
                        Scene.SetSpotlightState(i, true)
                        Scene.SetSpotlightColor(i, {0, 255, 0})

                        Wait(50)

                        Scene.SetSpotlightColor(i, {0, 0, 0})
                    end

                    Wait(10)
                end
            end
        },

        [145] = {
            fn = function()
                Wait(50)
                Scene.SetIdleWallpaperUrl('https://i.ibb.co/JFSzFyp1/9XFQNQk.gif')
                Wait(2850)
                Scene.SetIdleWallpaperUrl('none')
            end
        },

        [151] = {
            fn = function()
                Wait(500)
                Scene.TriggerSparklers({255, 255, 255})
            end
        },

        [183] = {
            fn = function()
                for i = 1, #spotlights do
                    Scene.SetSpotlightState(i, true)
                    Scene.SetSpotlightColor(i, {0, 0, 0})
                end

                Wait(550)

                Scene.LerpCallback(255, 0, 1750, 75, function(val)
                    val = tonumber(tostring(Round(val)):sub(1, -3))
                    val = val and val > 0 and val or 0

                    for i = 1, #spotlights do
                        Scene.SetSpotlightColor(i, {val, val, val})
                    end
                end)
            end
        },

        [187] = {
            fn = function()
                ListenLeft(4200, 2250, 500)
            end
        },

        [194] = {
            fn = function()
                ListenRight(4400, 2250, 500)
            end
        },

        [203] = {
            fn = function()
                ListenLeft(850, 750, 400)
            end
        },

        [206] = {
            fn = function()
                ListenRight(1500, 750, 400)
            end
        },

        [210] = {
            fn = function()
                ListenLeft(1200, 650, 300)
            end
        },

        [214] = {
            fn = function()
                ListenRight(1000, 650, 300)
            end
        },

        [217] = {
            fn = function()
                ListenLeft(950, 500, 250)
            end
        },

        [219] = {
            fn = function()
                ListenRight(800, 500, 250)
            end
        },

        [221] = {
            fn = function()
                ListenLeft(550, 400, 200)
            end
        },

        [223] = {
            fn = function()
                ListenRight(550, 400, 200)
            end
        },

        [225] = {
            fn = function()
                Scene.SetSpotlightState(2, true)
                Scene.SetSpotlightState(3, true)
                Scene.SetSpotlightState(4, true)
                Scene.SetSpotlightState(5, true)

                for i = 1, 8 do
                    SpotlightsLeft()
                    Wait(220)
                    SpotlightsOff()
                    Wait(220)
                    SpotlightsRight()
                    Wait(220)
                    SpotlightsOff()
                    Wait(220)
                end

                Wait(30)

                for i = 1, 8 do
                    SpotlightsLeft()
                    Wait(125)
                    SpotlightsOff()
                    Wait(125)
                    SpotlightsRight()
                    Wait(125)
                    SpotlightsOff()
                    Wait(125)
                end

                Wait(30)

                for i = 1, 3 do
                    SpotlightsLeft()
                    Wait(100)
                    SpotlightsOff()
                    Wait(100)
                    SpotlightsRight()
                    Wait(100)
                    SpotlightsOff()
                    Wait(100)
                end
            end
        }
    }

    while (Scene.active and Scene.identifier == identifier) do
        if (Scene.enabled) then
            for k, v in pairs(staticRegisters) do
                if (Scene.time and Scene.time >= v.hittableAt and (not v.hittableUntil or Scene.time <= v.hittableUntil) and (not v.hit)) then
                    v.hit = true

                    CreateThread(function()
                        v.fn()
                    end)
                end
            end

            for k, v in pairs(dynamicRegisters) do
                if (Scene.time and Scene.time >= (k - 1) and Scene.time <= k and (not v.hit)) then
                    v.hit = 1
                elseif (Scene.time and Scene.time >= k and v.hit == 1) then
                    v.hit = 2

                    CreateThread(function()
                        v.fn()
                    end)
                elseif (Scene.time and Scene.time >= k + 1) then
                    v.hit = 2
                end
            end
        end

        Wait(250)
    end
end)

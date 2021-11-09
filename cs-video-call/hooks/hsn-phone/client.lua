return function(resource)
    local originalSetNuiFocusKeepInput = _G.SetNuiFocusKeepInput
    local lastNuiFocusKeepInputState = false

    _G.SetNuiFocusKeepInput = function(state)
        lastNuiFocusKeepInputState = state

        if (not CS_VIDEO_CALL.ACTIVE) then
            originalSetNuiFocusKeepInput(state)
        end
    end

    RegisterNetEvent('cs-video-call:custom:setCallee')
    AddEventHandler('cs-video-call:custom:setCallee', function(target)
        CS_VIDEO_CALL.SetCallState(true)
        CS_VIDEO_CALL.SetCallee(target)
    end)

    RegisterNetEvent('hsn-phone-client-answercall')
    AddEventHandler('hsn-phone-client-answercall', function(type, photo, id)
        if (type ~= 'accept') then
            CS_VIDEO_CALL.SetCallState(false)
            CS_VIDEO_CALL.ClearCallee()
        end
    end)

    AddEventHandler('cs-video-call:onVideoOn', function()
        -- The player has opened the video call camera.

        originalSetNuiFocusKeepInput(true) -- Allow control to pass through NUI.

        CreateThread(function()
            local renderId = GetMobilePhoneRenderId()

            while (CS_VIDEO_CALL.ACTIVE) do
                -- Hide HUD and allow mouse controls. 
                EnableControlAction(0, 1, true)
                EnableControlAction(0, 2, true)
                HideHudAndRadarThisFrame()
                SetDrawOrigin(0.0, 0.0, 0.0, 0)
                DisableControlAction(0, 199, true)
                DisableControlAction(0, 200, true)
                SetTextRenderId(renderId)
                Wait(0)
            end

            SetTextRenderId(1)
        end)
    end)
    
    AddEventHandler('cs-video-call:onVideoOff', function()
        -- The player has closed the video call camera.
        originalSetNuiFocusKeepInput(lastNuiFocusKeepInputState)
    end)

    CreateThread(function()
        CS_VIDEO_CALL.SetKeyLabels(false) -- Setting this to true will label all the buttons with their respective keys.
    end)
end

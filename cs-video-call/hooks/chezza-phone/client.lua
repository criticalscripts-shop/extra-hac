return function(resource)
    local originalSendNUIMessage = _G.SendNUIMessage
    local originalSetNuiFocusKeepInput = _G.SetNuiFocusKeepInput
    local lastNuiFocusKeepInputState = false

    _G.SendNUIMessage = function(data)
        if (data.method == 'open' and (not data.data) and CS_VIDEO_CALL.ACTIVE) then
            exports[resource]:StopVideoTransmission()
        end

        originalSendNUIMessage(data)
    end

    _G.SetNuiFocusKeepInput = function(state)
        lastNuiFocusKeepInputState = state

        if (not CS_VIDEO_CALL.ACTIVE) then
            originalSetNuiFocusKeepInput(state)
        end
    end

    RegisterNetEvent('phone:call', function(data)
        TriggerServerEvent('cs-video-call:custom:setCallId', data.CallID, data.incoming)
    end)

    RegisterNetEvent('phone:answerCall', function(callId)
        TriggerServerEvent('cs-video-call:custom:callAnswered', callId)
    end)

    RegisterNetEvent('phone:endCall', function(callId)
        TriggerServerEvent('cs-video-call:custom:clearCallId', callId)
    end)

    RegisterNetEvent('cs-video-call:custom:setCallee', function(target)
        CS_VIDEO_CALL.SetCallState(true)
        CS_VIDEO_CALL.SetCallee(target)
    end)

    RegisterNetEvent('cs-video-call:custom:clearCallee', function()
        CS_VIDEO_CALL.SetCallState(false)
        CS_VIDEO_CALL.ClearCallee()
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

return function(resource)
    local activeCalls = {}

    RegisterNetEvent('phone-events:phone:answerCall', function(ticket, number)
        local source = source
        local phone = GetPlayerPhone(source)
        local target = GetPlayerFromPhone(number)

        TriggerClientEvent('cs-video-call:custom:setCallee', source, target)
        TriggerClientEvent('cs-video-call:custom:setCallee', target, source)
    end)

    RegisterNetEvent('phone-events:phone:declineCall', function(ticket, number)
        local source = source
        local phone = GetPlayerPhone(source)
        local target = GetPlayerFromPhone(number)

        TriggerClientEvent('cs-video-call:custom:clearCallee', source)

        if (target) then
            TriggerClientEvent('cs-video-call:custom:clearCallee', target)
        end
    end)

    RegisterNetEvent('cs-video-call:custom:setCallId', function(callId, incoming)
        local source = source

        if (not activeCalls[callId]) then
            activeCalls[callId] = {}
        end

        activeCalls[callId][incoming and 'callee' or 'caller'] = tonumber(source)

        if (activeCalls[callId].answered) then
            TriggerClientEvent('cs-video-call:custom:setCallee', activeCalls[callId].caller, activeCalls[callId].callee)
            TriggerClientEvent('cs-video-call:custom:setCallee', activeCalls[callId].callee, activeCalls[callId].caller)
        end
    end)

    RegisterNetEvent('cs-video-call:custom:callAnswered', function(callId)
        local source = source

        if (not activeCalls[callId]) then
            activeCalls[callId] = {}
        end

        activeCalls[callId].answered = true

        if (activeCalls[callId].callee and activeCalls[callId].caller) then
            TriggerClientEvent('cs-video-call:custom:setCallee', activeCalls[callId].caller, activeCalls[callId].callee)
            TriggerClientEvent('cs-video-call:custom:setCallee', activeCalls[callId].callee, activeCalls[callId].caller)
        end
    end)

    RegisterNetEvent('cs-video-call:custom:clearCallId', function(callId)
        local source = source

        if (activeCalls[callId]) then
            if (activeCalls[callId].caller) then
                TriggerClientEvent('cs-video-call:custom:clearCallee', activeCalls[callId].caller)
            end

            if (activeCalls[callId].callee) then
                TriggerClientEvent('cs-video-call:custom:clearCallee', activeCalls[callId].callee)
            end

            activeCalls[callId] = nil
        end
    end)

    AddEventHandler('playerDropped', function(reason)
        local source = source

        for k, v in pairs(activeCalls) do
            if (v.caller == source or v.callee == source) then
                if (v.caller ~= source) then
                    TriggerClientEvent('cs-video-call:custom:clearCallee', activeCalls[callId].caller)
                end
                
                if (v.callee ~= source) then
                    TriggerClientEvent('cs-video-call:custom:clearCallee', activeCalls[callId].callee)
                end

                activeCalls[k] = nil
            end
        end
    end)
end

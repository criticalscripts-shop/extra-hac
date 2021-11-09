return function(resource)
    RegisterServerEvent('phone-events:phone:answerCall')
    AddEventHandler('phone-events:phone:answerCall', function(ticket, number)
        local source = source
        local phone = GetPlayerPhone(source)
        local target = GetPlayerFromPhone(number)

        TriggerClientEvent('cs-video-call:custom:setCallee', source, target)
        TriggerClientEvent('cs-video-call:custom:setCallee', target, source)
    end)

    RegisterServerEvent('phone-events:phone:declineCall')
    AddEventHandler('phone-events:phone:declineCall', function(ticket, number)
        local source = source
        local phone = GetPlayerPhone(source)
        local target = GetPlayerFromPhone(number)

        TriggerClientEvent('cs-video-call:custom:clearCallee', source, nil)

        if (target) then
            TriggerClientEvent('cs-video-call:custom:clearCallee', target, source)
        end
    end)
end

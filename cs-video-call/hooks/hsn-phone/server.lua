return function(resource)
    RegisterServerEvent('hsn-phone-server-answercall')
    AddEventHandler('hsn-phone-server-answercall', function(type)
        local player = source

        if (type == 'accept') then
            for k, v in pairs(PhoneCalls) do
                if (v.targetSrc == player)then
                    TriggerClientEvent('cs-video-call:custom:setCallee', v.src, v.targetSrc)
                    TriggerClientEvent('cs-video-call:custom:setCallee', v.targetSrc, v.src)
                    break
                end
            end
        end
    end)
end

return function(resource)
    RegisterNetEvent('d-phone:server:acceptcall', function(src, req, reqn, srcn, cn)
        TriggerClientEvent('cs-video-call:custom:setCallee', src, req)
        TriggerClientEvent('cs-video-call:custom:setCallee', req, src)
    end)

    RegisterNetEvent('d-phone:server:endcall', function(src, req)
        TriggerClientEvent('cs-video-call:custom:clearCallee', src)
        TriggerClientEvent('cs-video-call:custom:clearCallee', req)
    end)
end

return function(resource)
    local nnCoreFramework = nil
    
    if (NNCore) then
        nnCoreFramework = NNCore
    else
        TriggerEvent('NNCore:GetObject', function(obj)
            nnCoreFramework = obj
        end)
    
        if (not nnCoreFramework) then
            nnCoreFramework = exports['nn-core']:GetCoreObject()
        end
    end

    function ParseCallContact(TargetData, CallId, AnonymousCall)
        local player = source
        local target = nnCoreFramework.Functions.GetPlayerByPhone(TargetData.number)

        if (target ~= nil and (target.PlayerData and target.PlayerData.source or target.source)) then
            TriggerClientEvent('cs-video-call:custom:setCallee', player, target.PlayerData and target.PlayerData.source or target.source)
            TriggerClientEvent('cs-video-call:custom:setCallee', target.PlayerData and target.PlayerData.source or target.source, player)
        end
    end

    function ParseSetCallState(bool)
        local src = source

        if (not bool) then
            TriggerClientEvent('cs-video-call:custom:clearCallee', src)
        end
    end

    RegisterServerEvent('nn-phone:server:CallContact')
    RegisterServerEvent('nn-phone:server:SetCallState')

    AddEventHandler('nn-phone:server:CallContact', ParseCallContact)
    AddEventHandler('nn-phone:server:SetCallState', ParseSetCallState)
end

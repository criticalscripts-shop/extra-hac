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

    exports[resource]:GetStoryPlayerName(function(source)
        -- You can replace a story's author name parser here, this will be stored in a story's metadata and you cannot change it on-demand.

        local info = nnCoreFramework.Functions.GetPlayer(tonumber(source))

        if (info) then
            info = info.PlayerData.charinfo

            if (info) then
                if (info.firstname and info.lastname) then
                    return info.firstname .. ' ' .. info.lastname
                elseif (info.firstname) then
                    return info.firstname
                elseif (info.lastname) then
                    return info.lastname
                end
            end
        end

        return GetPlayerName(source)
    end)

    RegisterCommand('delete-phone-story', function(source, args, raw) -- The default way of deleting a story, an Ace-restricted command.
        if ((not args[1]) or (not tonumber(args[1]))) then
            TriggerClientEvent('NNCore:Notify', source, 'Phone Stories: Missing or invalid story hashtag ID!', 'error')
        elseif (exports[resource]:DeleteStory(tonumber(args[1]))) then -- You can call this export manually, if it returns true the story has been deleted successfully otherwise the story does not exist.
            TriggerClientEvent('NNCore:Notify', source, 'Phone Stories: You deleted story #' .. args[1] .. '!')
        else
            TriggerClientEvent('NNCore:Notify', source, 'Phone Stories: Story #' .. args[1] .. ' could not be found!', 'error')
        end
    end, true)

    AddEventHandler('cs-stories:onStoryAdded', function(data)
        -- A story was added by a player, could be us or could be someone else.
        -- You can use this event to perform a notification for example if you want players to see a story was uploaded.
    end)

    AddEventHandler('cs-stories:onStoryDeleted', function(data)
        -- A story was deleted (using the internal delete method).
        -- You can use this event to perform a notification for example if you want players to see a story was deleted.
    end)

    -- "cs-stories:notify" is a client event that you can use to show native GTA notifications. It is used by default for cs-stories notifications.
end

-- Server-side checks and integration of how the hall UI is accessed.
-- Do whatever checks you want here and execute TriggerEvent('cs-hall:toggleControllerInterface', source, area) with source being the player ID and area being the config's entry key (e.g. "vanilla") to open the hall UI in a player.
-- If your checks fail, execute TriggerEvent('cs-hall:disallowControllerInterface', source) to block remove the controller access (e.g. in case of a dynamic check being updated).
-- The default integration triggers this via the client command hall and does a perform native death check (client-side) and a permission check (server-side).
-- To allow all admins (using Ace group admin) to perform controller duties in all areas, add "add_ace group.admin cs-hall.control allow" in your server's config file.
-- Alternatively to Ace permissions in the default integration, you can add any player identifiers to the array playerIdentifiersAsControllers below to allow specific players to perform controller duties in all areas.
-- You can keep the default integration and edit the default CanAccessControllerInterface function and return true / false based on your conditions.

local playerIdentifiersAsControllers = {
    'steam:000000000000000', -- Example Steam player identifier.
    'fivem:000000', -- Example FiveM player identifier.
}

local qbJobGlobalControllers = { -- QB jobs that can access /hall is all areas.
    {'dj', 2}, -- QB "dj" job with 2 grade level can access /hall in all areas.
    'dj' -- QB "dj" job can access /hall in all areas regardless of grade level.
}

local qbJobAreaControllers = { -- QB jobs that can access /hall is specific areas.
    ['vanilla_unicorn'] = { -- Remove this to disable it, or add more entries as you wish.
        {'unicorn', 2}, -- QB "unicorn" job with 2 grade level can access "vanilla_unicorn" area.
        'dj' -- QB "dj" job can access /hall in "vanilla_unicorn" regardless of grade level.
    }
}

local qbCoreFramework = nil
    
if (QBCore) then
    qbCoreFramework = QBCore
else
    TriggerEvent('QBCore:GetObject', function(obj)
        qbCoreFramework = obj
    end)

    if (not qbCoreFramework) then
        qbCoreFramework = exports['qb-core']:GetCoreObject()
    end
end

function CanAccessControllerInterface(source, area)
    if (IsPlayerAceAllowed(source, 'cs-hall.control')) then
        return true
    end

    for i = 1, #playerIdentifiersAsControllers do
        for ii, identifier in ipairs(GetPlayerIdentifiers(source)) do
            if (string.lower(identifier) == string.lower(playerIdentifiersAsControllers[i])) then
                return true
            end
        end
    end

    if (qbCoreFramework) then
        local qbPlayer = qbCoreFramework.Functions.GetPlayer(source)
        local qbJob = qbPlayer and (qbPlayer.PlayerData and qbPlayer.PlayerData.job or qbPlayer.job)
        local qbGang = qbPlayer and (qbPlayer.PlayerData and qbPlayer.PlayerData.gang or qbPlayer.gang)
        local qbJobName = qbJob and qbJob.name and qbGang and qbGang.name
        local qbJobGrade = qbJob and qbJob.grade and qbJob.grade.level and qbGang.grade and qbGang.grade.level

        if (qbJobName and qbJobGrade) then
            for i = 1, #qbJobGlobalControllers do
                local qbAreaEntry = qbJobGlobalControllers[i]

                if ((type(qbAreaEntry) == 'string' and qbAreaEntry == qbJobName) or (type(qbAreaEntry) == 'table' and qbAreaEntry[1] == qbJobName and qbAreaEntry[2] == qbJobGrade)) then
                    return true
                end
            end

            for k, v in pairs (qbJobAreaControllers) do
                if (k == area) then
                    for i = 1, #v do
                        local qbAreaEntry = v[i]
        
                        if ((type(qbAreaEntry) == 'string' and qbAreaEntry == qbJobName) or (type(qbAreaEntry) == 'table' and qbAreaEntry[1] == qbJobName and qbAreaEntry[2] == qbJobGrade)) then
                            return true
                        end
                    end
                end
            end
        end
    end

    return false
end

RegisterNetEvent('cs-hall:integration:toggleControllerInterface', function(area)
    local source = source

    if (CanAccessControllerInterface(source, area)) then
        TriggerEvent('cs-hall:toggleControllerInterface', source, area)
    else
        TriggerEvent('cs-hall:disallowControllerInterface', source)
    end
end)

-- Storing & deleting tablet object code.

local activeControllerInterfaceObjects = {}

RegisterNetEvent('cs-hall:integration:onControllerInterfaceObjectCreated', function(objectNetId)
    local source = source
    activeControllerInterfaceObjects[source] = objectNetId
end)

AddEventHandler('playerDropped', function(reason)
    local source = source

    if (activeControllerInterfaceObjects[source]) then
        local entity = NetworkGetEntityFromNetworkId(activeControllerInterfaceObjects[source])

        if (entity > 0 and DoesEntityExist(entity)) then
            DeleteEntity(entity)
        end

        activeControllerInterfaceObjects[source] = nil
    end
end)

-- Server Events

AddEventHandler('cs-hall:onPlay', function(area, source, data)
    -- Triggered when play is triggered either manually or via an export.
    -- The area indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.

    --[[
        data 
            .url                    -- The URL of the entry (as received via a client or an export).
            .thumbnailUrl           -- The URL of the entry's thumbnail (as received via a client or an export).
            .thumbnailTitle         -- The title of the entry's thumbnail (as received via a client or an export).
            .title                  -- The title of the entry (as received via a client or an export).
            .icon                   -- The icon of the entry (as received via a client or an export).
    ]]
end)

AddEventHandler('cs-hall:onPause', function(area, source, data)
    -- Triggered when pause is triggered either manually or via an export.
    -- The area indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.

    --[[
        data 
            .url                    -- The URL of the entry (as received via a client or an export).
            .thumbnailUrl           -- The URL of the entry's thumbnail (as received via a client or an export).
            .thumbnailTitle         -- The title of the entry's thumbnail (as received via a client or an export).
            .title                  -- The title of the entry (as received via a client or an export).
            .icon                   -- The icon of the entry (as received via a client or an export).
    ]]
end)

AddEventHandler('cs-hall:onStop', function(area, source, data)
    -- Triggered when stop is triggered either manually, automatically (stopped due to end / error etc.) or via an export.
    -- The area indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.

    --[[
        data 
            .url                    -- The URL of the entry (as received via a client or an export).
            .thumbnailUrl           -- The URL of the entry's thumbnail (as received via a client or an export).
            .thumbnailTitle         -- The title of the entry's thumbnail (as received via a client or an export).
            .title                  -- The title of the entry (as received via a client or an export).
            .icon                   -- The icon of the entry (as received via a client or an export).
    ]]
end)

AddEventHandler('cs-hall:onDuration', function(area, source, duration)
    -- Triggered when duration is set for the current entry via a client.
    -- This does not trigger via an export.
    -- The area indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.
    -- The duration is in seconds. If this event is not triggered within a timely manner we can assume that the responsible update client failed to retrieve the duration of the entry.
end)

AddEventHandler('cs-hall:onEntryQueued', function(area, source, data)
    -- Triggered when an entry is added to queue either manually or via an export.
    -- This does not trigger when an entry changes position.
    -- The area indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.

    --[[
        data 
            .url                    -- The URL of the entry (as received via a client or an export).
            .thumbnailUrl           -- The URL of the entry's thumbnail (as received via a client or an export).
            .thumbnailTitle         -- The title of the entry's thumbnail (as received via a client or an export).
            .title                  -- The title of the entry (as received via a client or an export).
            .icon                   -- The icon of the entry (as received via a client or an export).
            .position               -- The position of the entry in the queue.
            .manual                 -- Whether this entry was manually added. If this is false it indicates it was added via an export.
    ]]
end)

AddEventHandler('cs-hall:onEntryRemoved', function(area, source, data)
    -- Triggered when an entry is removed from queue either manually or via an export.
    -- This does not trigger when an entry is moved from the queue to the player or when an entry changes position.
    -- The area indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.

    --[[
        data 
            .url                    -- The URL of the entry (as received via a client or an export).
            .thumbnailUrl           -- The URL of the entry's thumbnail (as received via a client or an export).
            .thumbnailTitle         -- The title of the entry's thumbnail (as received via a client or an export).
            .title                  -- The title of the entry (as received via a client or an export).
            .icon                   -- The icon of the entry (as received via a client or an export).
            .position               -- The position of the entry in the queue.
            .manual                 -- Whether this entry was manually added. If this is false it indicates it was added via an export.
    ]]
end)

-- Server Exports

--[[
    exports['cs-hall']:Play(area)                               -- Trigger a play action in the specified area. The area is the config entry's key.
    exports['cs-hall']:Pause(area)                              -- Trigger a pause action in the specified area. The area is the config entry's key.
    exports['cs-hall']:Stop(area)                               -- Trigger a stop action in the specified area. The area is the config entry's key.
    exports['cs-hall']:IsPlaying(area)                          -- Returns whether an entry is playing in the specified area. The area is the config entry's key.
    exports['cs-hall']:SetLoop(area, state)                     -- Sets the player loop state of the specified area. The area is the config entry's key. The state is a boolean indicating the loop state.

    exports['cs-hall']:AddToQueue(                              -- Adds a new entry to the specified area's queue.
        area,               -- The config entry's key.
        url,                -- The URL of the entry.
        thumbnailUrl,       -- The thumbnail URL of the entry.
        thumbnailTitle,     -- The thumbnail title of the entry.
        title,              -- The title of the entry.
        icon,               -- The icon of the entry.
        duration            -- The duration of the entry (in seconds).
    )

    exports['cs-hall']:QueueNow(area, position)                 -- Queues an entry to the specified area's queue in the specified queue position. The area is the config entry's key.
    exports['cs-hall']:RemoveFromQueue(area, position)          -- Removes an entry from the specified area's queue in the specified queue position. The area is the config entry's key.

    exports['cs-hall']:GetPlayer(area)                          -- Returns the entry in the player of the specified area in an object with the following data structure.
                                                                {
                                                                    playing,            -- Whether the player is playing or not.
                                                                    stopped,            -- Whether the player is stopped or not.
                                                                    volume,             -- The volume of the player (0.0 to 1.0).
                                                                    loop,               -- The loop state of the player.
                                                                    url,                -- The URL of the entry (as received via a client or an export).
                                                                    thumbnailUrl,       -- The thumbnail URL of the entry (as received via a client or an export).
                                                                    thumbnailTitle,     -- The thumbnail title of the entry (as received via a client or an export).
                                                                    title,              -- The title of the entry (as received via a client or an export).
                                                                    icon,               -- The icon of the entry (as received via a client or an export).
                                                                    time,               -- The current time of the entry (in seconds) (as received via a client or as measured by the server). 
                                                                    duration            -- The duration of the entry (in seconds) (as received via a client or an export). 
                                                                }

    exports['cs-hall']:GetQueue(area)                           -- Returns the queue of the specified area in an array of objects with the following data structure for each object.
                                                                {
                                                                    url,                -- The URL of the entry (as received via a client or an export).
                                                                    thumbnailUrl,       -- The thumbnail URL of the entry (as received via a client or an export).
                                                                    thumbnailTitle,     -- The thumbnail title of the entry (as received via a client or an export).
                                                                    title,              -- The title of the entry (as received via a client or an export).
                                                                    icon,               -- The icon of the entry (as received via a client or an export).
                                                                    duration,           -- The duration of the entry (in seconds) (as received via an export; nil if received via a client). 
                                                                    manual              -- Whether this entry was manually added. If this is false it indicates it was added via an export.
                                                                }
]]

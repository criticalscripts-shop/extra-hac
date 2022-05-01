-- Server-side checks and integration of how the VES UI is accessed.
-- Do whatever checks you want here and execute TriggerEvent('cs-ves:toggleControllerInterface', source, plate) with source being the player ID and plate being the config's entry key (e.g. "vanilla") to open the VES UI in a player.
-- If your checks fail, execute TriggerEvent('cs-ves:disallowControllerInterface', source) to block remove the controller access (e.g. in case of a dynamic check being updated).
-- The default integration triggers this via the client command VES and does a perform native death check (client-side) and a permission check (server-side).
-- To allow all admins (using Ace group admin) to perform controller duties in all vehicle plates, add "add_ace group.admin cs-ves.control allow" in your server's config file.
-- Alternatively to Ace permissions in the default integration, you can add any player identifiers to the array playerIdentifiersAsControllers below to allow specific players to perform controller duties in all vehicle plates.
-- You can keep the default integration and edit the default CanAccessControllerInterface function and return true / false based on your conditions.

local playerIdentifiersAsControllers = {
    'steam:000000000000000', -- Example Steam player identifier.
    'fivem:000000', -- Example FiveM player identifier.
}

local qbJobGlobalControllers = { -- QB jobs that can access /ves is all vehicle plates.
    {'dj', 2}, -- QB "dj" job with 2 grade level can access /ves in all vehicle plates.
    'dj' -- QB "dj" job can access /ves in all vehicle plates regardless of grade level.
}

local qbJobPlateControllers = { -- QB jobs that can access /ves is specific vehicle plates.
    ['PLATE1234'] = { -- Remove this to disable it, or add more entries as you wish.
        {'unicorn', 2}, -- QB "unicorn" job with 2 grade level can access "PLATE1234" vehicle plate.
        'dj' -- QB "dj" job can access /ves in "PLATE1234" vehicle plate regardless of grade level.
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

function CanAccessControllerInterface(source, plate)
    if (IsPlayerAceAllowed(source, 'cs-ves.control')) then
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
        local qbJobName = qbPlayer and qbPlayer.job and qbPlayer.job.name
        local qbJobGrade = qbPlayer and qbPlayer.job and qbPlayer.job.grade and qbPlayer.job.grade.level

        if (qbJobName and qbJobGrade) then
            for i = 1, #qbJobGlobalControllers do
                local qbPlateEntry = qbJobGlobalControllers[i]

                if ((type(qbPlateEntry) == 'string' and qbPlateEntry == qbJobName) or (type(qbPlateEntry) == 'table' and qbPlateEntry[1] == qbJobName and qbPlateEntry[2] == qbJobGrade)) then
                    return true
                end
            end

            for k, v in pairs (qbJobPlateControllers) do
                if (k == plate) then
                    for i = 1, #v do
                        local qbPlateEntry = v[i]
        
                        if ((type(qbPlateEntry) == 'string' and qbPlateEntry == qbJobName) or (type(qbPlateEntry) == 'table' and qbPlateEntry[1] == qbJobName and qbPlateEntry[2] == qbJobGrade)) then
                            return true
                        end
                    end
                end
            end
        end
    end

    return false
end

RegisterNetEvent('cs-ves:integration:toggleControllerInterface', function(plate)
    local source = source

    if (CanAccessControllerInterface(source, plate)) then
        TriggerEvent('cs-ves:toggleControllerInterface', source, plate)
    else
        TriggerEvent('cs-ves:disallowControllerInterface', source, plate)
    end
end)

-- Server Events

AddEventHandler('cs-ves:onPlay', function(plate, source, data)
    -- Triggered when play is triggered either manually or via an export.
    -- The plate indicates which entry config key the action triggered for.
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

AddEventHandler('cs-ves:onPause', function(plate, source, data)
    -- Triggered when pause is triggered either manually or via an export.
    -- The plate indicates which entry config key the action triggered for.
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

AddEventHandler('cs-ves:onStop', function(plate, source, data)
    -- Triggered when stop is triggered either manually, automatically (stopped due to end / error etc.) or via an export.
    -- The plate indicates which entry config key the action triggered for.
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

AddEventHandler('cs-ves:onDuration', function(plate, source, duration)
    -- Triggered when duration is set for the current entry via a client.
    -- This does not trigger via an export.
    -- The plate indicates which entry config key the action triggered for.
    -- If the source is nil then this action was triggered via an export otherwise it is the source player.
    -- The duration is in seconds. If this event is not triggered within a timely manner we can assume that the responsible update client failed to retrieve the duration of the entry.
end)

AddEventHandler('cs-ves:onEntryQueued', function(plate, source, data)
    -- Triggered when an entry is added to queue either manually or via an export.
    -- This does not trigger when an entry changes position.
    -- The plate indicates which entry config key the action triggered for.
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

AddEventHandler('cs-ves:onEntryRemoved', function(plate, source, data)
    -- Triggered when an entry is removed from queue either manually or via an export.
    -- This does not trigger when an entry is moved from the queue to the player or when an entry changes position.
    -- The plate indicates which entry config key the action triggered for.
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
    exports['cs-ves']:Play(plate)                               -- Trigger a play action in the specified plate. The plate is the config entry's key.
    exports['cs-ves']:Pause(plate)                              -- Trigger a pause action in the specified plate. The plate is the config entry's key.
    exports['cs-ves']:Stop(plate)                               -- Trigger a stop action in the specified plate. The plate is the config entry's key.
    exports['cs-ves']:IsPlaying(plate)                          -- Returns whether an entry is playing in the specified plate. The plate is the config entry's key.
    exports['cs-ves']:SetLoop(plate, state)                     -- Sets the player loop state of the specified plate. The plate is the config entry's key. The state is a boolean indicating the loop state.

    exports['cs-ves']:AddToQueue(                              -- Adds a new entry to the specified plate's queue.
        plate,               -- The config entry's key.
        url,                -- The URL of the entry.
        thumbnailUrl,       -- The thumbnail URL of the entry.
        thumbnailTitle,     -- The thumbnail title of the entry.
        title,              -- The title of the entry.
        icon,               -- The icon of the entry.
        duration            -- The duration of the entry (in seconds).
    )

    exports['cs-ves']:QueueNow(plate, position)                 -- Queues an entry to the specified plate's queue in the specified queue position. The plate is the config entry's key.
    exports['cs-ves']:RemoveFromQueue(plate, position)          -- Removes an entry from the specified plate's queue in the specified queue position. The plate is the config entry's key.

    exports['cs-ves']:GetPlayer(plate)                          -- Returns the entry in the player of the specified plate in an object with the following data structure.
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

    exports['cs-ves']:GetQueue(plate)                           -- Returns the queue of the specified plate in an array of objects with the following data structure for each object.
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

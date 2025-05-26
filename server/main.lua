RegisterServerEvent('cfx-leon-dcpresence:UpdatePresence')
AddEventHandler('cfx-leon-dcpresence:UpdatePresence', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end

    local job = xPlayer.getJob() or { name = 'unknown', grade_label = 'N/A', label = 'Unemployed' }
    local group = xPlayer.getGroup and xPlayer.getGroup() or 'user'
    local isAdmin = false

    -- Admin Group Check
    if Config.UseAdminTags then
        for _, adminGroup in pairs(Config.AdminGroups) do
            if string.lower(group) == string.lower(adminGroup) then
                isAdmin = true
                break
            end
        end
    end

    -- Player Identity
    local playerName = GetPlayerName(_source)
    if isAdmin and Config.AdminRichPresencePrefix then
        playerName = Config.AdminRichPresencePrefix .. playerName
    end

    local identityName = xPlayer.getName() or playerName

    -- Send presence data
    local data = {
        PlayerName = playerName,
        IdentityName = identityName,
        Job = {
            jobName = job.name,
            jobGrade = job.grade_label,
            jobLabel = job.label
        },
        ActivePlayers = GetNumPlayerIndices(),
        IsAdmin = isAdmin
    }

    TriggerClientEvent('cfx-leon-dcpresence:SetPresence', _source, data)

    if Config.DebugPresence then
        print(('[DRP] Sent data to %s | Admin: %s | Job: %s (%s)')
            :format(playerName, tostring(isAdmin), job.label, job.grade_label))
    end
end)

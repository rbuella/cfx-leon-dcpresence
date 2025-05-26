local playerLoaded = false
local firstSpawn = true

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    playerLoaded = true
end)

AddEventHandler('playerSpawned', function()
    if firstSpawn then
        for _, v in pairs(Config.Buttons) do
            SetDiscordRichPresenceAction(v.index, v.name, v.url)
        end
        firstSpawn = false
    end
end)

RegisterNetEvent('cfx-leon-dcpresence:SetPresence')
AddEventHandler('cfx-leon-dcpresence:SetPresence', function(data)
    local player = PlayerId()

    -- Base Presence Setup
    SetDiscordAppId(Config.ClientID)
    SetDiscordRichPresenceAsset(Config.LargeAssetName or 'logo1')
    SetDiscordRichPresenceAssetText(Config.LargeAssetText or 'ELRP')

    -- Small Icon: Admin or Job
    if Config.UseAdminTags and data.IsAdmin then
        SetDiscordRichPresenceAssetSmall(Config.AdminIcon or 'staff')
        SetDiscordRichPresenceAssetSmallText(Config.AdminText or 'Staff Member')
    elseif Config.UseJobs and data.Job then
        SetDiscordRichPresenceAssetSmall(data.Job.jobName or 'unknown')
        SetDiscordRichPresenceAssetSmallText((data.Job.jobLabel or 'Unknown') .. " - " .. (data.Job.jobGrade or 'N/A'))
    end

    -- Main Rich Presence text
    local presenceText = string.format(
        Config.RichPresence,
        GetPlayerServerId(player),
        Config.UseESXIdentity and data.IdentityName or data.PlayerName,
        Config.PlayerText,
        data.ActivePlayers,
        Config.PlayerCount
    )
    SetRichPresence(presenceText)

    if Config.DebugPresence then
        print("[DRP] Presence updated for: " .. presenceText)
    end
end)

-- Auto-update presence loop
CreateThread(function()
    while not playerLoaded do Wait(100) end
    while true do
        TriggerServerEvent('cfx-leon-dcpresence:UpdatePresence')
        Wait(Config.ResourceTimer * 1000)
    end
end)

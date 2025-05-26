Config = {}

-- Discord Rich Presence Configuration
Config.ClientID = 1068336711291113482
Config.PlayerCount = 128
Config.PlayerText = "Citizen"
Config.ResourceTimer = 30 -- Adjusted for performance
Config.UseESXIdentity = false
Config.RichPresence = '[ID: %s] %s - %s (%s/%s)' -- [ID] Name - Text (Current/Max)
Config.UseJobs = true

-- Buttons
Config.Buttons = {
    { index = 0, name = 'Discord', url = 'https://discord.gg/exiledlegacyrp' },  --- Discord Link
    { index = 1, name = 'Connect', url = 'fivem://connect/38.76.247.42:30120' }  --- IP
}

-- Admin/Staff Tag Configuration
Config.UseAdminTags = true
Config.AdminGroups = { 'moderator', 'admin', 'superadmin', 'owner', 'developer' } --- Type your group name
Config.AdminIcon = 'staff' ---
Config.AdminText = 'Staff Member'
Config.AdminRichPresencePrefix = '[STAFF]'

-- Large asset config (Discord Dev Portal -> Rich Presence assets)
Config.LargeAssetName = 'logo1'
Config.LargeAssetText = 'ELRP'

-- Debug Mode (optional)
Config.DebugPresence = false

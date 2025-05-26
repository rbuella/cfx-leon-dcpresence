# Leon Discord Rich Presence

This FiveM script integrates Discord Rich Presence with your ESX server, displaying player-specific details such as job, admin tags, and server information directly in Discord.

## Features

- ✅ Displays player job and grade (if `Config.UseJobs = true`)
- ✅ Displays admin/staff tag with custom icon and prefix
- ✅ Uses ESX player identity or FiveM player name
- ✅ Shows server player count and player ID
- ✅ Supports custom large/small Discord Rich Presence assets
- ✅ Adds Discord and Connect buttons in the Rich Presence panel
- ✅ Periodic updates from the server

---

## Installation

### 1. Add the Resource

Place the `cfx-leon-dcpresence` folder into your `resources` directory.

### 2. Add to `server.cfg`



---

## Configuration

### `config.lua`

Customize settings to fit your server:

```lua
Config.ClientID = 1068336711291113482 -- Discord Application ID
Config.PlayerCount = 128              -- Max players displayed
Config.PlayerText = "Citizen"         -- Text shown in Rich Presence
Config.ResourceTimer = 5              -- Update interval in seconds
Config.UseESXIdentity = false         -- Use ESX identity instead of GetPlayerName
Config.UseJobs = true                 -- Show job name and grade
Config.UseAdminTags = true            -- Show staff tag if player is an admin
Config.AdminGroups = { 'admin', 'moderator', 'owner' } -- ACE permissions/groups
Config.AdminIcon = 'staff'            -- Small asset name for staff
Config.AdminText = 'Staff Member'
Config.AdminRichPresencePrefix = '[STAFF] ' -- Prefix in player name
Config.LargeAssetName = 'logo1'       -- Large image asset
Config.LargeAssetText = 'ELRP'        -- Hover text for large asset
Config.Buttons = {
    { index = 0, name = 'Discord', url = 'https://discord.gg/exiledlegacyrp' },
    { index = 1, name = 'Connect', url = 'fivem://connect/38.76.247.42:30120' }
}

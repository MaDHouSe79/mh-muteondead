local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local isDead = false

AddEventHandler('gameEventTriggered', function(event, data)
    if event == "CEventNetworkEntityDamage" and data[1] == PlayerPedId() then
        MumbleSetActive(false)
        isDead = true
    end
end)

CreateThread(function()
    while true do
        if isDead and not QBCore.Functions.GetPlayerData().metadata['isdead'] then
            MumbleSetActive(true)
            isDead = false
        end
        Wait(1000)
    end
end)
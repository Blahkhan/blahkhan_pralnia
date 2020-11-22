local location1 = vector3(-458.76, -2274.54, 8.52)
local timer = 0.0
local PlayerData = {}
local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        if GetDistanceBetweenCoords(coords,  location1.x,  location1.y,  location1.z,  true) < 20 then
            timer = timer + 0.1
            PlayerData = ESX.GetPlayerData(GetPlayerPed(-1))
            DrawMarker(27, location1.x, location1.y, location1.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 204, 50, 50, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(coords,  location1.x,  location1.y,  location1.z,  true) < 1.5 then
                    showText1()
                if GetDistanceBetweenCoords(coords,  location1.x,  location1.y,  location1.z,  true) < 1.5 and IsControlPressed(0, 38) and timer >= 5.0 then
                    TriggerServerEvent("blahkhan_pralnia:washMoney", PlayerData)
                    timer = 0.0
                end
            end
        end
    end
end)

function showText1()
    SetTextComponentFormat('STRING')
    AddTextComponentString('Wypierz brudny chajs')
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('showNotify')
AddEventHandler('showNotify', function(notify, id)
    if PlayerId() == GetPlayerFromServerId(id) then
	    ShowAboveRadarMessage(notify)
	end
end)

function ShowAboveRadarMessage(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end
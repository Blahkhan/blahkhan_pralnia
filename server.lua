ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("blahkhan_pralnia:washMoney")
AddEventHandler("blahkhan_pralnia:washMoney", function(Player)
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local moneyB = sourceXPlayer.getAccount('black_money')
    if moneyB.money == 0 then
        TriggerClientEvent('showNotify', source,'~r~Nie masz brudnej kasy!', source)
    else
        local moneyAdd = moneyB.money - (moneyB.money / 10)
        sourceXPlayer.addMoney(moneyAdd)
        sourceXPlayer.setAccountMoney('black_money', 0)
    end
end)

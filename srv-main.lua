ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('revente')
AddEventHandler('revente',function()

    local nombre=0
    local argent=0

    local _src=source
    local xPlayer=ESX.GetPlayerFromId(_src)

    local weed=xPlayer.getInventoryItem("weed_pooch").count
    local meth=xPlayer.getInventoryItem("meth_pooch").count
    local coke=xPlayer.getInventoryItem("coke_pooch").count

    if weed==0 then
        nombre=math.random(1,3)
        argent=100*nombre

        xPlayer.removeInventoryItem("weed_pooch",nombre)
        xPlayer.AddAccountMoney('black_money',argent)

        TriggerClientEvent("esx:showNotification",_src"La trensaction s'est bien déroulé")

    elseif meth==0 then

        nombre=math.random(1,3)
        argent=120*nombre

        xPlayer.removeInventoryItem("meth_pooch",nombre)
        xPlayer.AddAccountMoney('black_money',argent)

        TriggerClientEvent("esx:showNotification",_src"La trensaction s'est bien déroulé")
    elseif coke==0 then
        nombre=math.random(1,3)
        argent=150*nombre

        xPlayer.removeInventoryItem("coke_pooch",nombre)
        xPlayer.AddAccountMoney('black_money',argent)

        TriggerClientEvent("esx:showNotification",_src"La trensaction s'est bien déroulé") 
    end

end)

RegisterServerEvent("reventeDrogues:peutVendre")
AddEventHandler("reventeDrogues:peutVendre",function(heading,ClosestPed,playerPed)

local xPlayer= ESX.GetPlayerFromId(source)


local weed=xPlayer.getInventoryItem("weed_pooch").count
local meth=xPlayer.getInventoryItem("meth_pooch").count
local coke=xPlayer.getInventoryItem("coke_pooch").count

if weed==0 or meth==0 or coke==0 then
    TriggerClientEvent("reventeDrogues:clientVente",source,true,heading,closestPed,playerPed)
else
    TriggerClientEvent("esx:showNotification",source,"Tu n'as rien a me vendre")

end


end)
ESX = exports["es_extended"]:getSharedObject()
Citizen.CreateThread(function()

    while true do
       local playerPed=PlayerPedId()
       local playerCoods=GetEntityCoords(playerPed)

       local IsCar=GetVehiclePedIsIn(playerPed,false)


       print(IsCar)

       if IsCar==0 then
          Citizen.Wait(1000)
        else
            local isPed,closestPed=GetClosestPed(playerCoords['x'],playerCoords['y'],playerCoords['z'],6.0,1,0,-1,0,0)
            local pedCoords=GetEntityCoords(closestPed)
                  
            local distance = GetDistanceBeetweenCoords(playerCoords['x'],playerCoords['y'],playerCoords['z'],pedCoords['x'],pedCoords['y'],pedCoords['z'],true)

            if distance<=6.0 and distance >=1.5 then
                DrawMarker(6,PedCoords["x"],PedCoords["y"], PedCoords["z"] + 1,0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.2, 0.2, 0.2, 255, 128, 0, 100, false, true, 2, nil, nil, false)
            elseif distance<1.5 then
                DrawMarker(2,PedCoords["x"],PedCoords["y"], PedCoords["z"] + 1,0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.2, 0.2, 0.2, 255, 128, 0, 100, false, true, 2, nil, nil, false)
                ESX.ShowHelpNotification('[E] pour proposer de la drogue')
                if IsControlJustPressed(1, 86) then
                    local heading=GetEntityHeading(playerPed)
                    TriggerServerEvent("reventeDrogues:peutVendre",heading,closestPed,playerPed)
                end
    
            else
                Citizen.wait(500)
            end
       end

       
       
       

        Citizen.Wait(0)

    end

end)

RegisterNetEvent("reventeDrogues:clientVente")
AddEventHandler("reventeDrogues:clientVente",function(peutVendre,heading,closestPed,playerPed)
    Citizen.CreateThread(function()
        if peutVendre then
            heading=GetEntityHeading(GetPlayerPed(-1))+180
            SetEntityHeading(closestPed,heading)
            FreezeEntityPosition(closestPed, true)
            TaskStartScrenarioInPlace(playerPed,"WORLD_HUMAN_DRUG_DEALER8HARD", 0,true)
            TaskStartScrenarioInPlace(closestPed,"WORLD_HUMAN_Bum_STANDING", 0,true)
            Citizen.wait(5*1000)
            TriggerServerEvent("revente",closestPed)
            FreezeEntityPosition(closestPed, false)
            ClearPedTasksImmediately(playerPed)
            ClearPedTasksImmediately(closestPed)
            SetEntityAsMissionEntity(closestPed)
            removePedElegantly(closestPed)
        end

    end)

end)
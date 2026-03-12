print("Weed picking client loaded")

CreateThread(function()

    -- Debug: check config loaded
    if Config == nil then
        print("Config table is NIL")
    else
        print("Config loaded")
        print(Config.SeedLocations)
    end

    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)


        for _,v in pairs(Config.SeedLocations) do
            local dist = #(coords - v)

            -- Increased distance for testing
            if dist < 50.0 then
                sleep = 0


                if dist < 1.5 then
                    DrawText3D(v.x, v.y, v.z+0.3, "[E] Harvest Weed Seeds")

                    if IsControlJustReleased(0,38) then
                        print("E pressed - harvesting seeds")
                        TriggerServerEvent("weed:harvestSeeds")
                        Wait(2000)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

function DrawText3D(x,y,z,text)
    SetTextScale(0.35,0.35)
    SetTextFont(4)
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z,0)
    DrawText(0.0,0.0)
    ClearDrawOrigin()
end
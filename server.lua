RegisterServerEvent("weed:harvestSeeds")
AddEventHandler("weed:harvestSeeds", function()
    local src = source
    local Player = TMC.Functions.GetPlayer(src)

    if not Player then return end

    local amount = math.random(Config.MinSeeds, Config.MaxSeeds)

    Player.Functions.AddItem(Config.SeedItem, amount)
end)
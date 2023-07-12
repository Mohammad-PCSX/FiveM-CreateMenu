local Pool = NativeUI.CreatePool()
local Menu = NativeUI.CreateMenu("Menu Admin","List Ha")

local ItemVeh = NativeUI.CreateItem("Spawn Vehicle Or Car","Be Shoma Vehicle T20 Mide.")
Menu:AddItem(ItemVeh)

function SpawnT20()
    local ModelHash = `T20` -- Use Compile-time hashes to get the hash of this model
    if not IsModelInCdimage(ModelHash) then return end
        RequestModel(ModelHash) -- Request the model
    while not HasModelLoaded(ModelHash) do -- Waits for the model to load
        Wait(0)
    end

    local Pos = GetEntityCoords(GetPlayerPed(-1))
    local Rot = GetEntityHeading(GetPlayerPed(-1))
    local Veh = CreateVehicle(GetHashKey("T20"),Pos.x,Pos.y,Pos.z,Rot,true,false)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1),Veh,0)
    SetModelAsNoLongerNeeded(ModelHash)
end

Menu.OnItemSelect = function(sender, item, index)
    if ItemVeh == item then 
        SpawnT20()
    end
end

Pool:Add(Menu)
Menu:Visible(true)


CreateThread(function()
    while true do 
        Wait(1)
        Pool:ProcessMenus()
    end
end)
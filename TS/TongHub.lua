local Games = {
    [1554960397] = "CarDealershipTycoon.lua",
    [10704789056] = "DriveWorld.lua",
    [6911148748] = "CarDrivingIndonesia.lua",
    [9233343468] = "CarDrivingIndonesia.lua",
    [9508940498] = "CarDrivingIndonesia.lua",
    [14005966837] = "CarDrivingIndonesia.lua",
    [4566572536] = "VehicleLegends.lua",
    [3351674303] = "DrivingEmpire.lua",
    [654732683] = "CarCrushers2.lua",
    [4618049391] = "TangCountyHebei.lua",
    [14475792710] = "DealershipTycoon.lua",
    [1] = "universal.lua"
}

local repo = "https://raw.githubusercontent.com/yuhaodatt/script/main/游戏/"
local scriptName = Games[game.PlaceId] or Games[1]
local script = function() 
    return game:HttpGet(repo..scriptName)
end


local function showNotification(gameName)
    local NotificationHolder =
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
    local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

    Notification:Notify(
        {Title = "TongScript", Description = "是否加载"..gameName.. "脚本"},
        {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 120, Type = "option"},
        {
            Image = "http://www.roblox.com/asset/?id=6023426923",
            ImageColor = Color3.fromRGB(255, 84, 84),
            Callback = function(State)
                if State then
                    wait(1)
                    loadstring(script())()
                else
                    print(tostring(State))
                end
            end
        }
    )
end


local detectedGameName = Games[game.PlaceId] or "universal.lua"
detectedGameName = string.gsub(detectedGameName, ".lua", "")
showNotification(detectedGameName)
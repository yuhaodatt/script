local Games = {
    [1554960397] = "car dealer",
    [10704789056] = "drive world",
    [4566572536] = "Vehicle legends",
    [3351674303] = "Driving empire",
    [14475792710] = "dealership tycoon",
    [7305309231] = "Taxi Boss",
    [1] = "universal.lua",
}

local repo = "https://raw.githubusercontent.com/Marco8642/science/main/"
local scriptName = Games[game.PlaceId] or Games[1]
local scriptNameEncoded = string.gsub(scriptName, " ", "%%20") -- 将空格替换为 %20
local script = function() 
    return game:HttpGet(repo..scriptNameEncoded)
end

local function showNotification(gameName)
    local NotificationHolder =
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
    local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

    Notification:Notify(
        {Title = "Marco hub(Tong整合)", Description = "是否加载"..gameName.. "脚本"},
        {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 999, Type = "option"},
        {
            Image = "http://www.roblox.com/asset/?id=6023426923",
            ImageColor = Color3.fromRGB(255, 84, 84),
            Callback = function(State)
                if State then
                    wait(1)
                    print("1111")
                    loadstring(script())()
                else
                    print(tostring(State))
                end
            end
        }
    )
end

local detectedGameName = Games[game.PlaceId] or "universal.lua"
showNotification(detectedGameName)

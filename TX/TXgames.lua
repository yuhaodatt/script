local Games = {
    [4618049391] = "TangCountyHebei.lua",
    [1] = "universal.lua",
}

local repo = "https://raw.githubusercontent.com/TongScriptX/TongScript/main/"
local scriptName = Games[game.PlaceId] or Games[1]
local script = function() 
    return game:HttpGet(repo..scriptName)
end


local function showNotification(gameName)
    local NotificationHolder =
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
    local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

    Notification:Notify(
        {Title = "Tong X", Description = "是否加载"..gameName.. "脚本"},
        {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 999, Type = "option"},
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
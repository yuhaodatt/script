local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TS-DE", Description = "Pearl HUB"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 60, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                loadstring(game:HttpGet('https://ppearl.vercel.app'))()
            else
                Notification:Notify(
                    {Title = "TS-DE", Description = "TSDE"},
                    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 60, Type = "option"},
                    {
                        Image = "http://www.roblox.com/asset/?id=6023426923",
                        ImageColor = Color3.fromRGB(255, 84, 84),
                        Callback = function(State)
                            if State then
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/游戏/DE-TS.LUA",true))()
                            else
                                print(tostring(State))
                            end
                        end
                    }
                )
            end
        end
    }
)
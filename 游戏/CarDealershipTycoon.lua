local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TS-CDT", Description = "🌺 Noradrenaline"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 10, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                loadstring(game:HttpGet("https://astronomic.vercel.app"))()
            else
                Notification:Notify(
                    {Title = "TS-CDT", Description = "tscdt"},
                    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 10, Type = "option"},
                    {
                        Image = "http://www.roblox.com/asset/?id=6023426923",
                        ImageColor = Color3.fromRGB(255, 84, 84),
                        Callback = function(State)
                            if State then
                                print("脚本2")
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

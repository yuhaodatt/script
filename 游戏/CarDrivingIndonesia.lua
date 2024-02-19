local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TS-CDID", Description = "Ganteng Hub(付费)"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 60, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                loadstring(game:HttpGet('https://isnahamzahpastebin.tech/cdid/premium/gantenghub_premium.lua'))()
            else
                Notification:Notify(
                    {Title = "TS-CDID", Description = "Ganteng Hub(免费)"},
                    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 60, Type = "option"},
                    {
                        Image = "http://www.roblox.com/asset/?id=6023426923",
                        ImageColor = Color3.fromRGB(255, 84, 84),
                        Callback = function(State)
                            if State then
                                loadstring(game:HttpGet('https://isnahamzahpastebin.tech/cdid/gratis/gantenghub_01.lua'))()

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

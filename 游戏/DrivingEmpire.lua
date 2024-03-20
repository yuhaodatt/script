local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TS-DE", Description = "Pearl HUB(按 X 切换下一个)"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 120, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                setclipboard("Pearl_876tsdfhba67sdbhyaggv2")
                wait(0.1)
                loadstring(game:HttpGet('https://ppearl.vercel.app'))()
            else
                Notification:Notify(
                    {Title = "TS-DE", Description = "Marco Hub"},
                    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 120, Type = "option"},
                    {
                        Image = "http://www.roblox.com/asset/?id=6023426923",
                        ImageColor = Color3.fromRGB(255, 84, 84),
                        Callback = function(State)
                            if State then
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
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
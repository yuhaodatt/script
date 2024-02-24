local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TS-VL", Description = "此脚本需要改宽度为650，是否加载"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 120, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/XRoLLu/UWU/main/Vehicle%20Legends"))()
            else
                print(tostring(State))
            end
        end
    }
)
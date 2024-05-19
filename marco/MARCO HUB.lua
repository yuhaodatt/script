
local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "完成迁移", Description = "联系961308752"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 10, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                print("hello")
            else
                print(tostring(State))
            end
        end
    }
)

local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TS-更新日志", Description = "更改检测游戏逻辑/更改通知弹窗/即将更新唐县"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 60, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            if State then
                print("已收到")
            else
                print("关闭")
            end
        end
    }
)
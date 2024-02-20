local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

Notification:Notify(
    {Title = "TEXT TITLE", Description = "DESCRIPTION"},
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
wait(1)
Notification:Notify(
    {Title = "TEXT TITLE", Description = "DESCRIPTION"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
)
wait(1)
Notification:Notify(
    {Title = "TEXT TITLE", Description = "DESCRIPTION"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "default"}
)







local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

-- 用于追踪点击次数的计数器
local clickCount = 0

Notification:Notify(
    {Title = "TEXT TITLE", Description = "DESCRIPTION"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 10, Type = "option"},
    {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84),
        Callback = function(State)
            -- 检查选项是否被选择，并且统计点击次数
            if State then
                clickCount = clickCount + 1
                print("Clicked " .. tostring(clickCount) .. " times")
                -- 如果这是第二次点击，则暂停
                if clickCount == 2 then
                    print("Second click detected, waiting...")
                    wait(1)  -- 第二次点击时的延时
                    -- 在此执行其他您想在第二次点击时进行的操作

                    -- 在此显示第二个通知
                    Notification:Notify(
                        {Title = "TEXT TITLE", Description = "正在注入，请不要多次点击"},
                        {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"},
                        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
                    )
                end
            else
                print(tostring(State))
            end
        end
    }
)
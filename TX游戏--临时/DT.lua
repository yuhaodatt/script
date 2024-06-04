local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()

local win = lib:Window("TX-DT", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)
local tab = win:Tab("谷仓寻车")
local changeclr = win:Tab("Change UI Color")

-- 获取游戏实例
local gameInstance = game
if not gameInstance then
    print("Game instance not found")
    return
end

print("Game instance found")

-- 获取文件夹
local folder = gameInstance.Workspace:FindFirstChild("Folder")
if not folder then
    print("Folder not found in Workspace")
    return
end

print("Folder found in Workspace")

-- 定义玩家和玩家角色的关键部分
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- 定义函数来传送玩家
local function teleportToParts(parts)
    for _, part in ipairs(parts) do
        if part:IsA("Model") then
            local primaryPart = part.PrimaryPart or part:FindFirstChildOfClass("BasePart")
            if primaryPart then
                print("Teleporting to part:", primaryPart.Name)
                humanoidRootPart.CFrame = primaryPart.CFrame
                wait(1) -- 等待一秒，避免传送过快
                if not part.Parent then
                    -- 当前Model消失，结束传送
                    print("Part", part.Name, "has been removed. Stopping teleport.")
                    return
                end
            else
                print("Model has no PrimaryPart or BasePart:", part.Name)
            end
        elseif part:IsA("BasePart") then
            print("Teleporting to part:", part.Name)
            humanoidRootPart.CFrame = part.CFrame
            wait(0.2) -- 等待一秒，避免传送过快
            if not part.Parent then
                -- 当前Part消失，结束传送
                print("Part", part.Name, "has been removed. Stopping teleport.")
                return
            end
        else
            print("Ignored non-BasePart and non-Model:", part.Name)
        end
    end
end

-- 控制开关
local toggle = false

tab:Toggle("寻找零件", false, function(t)
    toggle = t
    print("Toggle state:", toggle)
end)

-- 无限检测文件夹内容并传送玩家
spawn(function()
    while true do
        if toggle then
            local parts = folder:GetChildren()
            if #parts > 0 then
                print("Parts found in folder:", #parts)
                teleportToParts(parts)
            else
                print("No parts found in folder.")
            end
        end
        wait(1) -- 每秒检测一次
    end
end)

tab:Button("飞行", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/%E5%85%B6%E4%BB%96/%E9%A3%9E%E8%A1%8C.lua"))()
end)    

-- 绑定按键
tab:Bind("Bind", Enum.KeyCode.RightShift, function()
    print("Pressed!")
end)

-- 标签
tab:Label("TStudio X")

-- 颜色选择器
changeclr:Colorpicker("Change UI Color", Color3.fromRGB(44, 120, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)
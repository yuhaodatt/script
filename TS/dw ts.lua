-- 请确保以下代码运行在 Roblox Studio 中

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/DrRay.lua"))()
local window = DrRayLibrary:Load("TongScript-DW", "rbxassetid://16042583196")
local tab = DrRayLibrary.newTab("主要功能", "ImageIdHere")

-- 初始化等待时间
local waitTime = 25

-- 反挂机功能
print("反挂机开始运行")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        print("反挂机成功运行")
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end
)

-- 显示当前等待时间的标签
local waitTimeLabel = tab.newLabel("当前等待时间: " .. waitTime)

-- 修改等待时间的功能
local waitTimeInput = tab.newInput("修改等待时间", "修改等待时间", function(text)
    waitTime = tonumber(text) or waitTime -- 将输入的文本转换为数字，如果无效则保持原来的等待时间
    print("已修改等待时间为: " .. waitTime)
    waitTimeLabel.Text = "当前等待时间: " .. waitTime
    window:Update() -- 强制刷新 UI
end)

-- 自动送货[其他车型]功能
tab.newToggle("自动送货[其他车型]", "", false, function(state)
    getfenv().test = (state and true or false)
    while getfenv().test do
        wait()
        if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == false then
            local num = math.random(1, 9)
            for i, v in pairs(game:GetService("Workspace").Jobs.TrailerDelivery.StartPoints:GetChildren()) do
                if i == num then
                    game:GetService("ReplicatedStorage").Systems.Jobs.StartJob:InvokeServer(
                        "TrailerDelivery",
                        v.Name
                    )
                end
            end
            task.wait(waitTime) -- 使用变量代替固定时间
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == true then
            for i, v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
                if
                    v.Name == "Owner" and v.Value == game.Players.LocalPlayer and
                        game.Players.LocalPlayer:DistanceFromCharacter(
                            game:GetService("Workspace").CompletionRegion.Primary.Position
                        ) > 25
                then
                    v.Parent:SetPrimaryPartCFrame(
                        game:GetService("Workspace").CompletionRegion.Primary.CFrame * CFrame.new(0, 5, -20)
                    )
                    v.Parent.Trailer.PrimaryPart.Anchored = true
                    task.wait(1.5)
                    v.Parent.Trailer.PrimaryPart.Anchored = false
                    repeat
                        task.wait()
                    until game:GetService("Players").LocalPlayer.PlayerGui.JobComplete.Enabled == true or
                        getfenv().test == false
                    game:GetService("ReplicatedStorage").Systems.Jobs.CashBankedEarnings:FireServer()
                    game:GetService("Players").LocalPlayer.PlayerGui.JobComplete.Enabled = false
                    game:GetService("Lighting").BackgroundBlur.Enabled = false
                    task.wait()
                end
            end
        end
    end
end)

-- 自动送货[Full-E]功能
tab.newToggle("自动送货[Full-E]", "", false, function(state)
    getfenv().test2 = (state and true or false)
    while getfenv().test2 do
        wait()
        if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == false then
            local num = math.random(1, 9)
            for i, v in pairs(game:GetService("Workspace").Jobs.TrailerDelivery.StartPoints:GetChildren()) do
                if i == num then
                    game:GetService("ReplicatedStorage").Systems.Jobs.StartJob:InvokeServer(
                        "TrailerDelivery",
                        v.Name
                    )
                end
            end
            task.wait(waitTime) -- 使用变量代替固定时间
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == true then
            for i, v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
                if
                    v.Name == "Owner" and v.Value == game.Players.LocalPlayer and
                        game.Players.LocalPlayer:DistanceFromCharacter(
                            game:GetService("Workspace").CompletionRegion.Primary.Position
                        ) > 25
                then
                    v.Parent:SetPrimaryPartCFrame(
                        game:GetService("Workspace").CompletionRegion.Primary.CFrame * CFrame.new(0, 5, -30)
                    )
                    v.Parent.Trailer.PrimaryPart.Anchored = true
                    task.wait(1.5)
                    v.Parent.Trailer.PrimaryPart.Anchored = false
                    repeat
                        task.wait()
                    until game:GetService("Players").LocalPlayer.PlayerGui.JobComplete.Enabled == true or
                        getfenv().test2 == false
                    game:GetService("ReplicatedStorage").Systems.Jobs.CashBankedEarnings:FireServer()
                    game:GetService("Players").LocalPlayer.PlayerGui.JobComplete.Enabled = false
                    game:GetService("Lighting").BackgroundBlur.Enabled = false
                    task.wait()
                end
            end
        end
    end
end)

-- 添加其他的UI元素和逻辑

-- 保持脚本运行
while wait() do
    -- 在这里添加其他的逻辑
end





-- 服务和变量初始化
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 创建屏幕GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- 创建图标
local icon = Instance.new("ImageLabel")
icon.Parent = screenGui
icon.Size = UDim2.new(0, 100, 0, 100)
icon.Position = UDim2.new(0.5, -50, 0.5, -50)
icon.Image = "http://www.roblox.com/asset/?id=16042583196"  -- 替换为你的图标ID
icon.BackgroundTransparency = 1
icon.ImageTransparency = 1  -- 初始透明度为1

-- 创建文字数组（反向）
local texts = {"t", "p", "i", "r", "c", "S", "g", "n", "o", "T"}
local textLabels = {}

for i, text in ipairs(texts) do
    local label = Instance.new("TextLabel")
    label.Parent = screenGui
    label.Size = UDim2.new(0, 30, 0, 50)
    label.Position = UDim2.new(0.5, -50 + (i - 1) * 40, 0.5, -50)  -- 调整初始位置，避免重叠
    label.Text = text
    label.TextTransparency = 1  -- 初始透明度为 1，隐藏所有文字
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.SourceSans
    label.TextSize = 30
    label.TextColor3 = Color3.new(1, 1, 1) -- 将文字颜色设置为白色
    table.insert(textLabels, label)
end
textLabels[#texts].TextTransparency = 0  -- 最后一个文字不隐藏

-- 动画函数
local function animateIconAndText()
    -- 图标淡入
    local iconFadeIn = TweenService:Create(icon, TweenInfo.new(1), {ImageTransparency = 0})
    iconFadeIn:Play()
    iconFadeIn.Completed:Wait()

    local iconStartPos = UDim2.new(0.5, -50, 0.5, -50)
    local iconEndPos = UDim2.new(0.3, -50, 0.5, -50)
    local totalDistance = iconStartPos.X.Scale - iconEndPos.X.Scale
    local stepDistance = totalDistance / (#texts - 1)

    for i, label in ipairs(textLabels) do
        -- 每次移动图标一点距离
        local targetPos = UDim2.new(iconStartPos.X.Scale - stepDistance * i, iconStartPos.X.Offset - stepDistance * i * 100, iconStartPos.Y.Scale, iconStartPos.Y.Offset)
        local iconMoveStep = TweenService:Create(icon, TweenInfo.new(0.5), {Position = targetPos})
        iconMoveStep:Play()
        
        -- 文字逐个淡入
        iconMoveStep.Completed:Wait()
        label.Position = UDim2.new(targetPos.X.Scale, targetPos.X.Offset + 100, targetPos.Y.Scale, targetPos.Y.Offset)
        local textFadeIn = TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 0})
        textFadeIn:Play()
    end

    -- 等待最后一个文字完全显示
    RunService.Heartbeat:Wait(5)  -- 等待5秒

    -- 图标淡出
    local iconFadeOut = TweenService:Create(icon, TweenInfo.new(1), {ImageTransparency = 1})
    iconFadeOut:Play()

    -- 逐个隐藏文字
    for i, label in ipairs(textLabels) do
        -- 文字逐个淡出
        local textFadeOut = TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1})
        textFadeOut:Play()
    end
end

-- 启动动画
animateIconAndText()

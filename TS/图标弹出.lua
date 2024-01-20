local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

-- 创建一个ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = Players.LocalPlayer.PlayerGui

-- 创建一个ImageLabel作为图标
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0.5, -25, 0.5, -25) -- 初始居中位置
icon.BackgroundTransparency = 1 -- 使背景透明
icon.Image = "rbxassetid://16042583196" -- 替换为你想要的图标的Asset ID
icon.Parent = screenGui

-- 初始尺寸
icon.Size = UDim2.new(0, 50, 0, 50)

-- 淡入动画
local tweenInfoIn = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local tweenGoalIn = {
    BackgroundTransparency = 1, -- 使背景透明
    Size = UDim2.new(0, 100, 0, 100), -- 放大到100
    Position = UDim2.new(0.5, -50, 0.5, -50) -- 调整居中位置
}
local tweenIn = TweenService:Create(icon, tweenInfoIn, tweenGoalIn)
tweenIn:Play()

-- 5秒后淡出动画
wait(5)

local tweenInfoOut = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local tweenGoalOut = {
    BackgroundTransparency = 1, -- 使背景透明
    Size = UDim2.new(0, 50, 0, 50), -- 缩小回初始大小
    Position = UDim2.new(0.5, -25, 0.5, -25) -- 调整居中位置
}
local tweenOut = TweenService:Create(icon, tweenInfoOut, tweenGoalOut)
tweenOut:Play()

wait(1) -- 等待淡出动画完成
screenGui:Destroy()

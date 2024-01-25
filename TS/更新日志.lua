local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- 创建一个ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = Players.LocalPlayer.PlayerGui

-- 创建一个Frame作为容器
local containerFrame = Instance.new("Frame")
containerFrame.Size = UDim2.new(0, 300, 0, 300)
containerFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
containerFrame.BackgroundTransparency = 0.5 -- 使背景半透明
containerFrame.Parent = screenGui

-- 创建一个TextLabel用于显示文字
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- 背景颜色
textLabel.TextColor3 = Color3.new(1, 1, 1) -- 文本颜色
textLabel.Font = Enum.Font.SourceSansBold
textLabel.FontSize = Enum.FontSize.Size24
textLabel.TextWrapped = true
textLabel.Text = "更新日志:增加时间和帧率和运行时间显示功能/添加聊天翻译脚本/添加某些反作弊游戏自动踢出"
textLabel.Parent = containerFrame

-- 创建一个ImageButton作为关闭按钮
local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Image = "rbxassetid://16098366328" -- 使用你自己的关闭图标Asset ID
closeButton.Parent = containerFrame

-- 按钮点击事件
closeButton.MouseButton1Click:Connect(function()
    -- 淡出动画
    local tweenInfoOut = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tweenGoalOut = {
        BackgroundTransparency = 0.5, -- 使背景半透明
        Size = UDim2.new(0, 50, 0, 50), -- 缩小回初始大小
        Position = UDim2.new(0.5, -25, 0.5, -25) -- 调整居中位置
    }
    local tweenOut = TweenService:Create(containerFrame, tweenInfoOut, tweenGoalOut)
    tweenOut:Play()

    wait(1) -- 等待淡出动画完成
    screenGui:Destroy()
end)

-- 初始尺寸
containerFrame.Size = UDim2.new(0, 50, 0, 50)

-- 淡入动画
local tweenInfoIn = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local tweenGoalIn = {
    BackgroundTransparency = 0.5, -- 使背景半透明
    Size = UDim2.new(0, 300, 0, 300), -- 放大到300
    Position = UDim2.new(0.5, -150, 0.5, -150) -- 调整居中位置
}
local tweenIn = TweenService:Create(containerFrame, tweenInfoIn, tweenGoalIn)
tweenIn:Play()

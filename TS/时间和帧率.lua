-- 创建一个屏幕Gui
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

-- 创建一个TextLabel用于显示时间
local textLabelTime = Instance.new("TextLabel")
textLabelTime.Size = UDim2.new(0, 100, 0, 30)  -- 调整大小
textLabelTime.Position = UDim2.new(1, -150, 1, 0)  -- 移动到屏幕右下角
textLabelTime.AnchorPoint = Vector2.new(1, 1)  -- 锚点设置为右下角
textLabelTime.BackgroundTransparency = 1
textLabelTime.Text = "00:00:00"
textLabelTime.TextColor3 = Color3.new(1, 1, 1)
textLabelTime.TextSize = 16  -- 调整文字大小
textLabelTime.Parent = gui

-- 创建一个TextLabel用于显示帧数
local textLabelFPS = Instance.new("TextLabel")
textLabelFPS.Size = UDim2.new(0, 100, 0, 30)  -- 调整大小
textLabelFPS.Position = UDim2.new(1, -30, 1, 0)  -- 移动到屏幕右下角的右边
textLabelFPS.AnchorPoint = Vector2.new(1, 1)  -- 锚点设置为右下角
textLabelFPS.BackgroundTransparency = 1
textLabelFPS.Text = "FPS: 60"  -- 初始帧数
textLabelFPS.TextColor3 = Color3.new(1, 1, 1)
textLabelFPS.TextSize = 16  -- 调整文字大小
textLabelFPS.Parent = gui

-- 更新时间和帧数显示
local smoothingFactor = 0.05 -- 调整平滑因子
local smoothedFPS = 60

local function updateInfo()
    -- 更新时间
    local currentTime = os.date("*t")
    local formattedTime = string.format("%02d:%02d:%02d", currentTime.hour, currentTime.min, currentTime.sec)
    textLabelTime.Text = "" .. formattedTime
    
    -- 更新帧数
    local currentFPS = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
    smoothedFPS = smoothedFPS * (1 - smoothingFactor) + currentFPS * smoothingFactor
    textLabelFPS.Text = "FPS: " .. math.floor(smoothedFPS + 0.5)

    -- 让文字颜色缓慢变化
    local hue = (tick() % 60) / 60  -- 通过使用时间来生成变化的颜色，现在速度更慢
    textLabelTime.TextColor3 = Color3.fromHSV(hue, 1, 1)
    textLabelFPS.TextColor3 = Color3.fromHSV(hue, 1, 1)
end

-- 每帧更新一次时间和帧数
game:GetService("RunService").RenderStepped:Connect(updateInfo)

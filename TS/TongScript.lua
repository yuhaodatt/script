notificationGui = Instance.new("ScreenGui")
notificationGui.Enabled = true  
notificationGui.IgnoreGuiInset = true 

local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 200, 0, 50)--大小
notificationFrame.Position = UDim2.new(0.5, -100, 1, -50) --位置
notificationFrame.BackgroundColor3 = Color3.new(51/255, 51/255, 153/255)--背景颜色3
notificationFrame.Parent = notificationGui

local notificationText = Instance.new("TextLabel")
notificationText.Size = UDim2.new(1, 0, 1, 0)--大小
notificationText.Position = UDim2.new(0, 0, 0, 0)--位置
notificationText.BackgroundColor3 = Color3.new(51/255, 51/255, 153/255)--背景颜色3
notificationText.TextColor3 = Color3.new(0, 0, 0)--文本颜色3
notificationText.Text = "TongScript"
notificationText.Font = Enum.Font.SourceSansBold
notificationText.FontSize = Enum.FontSize.Size24
notificationText.TextScaled = true
notificationText.Parent = notificationFrame

--图标弹出
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


local function animateNotification()
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)
    local tween = game:GetService("TweenService"):Create(notificationFrame, tweenInfo, {Position = UDim2.new(0.5, -100, 0.8, -50)})
    tween:Play()
    wait(3)
    tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)
    tween = game:GetService("TweenService"):Create(notificationFrame, tweenInfo, {Position = UDim2.new(0.5, -100, 1, -50)})
    tween:Play()
    wait(1)--停止
    notificationGui:Destroy()
end

notificationGui.Parent = game.Players.LocalPlayer.PlayerGui
animateNotification()

local StarterGui = game:GetService("StarterGui")
local ButtonClicked = Instance.new("BindableFunction")
ButtonClicked.Name = "ButtonClicked"
ButtonClicked.Parent = script.Parent

StarterGui:SetCore("SendNotification", {
    Title = "T",
    Text = "白名单检测成功",
    Duration = 5, 
})
print("Anti Afk On")

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

wait(1)

-- 服务器
if game.PlaceId == 1554960397 then
    StarterGui:SetCore("SendNotification", {
        Title = "游戏:CDT",
        Text = "检测成功",
        Duration = 10, 
        Button1 = "脚本1",
        Button2 = "下一个",
        Callback = ButtonClicked
    })

    ButtonClicked.OnInvoke = function(buttonText)
        if buttonText == "脚本1" then
            loadstring(game:HttpGet("https://astronomic.vercel.app"))()
        elseif buttonText == "下一个" then
            StarterGui:SetCore("SendNotification", {
                Title = "游戏:CDT",
                Text = "脚本2",
                Duration = 10,
                Button1 = "继续",
                Callback = ButtonClicked
            })

            ButtonClicked.OnInvoke = function(innerButtonText)
                if innerButtonText == "继续" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/car%20dealer", true))()
                end
            end
        end
    end

elseif game.PlaceId == 4566572536 then
StarterGui:SetCore("SendNotification", {
    Title = "游戏:VL",
    Text = "检测成功",
    Duration = 5, 
})
loadstring(game:HttpGet("https://pastebin.com/raw/0MqfXpvY", true))()

elseif game.PlaceId == 6911148748 or game.PlaceId == 9233343468 or game.PlaceId == 9508940498 or game.PlaceId == 14005966837 then
	
StarterGui:SetCore("SendNotification", {
    Title = "游戏:CDID",
    Text = "检测成功",
    Duration = 5, 
})
loadstring(game:HttpGet('https://isnahamzahpastebin.tech/cdid/premium/gantenghub_premium.lua'))()

elseif game.PlaceId == 3351674303 then
StarterGui:SetCore("SendNotification", {
    Title = "游戏:DE",
    Text = "检测成功",
    Duration = 5,
})
loadstring(game:HttpGet('https://ppearl.vercel.app'))()

elseif game.PlaceId ==  then
    StarterGui:SetCore("SendNotification", {
        Title = "游戏:CC2",
        Text = "检测成功",
        Duration = 10,
        Button1 = "加载",
        Callback = ButtonClicked
    })

    ButtonClicked.OnInvoke = function(buttonText)
        if buttonText == "加载" then
            print("1")
        end
    end
end

StarterGui:SetCore("SendNotification", {
    Title = "antiafk",
    Text = "成功执行",
    Duration = 5, 
})

--未改完
coroutine.wrap(CGSLH_fake_script)()
local function VIEO_fake_script() 
	local script = Instance.new('LocalScript', CNM)

	local CNM=script.Parent
	local Mini=CNM.Mini
	local Close=CNM.Close
	local main=CNM.Mian
	main.Visible=false
	
	Close.MouseButton1Click:Connect(function()
		CNM.Parent:Destroy()
	end)
	main.Size=UDim2.new(1, 0,0.02, 0)
	CNM.Active=true
	CNM.Draggable=true
	Mini.MouseButton1Click:Connect(function()
		if main.Visible==false then
			main.Visible=true
			main:TweenSize(UDim2.new(1, 0,13.647, 0),"Out","Sine",0.15)
		else
			main:TweenSize(UDim2.new(1, 0,0.02, 0),"Out","Sine",0.15)
			main.Visible=false
		end
	end)
end
coroutine.wrap(VIEO_fake_script)()
game.Players.ChildAdded:Connect(function(player)
    if not pcall (function()
    SendNotification("玩家加入",""..player.Name.." 加入了游戏",5 )
    end) then
      print ("Error")
    end
    end)
    SendNotification("欢迎",""..game.Players.LocalPlayer.Name.." WELCOME",10)
    game.Players.ChildRemoved:Connect(function(player)
        if not pcall (function()
        SendNotification("玩家离开",""..player.Name.." 离开了游戏",4.4 )
        end) then
          print ("Error")
        end
        end)
        
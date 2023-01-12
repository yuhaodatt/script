warn("please dont steall the hub source please kthx")
local Global = (getgenv and getgenv()) or shared
if not isfile and isfolder and writefile and (getsynasset or getcustomasset) then
    warn("Exploit will not run custom songs")
end
if isfile and isfolder and writefile and (getsynasset or getcustomasset) and (not isfolder("GelatekHub")) then
	local Bindable = Instance.new("BindableFunction")
	local function Copy(e)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/packages/AudioPack.lua"))()
		Bindable:Destroy()
	end
	Bindable.OnInvoke = Copy
	game.StarterGui:SetCore("SendNotification",{
		Title = "Audio Package (45 MB) ";
		Text = "Click here to download audio package for every script automatically, otherwise ignore";
		Duration = 10;
		Callback = Bindable,
		Button1 = "Download Data";
	})
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/packages/FunctionPack.lua"))()
Global.GelatekHubConfig = {
	["Permanent Death"] = false,
	["Torso Fling"] = false,
	["Bullet Enabled"] = false,
	["Enable Collisions"] = false,
	["Keep Hats On Head"] = false,
	["Headless On Perma"] = false,
	["Anti Void"] = false,
	["Anti Void Offset"] = 75
}
local Library;
if Global.OldGui ~= true then
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/AltUiLib.lua"))()
else
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/UILibrary.lua"))()
end
local Main = Library:Create("Gelatek Hub")
local UserInputService = game:GetService("UserInputService")
if UserInputService.TouchEnabled then
	game.StarterGui:SetCore("SendNotification",{
		Title = "移动用户警告! ";
		Text = "这个脚本没有真正支持移动端注入器的原因请前往官方discord查看";
		Duration = 10
	})
end

local Home = Main:MakeTab("主页")
local Reanimate = Main:MakeTab("前置功能")
local FreeScripts = Main:MakeTab("免费脚本")
local HatScripts = Main:MakeTab("饰品脚本")
local Animations = Main:MakeTab("动画")
local Credits = Main:MakeTab("作者")
local Hats = Main:MakeTab("饰品")
Home:MakeLabel("你好!感谢使用Gelatek hubTong#9966汉化")
Home:MakeLabel("目前版本: 1.0.6b")
Home:MakeButton("复制discord邀请", function()
	setclipboard("https://discord.gg/fx5BszFmMY")
end)

local function BetterStopScript()
	StopScript()
	task.wait(0.25)
	StopScript()
end

Reanimate:MakeButton("前置(使用fe功能前请先点击)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/Reanimate.lua"))()
end)
if Global.OldGui ~= true then Reanimate:MakeLine() end
Reanimate:MakeToggle("Permanent Death", function(Bool)
	Global.GelatekHubConfig["Permanent Death"] = Bool
end)
Reanimate:MakeToggle("躯干fling", function(Bool)
	Global.GelatekHubConfig["Torso Fling"] = Bool
end)
Reanimate:MakeToggle("Bullet Enabled", function(Bool)
	Global.GelatekHubConfig["Bullet Enabled"] = Bool
end)
Reanimate:MakeToggle("Enable Collisions", function(Bool)
	Global.GelatekHubConfig["Enable Collisions"] = Bool
end)
Reanimate:MakeToggle("保持帽子在头上", function(Bool)
	Global.GelatekHubConfig["Keep Hats On Head"] = Bool
end)
Reanimate:MakeToggle("Headless On Perma", function(Bool)
	Global.GelatekHubConfig["Headless On Perma"] = Bool
end)
Reanimate:MakeToggle("禁用动画", function(Bool)
	Global.GelatekHubConfig["Disable Anims"] = Bool
end)
Reanimate:MakeToggle("反无效(?)", function(Bool)
	Global.GelatekHubConfig["Anti Void"] = Bool
end)
FreeScripts:MakeButton(" - [ 停止脚本 ] - ", BetterStopScript)
if Global.OldGui ~= true then FreeScripts:MakeLine() end
HatScripts:MakeButton(" - [ 停止脚本 ] - ", BetterStopScript)
if Global.OldGui ~= true then HatScripts:MakeLine() end
Animations:MakeButton(" - [ 停止动画 ] - ", BetterStopScript)
if Global.OldGui ~= true then Animations:MakeLine() end
do -- [[ Animations ]] --
	Animations:MakeTextBox("自定义动画", function(Text)
		PlayAnimation(Text)
	end)
	if Global.OldGui ~= true then Animations:MakeLine() end
	Animations:MakeButton("Freestylin'", function()
		PlayAnimation(4432024917, "GelatekHub/Animations/Freestylin.mp3")
	end)
	Animations:MakeButton("Floss", function()
		PlayAnimation(4812941481, "GelatekHub/Animations/Floss.mp3")
	end)
	Animations:MakeButton("Smooth Moves", function()
		PlayAnimation(4900539662, "GelatekHub/Animations/Smooth Moves.mp3")
	end)
	Animations:MakeButton("Aerostepping", function()
		PlayAnimation(4776588732, "GelatekHub/Animations/Aerostepping.mp3")
	end)
	Animations:MakeButton("Electro Swing", function()
		PlayAnimation(3485013176, "GelatekHub/Animations/Electro Swing.mp3")
	end)
	Animations:MakeButton("Minecraft Parrot", function()
		PlayAnimation(4300228160, "GelatekHub/Animations/Parrot.mp3")
	end)
	Animations:MakeButton("CaramellDansen", function()
		PlayAnimation(6607554805, "GelatekHub/Animations/CaramellDansen.mp3")
	end)
	Animations:MakeButton("Breakdown", function()
		PlayAnimation(4558409610, "GelatekHub/Animations/Breakdown.mp3")
	end)
	Animations:MakeButton("Orange Justice", function()
		PlayAnimation(3262592866, "GelatekHub/Animations/Orange Justice.mp3")
	end)
	Animations:MakeButton("Smug", function()
		PlayAnimation(3450125501, "GelatekHub/Animations/Smug.mp3")
	end)
	Animations:MakeButton("Crabby", function()
		PlayAnimation(3643129020, "GelatekHub/Animations/Crabby.mp3")
	end)
	Animations:MakeButton("Conga", function()
		PlayAnimation(4572096542, "GelatekHub/Animations/Conga.mp3")
	end)
	Animations:MakeButton("Dream Feet", function()
		PlayAnimation(4300218011, "GelatekHub/Animations/Dream Feet.mp3")
	end)
	Animations:MakeButton("Kazotsky Kick", function()
		PlayAnimation(4846209506)
	end)
	Animations:MakeButton("Radical", function()
		PlayAnimation(4686555525)
	end)
	Animations:MakeButton("Take The L", function()
		PlayAnimation(4827299133, "GelatekHub/Animations/Take The L.mp3")
	end)
	Animations:MakeButton("Laughing", function()
		PlayAnimation(4846000379, "GelatekHub/Animations/Laughing.mp3")
	end)
	Animations:MakeButton("Drip", function()
		PlayAnimation(4959380041, "GelatekHub/Animations/Drip.mp3")
	end)
	Animations:MakeButton("Pushups", function()
		PlayAnimation(4966881089)
	end)
end

do -- [[ Scripts ]] --
	HatScripts:MakeButton("Dual Ultima双重终极", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/DualUltima.lua"))()
	end)
	HatScripts:MakeButton("The Hotline热线", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/TheHotline.lua"))()
	end)
	HatScripts:MakeButton("Attack Rifle攻击步枪", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/AttackRifle.lua"))()
	end)
	HatScripts:MakeButton("Carnage大屠杀", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/TheCarnage.lua"))()
	end)
	HatScripts:MakeButton("Neptunian V海王星v", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/NeptunianV.lua"))()
	end)
	HatScripts:MakeButton("Zenith Battle Rifle-70 战斗步枪-70", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/ZenithAttackRifle.lua"))()
	end)
	HatScripts:MakeButton("Chips薯片", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/TheChips.lua"))()
	end)
	HatScripts:MakeButton("Void Scythe虚空镰刀", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/VoidScythe.lua"))()
	end)
	HatScripts:MakeButton("Blue-Black Sniper蓝黑狙击手", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/TheSniper.lua"))()
	end)
	HatScripts:MakeButton("Banzai Bazooka万岁火箭筒", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/BanzaiBazooka.lua"))()
	end)
	HatScripts:MakeButton("Voodoo Doll巫毒娃娃", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/VoodooDoll.lua"))()
	end)
	HatScripts:MakeButton("Quenox奎恩克斯", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/Quenox.lua"))()
	end)
	HatScripts:MakeButton("Goner落魄的人", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/Goner.lua"))()
	end)
	
	FreeScripts:MakeButton("Gale Fighter功夫", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/GaleFighter.lua"))()
	end)
	FreeScripts:MakeButton("Ender.暗影", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/Ender.lua"))()
	end)
	FreeScripts:MakeButton("Cadacus.卡达库斯", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/Cadacus.lua"))()
	end)
end

do -- [[ Hats ]] --
	Hats:MakeButton("复制 R6 Bullet Hat", function()
		setclipboard("48474313")
	end)
	Hats:MakeButton("复制 R15 Bullet Hat", function()
		setclipboard("5973840187")
	end)
	Hats:MakeButton("复制 Dual Ultima Hats", function()
		setclipboard("4524991457,4820152700")
	end)
	Hats:MakeButton("复制 The Hotline Hat", function()
		setclipboard("4962455546")
	end)
	Hats:MakeButton("复制 Attack Rifle Hat", function()
		setclipboard("6202087882")
	end)
	Hats:MakeButton("复制 Carnage Hats", function()
		setclipboard("5134896593,5410674378")
	end)
	Hats:MakeButton("复制 Neptunian V Hat", function()
		setclipboard("4506945409")
	end)
	Hats:MakeButton("复制 Zenith Rifle Hats", function()
		setclipboard("4962510729,4962455546")
	end)
	Hats:MakeButton("复制 Chips Hat", function()
		setclipboard("4964938812")
	end)
	Hats:MakeButton("复制 Blue-Black Sniper Hat", function()
		setclipboard("5063578607")
	end)
	Hats:MakeButton("复制 Void Scythe Hat", function()
		setclipboard("5414429551")
	end)
	Hats:MakeButton("复制 Banzai Bazooka Hat", function()
		setclipboard("4466171123")
	end)
	Hats:MakeButton("复制 Voodoo Doll Hats", function()
		setclipboard("7218265043,7170689370")
	end)
	Hats:MakeButton("复制 Quenox Hats", function()
		setclipboard("4820152700,4794315940,4524991457,4315489767,4458601937,4506945409")
	end)
	Hats:MakeButton("复制 Goner Hat", function()
		setclipboard("6869866014")
	end)
end

do -- [[ Credits ]] --
	Credits:MakeLabel("Gui作者: Gelatek")
	Credits:MakeLabel("Reanimate作者: Gelatek")
	Credits:MakeLabel("Anim ID Player作者: Gelatek / Derek")
	Credits:MakeLabel("Converts作者: Gelatek")
end

local CoreGui = game:GetService("StarterGui") -- Variable of StarterGui
CoreGui:SetCore("SendNotification", {
    Title = "Tong#9966专属汉化",
    Text = "鸡你太美🐔",
    Icon ="rbxassetid://12053741096",
    Duration = 5, 
})



















































local null = Main:MakeTab(" ")
null:MakeTextBox("funny", function(value)
	if value == "kylesweep" then
		local screengui = Instance.new("ScreenGui")
		screengui.Parent = game:GetService("CoreGui")
		local r = math.random
		local function MiniRandom()
			local ABC0, ABC1 = r(1, 8), r(1, 9)
			return "0." .. ABC0 .. ABC1
		end
		for i = 0, 45 do
		local image = Instance.new("ImageLabel", screengui)
		image.Position = UDim2.new(MiniRandom(),0,1,0)
		image.Size = UDim2.new(0,150,0,150)
		image.BackgroundTransparency = 1
		image.Image = "http://www.roblox.com/asset/?id=8300658383"
		image.BackgroundColor3 = Color3.fromRGB(255,255,255)
		local function rotation(Object, Property)
			local Tween = game:GetService("TweenService"):Create(Object, TweenInfo.new(Property["Time"]), {Rotation= Property["Rotation"]}):Play()
			return Tween
		end
		rotation(image, {
			["Time"] = 1.5,
			["Rotation"] = math.random(-180,180)
		})
		local function returning()
			image:TweenPosition( image.Position + UDim2.new(0,0,0.6,0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.4 )
		end

		image:TweenPosition( image.Position - UDim2.new(0,0,0.6,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.4, false, returning)
		task.wait(0.05)
		end
		task.wait(5)
		screengui:Destroy()
	end
	if value == "nullwarehub" then
		if isfile and isfolder and writefile and (getsynasset or getcustomasset) then
			local getsynasset = getsynasset or getcustomasset or function() warn("no getcustomasset/getsynasset") end
			if not isfile("nw.png") then
				writefile("nw.png", game:HttpGet("https://github.com/Gelatekussy/GelatekHub/blob/main/image%5B1%5D.png?raw=true"))
			end
			if not isfile("jp.mp3") then
				writefile("jp.mp3", game:HttpGet("https://github.com/Gelatekussy/GelatekHubSongs/blob/main/ttsMP3.com_VoiceText_2022-11-30_20%2016%2026.mp3?raw=true"))
			end
			if not isfile("scream.mp3") then
				writefile("scream.mp3", game:HttpGet("https://github.com/Gelatekussy/GelatekHubSongs/blob/main/scream.mp3?raw=true"))
			end

			local screengui = Instance.new("ScreenGui")
			screengui.Parent = game:GetService("CoreGui")

			local sound = Instance.new("Sound")
			sound.SoundId = getsynasset("jp.mp3")
			sound.Volume = 3
			sound:Play()
			sound.Parent = screengui

			task.spawn(function()
				task.wait(1.5)
				sound.SoundId = getsynasset("scream.mp3")
				sound.Volume = 10
				sound:Play()
			end)

			local image = Instance.new("ImageLabel", screengui)
			image.Position = UDim2.new(0.5,0,0.5,0)
			image.AnchorPoint = Vector2.new(0.5,0.5)
			image.Size = UDim2.new(0.2,0,0.2,0)
			image.BackgroundTransparency = 1
			image.Image = getsynasset("nw.png")
			image.BackgroundColor3 = Color3.fromRGB(255,255,255)
			task.wait(0.2)
			image:TweenSize(UDim2.new(1.5,0,1.5,0))
			task.wait(5)
			screengui:Destroy()
		end
	end
end)


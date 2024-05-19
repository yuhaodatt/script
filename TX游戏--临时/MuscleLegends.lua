local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()

local win = lib:Window("TX-力量传奇", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("主要")

tab:Toggle("自动锻炼",false, function(t)
    farming = t
    game:GetService("RunService").Stepped:connect(
		function()
			pcall(
				function()
					if farming then
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end
			)
		end
		)
		spawn(function()
			while farming do
				wait()
				pcall(
					function()
						game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
						c()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9)
						if not farming then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
						end
					end
				)
			end
		end)
end)

farming = false

function c()
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if
			v.ClassName == "Tool" and v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or
			v.Name == "Weight"
		then
			v:FindFirstChildOfClass("NumberValue").Value = 0
			repeat
				wait()
			until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
			game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
		end
	end
end

tab:Toggle("自动重生",false, function(t)
    rebirth = t
    spawn(function()
        while rebirth do
            wait(0.1)
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
        end
    end)
end)

rebirth = false

jk = {}

for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do
	if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then
		table.insert(jk, v.Name)
	end
end

local function getAllChests()
	for i, chestName in ipairs(jk) do
		game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(chestName)
		wait(2)
	end
end

tab:Toggle("刷业报",false, function(t)
    br = t
    while br do
        local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
        wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
                Vector3.new(
                    randomPlayer.Character.Head.Position.X,
                    randomPlayer.Character.Head.Position.Y,
                    randomPlayer.Character.Head.Position.Z
                )
            )
    end
end)

br = false

tab:Toggle("自动挥拳",false, function(t)
    autopunch = t
    game:GetService("RunService").Stepped:connect(
		function()
			pcall(
				function()
					if autopunch then
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
						game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
						if autopunch then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(
								game:GetService("Players").LocalPlayer.Backpack.Punch
							)
						end
					end

				end
			)
		end
		)
end)

autopunch = false

tab:Toggle("挥拳无CD",false, function(t)
    noCD = t
    if noCD then
        game:GetService("Players").LocalPlayer.Backpack.Punch:FindFirstChildOfClass("NumberValue").Value = 0
    else
        game:GetService("Players").LocalPlayer.Backpack.Punch:FindFirstChildOfClass("NumberValue").Value = punchCooldown
    end
end)

noCD = false
punchCooldown = 0.35

local tab = win:Tab("卡宠")

local autorock = false
local selectedStamina = selectedStamina

tab:Toggle("自动打石头", autorock, function(t)
    autorock = t
    if not autorock then
        game:GetService("RunService").Stepped:Disconnect()
    end
end)

tab:Dropdown("耐力", {"0","10","100","5k","150k","400k","750k","1m","5m"}, function(selectedOption)
    selectedStamina = selectedOption
end)

game:GetService("RunService").Stepped:Connect(function()
    if autorock then
        pcall(function()
            if selectedStamina == "0" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17.6, 3.8, 2119.2)
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(
                    game:GetService("Players").LocalPlayer.Backpack.Punch
                )
            elseif selectedStamina == "10" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-151.0, 3.7, 438.5)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "100" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-151.0, 3.7, 438.5)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "5k" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(299.9, 3.7, -563.6)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "150k" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2557.7, 3.7, -202.3)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "400k" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2182.3, 3.7, 1292.7)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "750k" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7263.5, 3.7, -1217.2)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "1m" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4144.3, 987.9, -4032.2)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)
            elseif selectedStamina == "5m" then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8966.7, 13.6, -5988.1)
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
				game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(
					game:GetService("Players").LocalPlayer.Backpack.Punch
				)

            end
        end)
    end
end)

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(44, 120, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)

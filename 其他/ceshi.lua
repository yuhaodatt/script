local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("TongScript-DW", "rbxassetid://16042583196")
local tab = DrRayLibrary.newTab("主要功能", "ImageIdHere")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local lp = Players.LocalPlayer
local Systems = ReplicatedStorage:WaitForChild("Systems")

local Race = lp.PlayerGui.Score.Frame.Race
local Timer
local Laps

local Driveworld = {}

for i, v in pairs(getconnections(Players.LocalPlayer.Idled)) do
    if v["Disable"] then
        v["Disable"](v)
    elseif v["Disconnect"] then
        v["Disconnect"](v)
    end
end

local function getchar()
    return lp.Character or lp.CharacterAdded:Wait()
end

local function isvehicle()
    for i, v in next, workspace.Cars:GetChildren() do
        if (v:IsA("Model") and v:FindFirstChild("Owner") and v:FindFirstChild("Owner").Value == lp) then
            if v:FindFirstChild("CurrentDriver") and v:FindFirstChild("CurrentDriver").Value == lp then
                return true
            end
        end
    end
    return false
end

local function getvehicle()
    for i, v in next, workspace.Cars:GetChildren() do
        if v:IsA("Model") and v:FindFirstChild("Owner") and v:FindFirstChild("Owner").Value == lp then
            return v
        end
    end
    return
end

tab.newToggle("自动送货", "使用 Full-E 或 Casper 可以赚更多钱（仅适用于美国地图）", false,function(state)
        Driveworld["autodelivery"] = state
end)

task.spawn(function()
    while wait() do
        if Driveworld["autodelivery"] then
            pcall(function()
                if not isvehicle() then
                    local Cars = ReplicatedStorage:WaitForChild("PlayerData"):WaitForChild(lp.Name):WaitForChild("Inventory"):WaitForChild("Cars")
                    local Truck = Cars:FindFirstChild("FullE") or Cars:FindFirstChild("Casper")
                    local normalcar = Cars:FindFirstChildWhichIsA("Folder")

                    if Truck then
                        Systems:WaitForChild("CarInteraction"):WaitForChild("SpawnPlayerCar"):InvokeServer(Truck)
                    else
                        Systems:WaitForChild("CarInteraction"):WaitForChild("SpawnPlayerCar"):InvokeServer(normalcar)
                    end

                    getchar().HumanoidRootPart.CFrame = getvehicle().PrimaryPart.CFrame
                    wait(1)
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                end

                local completepos
                local job = lp.PlayerGui.Score.Frame.Jobs

                repeat
                    wait()
                    if job.Visible == false and Driveworld["autodelivery"] then
                        Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("TrailerDelivery", "6")
                    end
                until job.Visible == true or not Driveworld["autodelivery"]

                print("Start Job")

                local CompletionRegion = workspace:WaitForChild("CompletionRegion", 3)

                if CompletionRegion then
                    local distance = CompletionRegion.Primary:FindFirstChild("DestinationIndicator"):FindFirstChild("Distance").Text
                    local yeas = string.split(distance, " ")

                    for i, v in pairs(yeas) do
                        local distValue = tonumber(v)
                        
                        if distValue then
                            if distValue < 2.1 then
                                Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("TrailerDelivery", "6")
                            else
                                print("Trailer Job Distance: " .. distValue)
                                jobDistance = distValue
                                break
                            end
                        end
                    end
                end

                repeat
                    wait()
                until (jobDistance and jobDistance > 2.1) or not Driveworld["autodelivery"]

                if CompletionRegion and CompletionRegion.Primary then
                    completepos = CompletionRegion.Primary.CFrame
                end

                for i = 1, 25 do
                    if not Driveworld["autodelivery"] or not getvehicle() or not getchar() then
                        return
                    end
                    wait(1)
                end

                Systems:WaitForChild("Navigate"):WaitForChild("Teleport"):InvokeServer(completepos)
                wait(0.5)
                Systems:WaitForChild("Jobs"):WaitForChild("CompleteJob"):InvokeServer()
                wait(0.5)

                if lp.PlayerGui.JobComplete.Enabled then
                    Systems:WaitForChild("Jobs"):WaitForChild("CashBankedEarnings"):FireServer()
                    firesignal(lp.PlayerGui.JobComplete.Window.Content.Buttons.Close.MouseButton1Click)
                end

                print("Completed Job")
            end)
        end
    end
end)

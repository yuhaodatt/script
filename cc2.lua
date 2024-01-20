-- services
local players = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local runs = game:GetService("RunService")

-- variables
local lp = players.LocalPlayer
local vehicleInfo = rs:WaitForChild("VehicleInformation")
local carCollection = workspace.CarCollection
local rfSpawnVehicle = rs:WaitForChild("rF").SpawnVehicle
local lavaPart = workspace.Crushers["Volcano Pit"].Scripted.Lava
local sp = workspace.Lobby.SpawnPoints.Spawn1
local guiScript = getsenv(lp.PlayerGui:WaitForChild("GUIs"))
local openFunc = guiScript["OpenDealership"]
local spawnFunc = guiScript["SpawnButton"]

-- functions
local function getCurrentCar()
   local car = carCollection:FindFirstChild(lp.Name)
   if not car then return nil end
   
   local model = car:FindFirstChild("Car")
   if not model then return nil end

   local isNotBroken =
       model:FindFirstChild("Wheels"):FindFirstChildOfClass("Part") and
       model:FindFirstChild("Body"):FindFirstChild("Engine"):FindFirstChildOfClass("MeshPart")

   return isNotBroken and model or nil
end

local function getCharacter()
   return lp.Character or lp.CHaracterAdded:Wait()
end

local function getMoney()
   return lp.Money.Value
end

local function canSpawn()
   return lp.SpawnTimer.Value <= 0
end

local function spawnBestCar()
   openFunc()
   spawnFunc(true, Enum.UserInputState.Begin)
end

local function destroyCar()
   local hum = getCharacter():FindFirstChildOfClass("Humanoid")
   local hrp = getCharacter():FindFirstChild("HumanoidRootPart")

   if not hum or not hrp then return end

   local car = getCurrentCar()

   repeat task.wait() until car.PrimaryPart ~= nil

   -- Death to the car!!!
   repeat task.wait()
       car = getCurrentCar()
       if not car then return end

       car.PrimaryPart.Velocity = Vector3.new(0, 250, 0)
       car.PrimaryPart.CFrame *= CFrame.Angles(180, 0, 0)

       task.wait(.25)

       car.PrimaryPart.Velocity = Vector3.new(0, -250, 0)
       car.PrimaryPart.CFrame *= CFrame.Angles(180, 0, 0)

       task.wait(.25)
   until not car
end

-- main
while task.wait() do
   local character = getCharacter()

   if not character then return end

   if canSpawn() then
       spawnBestCar()
       destroyCar()
   end
end
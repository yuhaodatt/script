local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/DrRay.lua"))()
local window = DrRayLibrary:Load("TS-DT", "rbxassetid://16042583196")
local tab = DrRayLibrary.newTab("主要功能", "")

local isAutoFarmEnabled = false
local carModel = nil
local position1 = Vector3.new(-320.0988464355469, -5.001976013183594, 2162.993408203125)

local keycodeMap = {
    ["w"] = 0x57
}

local key = "w"

function pressKey(key)
    local code = keycodeMap[key:lower()]
    if not code then
        print("无效的按键。")
        return
    end
    keypress(code)
end

function releaseKey(key)
    local code = keycodeMap[key:lower()]
    if not code then
        print("无效的按键。")
        return
    end
    keyrelease(code)
end


-- 查找车辆模型
function findCarModel(carName)
    local carsFolder = game.Workspace.Cars
    for _, car in pairs(carsFolder:GetChildren()) do
        if car:IsA("Model") and car.Name == carName then
            return car
        end
    end
    return nil
end

-- 检测cars
function checkCars(carName)
    local carsFolder = game.Workspace.Cars
    if carsFolder then
        for _, car in pairs(carsFolder:GetChildren()) do
            if car:IsA("Model") and car:FindFirstChild("VehicleSeat") and car.Name == carName then
                print("找到匹配的车辆: " .. carName)
                carModel = car
                return
            end
        end
    end
    print("没有找到匹配的车辆: " .. carName)
    carModel = nil
end


-- 传送函数
local function teleportAllCars(position)
    local carsFolder = game.Workspace.Cars
    if carsFolder then
        for _, car in pairs(carsFolder:GetChildren()) do
            if car:IsA("Model") and car:FindFirstChild("VehicleSeat") then
                car:SetPrimaryPartCFrame(CFrame.new(position))
                wait(0.1)
                pressKey(key)
            end
        end
    else
        print("没有找到Cars文件夹。")
    end
end


-- 创建一次开关
tab.newToggle(
    "autofarm",
    "所有车都传送过来是正常现象，别人不会受影响qwq",
    false,
    function(toggleState)
        isAutoFarmEnabled = toggleState
        if isAutoFarmEnabled then
            print("开启")
        else
            print("关闭")
        end
    end
)

-- 主循环
-- 在主循环中
while true do
    if isAutoFarmEnabled then
        teleportAllCars(position1)
    end
end
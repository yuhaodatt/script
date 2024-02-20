local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("TS-唐县", "rbxassetid://16042583196")
local tab = DrRayLibrary.newTab("主要功能", "")

local toggleState = {value = false}

tab.newToggle("蜜雪冰城(添加职业切换，提前传送)", "", toggleState.value, function(state)
    toggleState.value = state
    print(toggleState.value and "on" or "off")
end)

-- 定义按键映射
local keycodeMap = {
    ["1"] = 0x31, 
    ["2"] = 0x32, 
    ["3"] = 0x33, 
    ["4"] = 0x34,
}

function pressKey(key)
    local code = keycodeMap[key:lower()]
    if not code then
        print('Invalid key')
        return
    end

    keypress(code)
end

function releaseKey(key)
    local code = keycodeMap[key:lower()]
    if not code then
        print('Invalid key')
        return
    end

    keyrelease(code)
end

-- 检测物品栏是否有指定物品
function checkInventoryForItem(itemName)
    local player = game.Players.LocalPlayer

    -- 检查玩家是否有物品
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == itemName then
            return true
        end
    end

    return false
end

-- 检测并按下相应按键的函数
function checkAndPressKey(itemName, key)
    if checkInventoryForItem(itemName) then
        pressKey(key)
        wait(0.1)  -- 等待一段时间，可根据需要调整
        releaseKey(key)
        print("按键 " .. key .. " 模拟按下成功")
    end
end

function teleportTo(targetPosition)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.Torso.CFrame = CFrame.new(targetPosition)
    wait(1)
end

local function mainLoop(stateTable)
    while true do
        if stateTable.value then
    
        -- 传送1
        teleportTo(Vector3.new(-7173.69580078125, 11.828431129455566, 1348.3509521484375))
        wait(1)
        workspace.MixueJob.Scripted.Prompts.Prompt.PromptRemote:FireServer()
        wait(1)
           --检测雪糕筒
           checkAndPressKey("ConeEmpty", "1")
           checkAndPressKey("ConeEmpty", "2")
           checkAndPressKey("ConeEmpty", "3")
           checkAndPressKey("ConeEmpty", "4")
       
           -- 之前的脚本部分，包括再传送、送等
       -- 传送2
       teleportTo(Vector3.new(-7168.76513671875, 11.239899635314941, 1347.325439453125))
       wait(1)
       
       -- 传送3
       teleportTo(Vector3.new(-7181.77978515625, 11.840014457702637, 1342.59521484375))
       wait(1)
       
       -- 送
       workspace.MixueJob.Scripted.Line.SpawnedNPCs:FindFirstChild("").HumanoidRootPart.PromptRemote:FireServer()
        else
            print("off")
        end

        task.wait(1)
    end
end

task.spawn(mainLoop, toggleState)

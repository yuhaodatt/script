local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/DrRay.lua"))()
local window = DrRayLibrary:Load("TS-唐县", "rbxassetid://16042583196")
local tab = DrRayLibrary.newTab("主要功能", "")

local toggleState = {value = false}

tab.newToggle(
    "蜜雪冰城",
    "",
    toggleState.value,
    function(state)
        toggleState.value = state
        print(toggleState.value and "on" or "off")

        if toggleState.value then
            for i = 1, 3 do
                teleportTo(Vector3.new(-7173.69580078125, 11.828431129455566, 1348.3509521484375))
                wait(1)
            end
        end
    end
)

local player = game.Players.LocalPlayer
local teamToJoin = "Mixue Ice Cream"

-- 定义按键映射
local keycodeMap = {
    ["1"] = 0x31,
    ["2"] = 0x32,
    ["3"] = 0x33,
    ["4"] = 0x34
}

function pressKey(key)
    local code = keycodeMap[key:lower()]
    if not code then
        print("Invalid key")
        return
    end

    keypress(code)
end

function releaseKey(key)
    local code = keycodeMap[key:lower()]
    if not code then
        print("Invalid key")
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
        wait(0.1) -- 等待一段时间，可根据需要调整
        releaseKey(key)
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
            if player.Team ~= game.Teams[teamToJoin] then
                player.Team = game.Teams[teamToJoin]
                task.wait(1)
            end

            -- 传送1
            teleportTo(Vector3.new(-7173.69580078125, 11.828431129455566, 1348.3509521484375))
            task.wait(1)
            workspace.MixueJob.Scripted.Prompts.Prompt.PromptRemote:FireServer()
            task.wait(0.5)
            --检测雪糕筒
            for i = 1, 4 do
                checkAndPressKey("ConeEmpty", tostring(i))
            end

            -- 传送2
            teleportTo(Vector3.new(-7168.76513671875, 11.239899635314941, 1347.325439453125))
            task.wait(0.5)

            -- 传送3
            teleportTo(Vector3.new(-7175.904296875, 11.840014457702637, 1344.3677978515625))
            task.wait(0.5)

            -- 送
            local spawnNPC = workspace.MixueJob.Scripted.Line.SpawnedNPCs:FindFirstChildOfClass("Model")
            local humanoidRootPart = spawnNPC and spawnNPC.HumanoidRootPart

            while humanoidRootPart and not humanoidRootPart.PromptRemote do
                task.wait(1)
                workspace.MixueJob.Scripted.Prompts.Prompt.PromptRemote:FireServer()
            end

            if humanoidRootPart then
                humanoidRootPart.PromptRemote:FireServer()
            else
                print("没有顾客")
            end
        end

        task.wait(5)
    end
end

task.spawn(mainLoop, toggleState)

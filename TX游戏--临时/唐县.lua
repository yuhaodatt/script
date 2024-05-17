-- 获取 Players 服务
local Players = game:GetService("Players")

-- 获取本地玩家
local localPlayer = Players.LocalPlayer

-- 访问本地玩家的角色
local character = localPlayer.Character

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("唐县", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("TOOLS")

tab:Button("IY", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    lib:Notification("提示", "IY已加载", "确定")
end)

tab:Button("DEX", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Concealium/Dex-Explorer/main/DexExplorer.lua"))()
    lib:Notification("提示", "DEX已加载", "确定")
end)

local tab = win:Tab("MAIN")

tab:Toggle("AUTO FARM", false, function(t)
    print(t)
end)

tab:Dropdown("Dropdown", {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"}, function(t)
    print(t)
end)

local tab = win:Tab("PLAYER")

-- 持续获取并更新 Money 值
local function updatemoneyValue()
    local moneyValue = localPlayer:FindFirstChild("Money")
    if moneyValue and moneyValue:IsA("NumberValue") then
        tab:Label("MONEY: " .. moneyValue.Value)
        -- 监听 Money 值的变化
        moneyValue.Changed:Connect(function()
            tab:Label("MONEY: " .. moneyValue.Value)
        end)
    else
        tab:Label("MONEY: 未找到或不是 NumberValue")
    end
end

-- 初始调用以设置标签
updatemoneyValue()

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color", Color3.fromRGB(44, 120, 224), function(t)
    lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)

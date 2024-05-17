-- 获取 Players 服务
local Players = game:GetService("Players")

-- 获取本地玩家
local localPlayer = Players.LocalPlayer

-- 打印本地玩家的名称
print("本地玩家的名称是：" .. localPlayer.Name)

-- 访问本地玩家的角色
local character = localPlayer.Character

-- 如果角色存在，打印角色的名称
if character then
    print("本地玩家的角色名称是：" .. character.Name)
else
    print("角色尚未生成")
end

local part = game.Players.localPlayer.Money  -- 替换为你的组建路径

-- 获取并输出组建的所有属性
for _, property in pairs(part:GetProperties()) do
    print(property, part[property])
end





-- 获取 Players 服务
local Players = game:GetService("Players")

-- 获取本地玩家
local localPlayer = Players.LocalPlayer

-- 打印本地玩家的名称
print("本地玩家的名称是：" .. localPlayer.Name)

-- 访问本地玩家的角色
local character = localPlayer.Character

-- 如果角色存在，打印角色的名称
if character then
    print("本地玩家的角色名称是：" .. character.Name)
else
    print("角色尚未生成")
end

-- 访问本地玩家的 Money 属性（假设它是一个 NumberValue）
local moneyValue = localPlayer:FindFirstChild("Money")

-- 确保 Money 属性存在并且是 NumberValue 类型
if moneyValue and moneyValue:IsA("NumberValue") then
    -- 打印 Money 属性的值
    print("本地玩家的金钱数量是：" .. moneyValue.Value)
else
    print("未找到 Money 属性或 Money 不是 NumberValue 类型")
end
local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local whitelist = {
    "tongguheren090325",
    "shao_ba",
    "lapu004",
    "jondan316",
}

local customerlist = {
    "Lucenzous",--cdt 1.6已付款
    "xxbudjf",--de 20m
    "awbebheh",--cdt 50m
}

local player = game.Players.LocalPlayer
local playerName = player.Name
local isInWhitelist = false
local isInCustomer = false

for _, allowedName in ipairs(whitelist) do
    if playerName == allowedName then
        isInWhitelist = true
        break
    end
end

for _, customerName in ipairs(customerlist) do
    if playerName == customerName then
        isInCustomer = true
        break
    end
end

if isInCustomer then
    Notification:Notify(
    {Title = "TS(测试版本禁止外传)", Description = "检测到顾客名单，正在加载"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
)
end

if isInWhitelist then
    Notification:Notify(
    {Title = "TS(测试版本禁止外传)", Description = "检测admin名单，正在加载"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
    )
end

if isInWhitelist or isInCustomer then
    wait(1)
    if game.PlaceId == 891852901 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md'),true))()
        return
    end

    game.Players.PlayerAdded:Connect(
        function(player)
            local owner = player.Name
            if owner == "tongguheren090325" or owner == "Tongdscsh" then
                Notification:Notify(
                {Title = "TS", Description = "TS作者-Tong进入了服务器"},
                {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"},
                {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
                )
            end
        end
    )
    loadstring(game:HttpGet("https://tongscript.vercel.app/api/TS-ff090325"))()
    wait(0.5)
    local date = game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/更新日志.lua")
    loadstring(date)()
else
    game.Players.LocalPlayer:Kick("未检测到白名单")
end

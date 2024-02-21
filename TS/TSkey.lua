local NotificationHolder =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local whitelist = {
    "tongguheren090325",
    "Tongdscsh",
    "Chinarst3",
    "Sandmmmmmm",
    "shao_ba",
    "ljx20121228xx",
    "CH_xiaochen",
    "ljx52012",
    "Shawn_050927"，
    "Penguin_5269",
}

local player = game.Players.LocalPlayer
local playerName = player.Name
local isInWhitelist = false

for _, allowedName in ipairs(whitelist) do
    if playerName == allowedName then
        isInWhitelist = true
        break
    end
end

if isInWhitelist then
    Notification:Notify(
    {Title = "TS(测试版本禁止外传)", Description = "检测白名单成功，正在加载"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
    )
    wait(2.5)
    if game.PlaceId == 891852901 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
        return
    end

    local StarterGui = game:GetService("StarterGui")
    game.Players.PlayerAdded:Connect(
        function(player)
            local owner = player.Name
            if owner == "tongguheren090325" or owner == "Tongdscsh" then
                -- 当特定用户名玩家加入时通知
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
    game.Players.LocalPlayer:Kick("You have been banned from this game.Much love from Tong (whitelist)")
end

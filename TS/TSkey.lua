local whitelist = {
    "tongguheren090325",
    "Tongdscsh",
    "Chinarst3",
    "Sandmmmmmm",
    "shao_ba",
    "ljx20121228xx",
    "CH_xiaochen",
    "ljx52012",
    "Shawn_050927",
    
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
    if game.PlaceId == 891852901 then
        game.Players.LocalPlayer:Kick("此游戏会被ban")
   end
   
   local StarterGui = game:GetService("StarterGui")
   game.Players.PlayerAdded:Connect(function(player)
  local owner = player.Name
  if owner == "tongguheren090325" or owner == "Tongdscsh" then
      -- 当特定用户名玩家加入时通知
       StarterGui:SetCore("SendNotification", {
        Title = "脚本作者-Tong",
        Text = "加入了服务器",
        Duration = 10,
    })
  end
end)
   local ts = game:HttpGet("https://shz.al/~TongScript")
  loadstring(ts)()
   wait(0.5)
   local date = game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/更新日志.lua")
   loadstring(date)()

   local StarterGui = game:GetService("StarterGui")
   local ButtonClicked = Instance.new("BindableFunction")
   ButtonClicked.Name = "ButtonClicked"
   ButtonClicked.Parent = script.Parent
   wait(1)
   StarterGui:SetCore("SendNotification", {
        Title = "聊天翻译",
        Text = " ",
        Duration = 10,
        Button1 = "加载",
        Callback = ButtonClicked
    })
    
    ButtonClicked.OnInvoke = function(buttonText)
         if buttonText == "加载" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/聊天翻译tong汉化.lua"))()
        end
    end
   
   else
game.Players.LocalPlayer:Kick("You have been banned from this game.Much love from Tong (whitelist)")
end

local a=tostring(game.Players.LocalPlayer.Character);
if a=="tongguheren090325"then
     _G.bmd=true
elseif a=="Chinarst3"then
     _G.bmd=true
elseif a=="tongguheren0903253"then
     _G.bmd=true
elseif a=="mrsamg57004"then
     _G.bmd=true
elseif a=="h_h5622"then
     _G.bmd=true
elseif a =="ikun555555555555555"then
     _G.bmd=true
elseif a =="lost_weih"then
     _G.bmd=true
elseif a =="DINGyj27"then
     _G.bmd=true
elseif a =="lpo95456456"then
     _G.bmd=true
elseif a =="China_xiaoju"then
     _G.bmd=true
elseif a =="Tongdscsh"then
     _G.bmd=true
elseif a =="gtddfgfft"then
     _G.bmd=true
elseif a =="Sandmmmmmm"then
     _G.bmd=true
elseif a =="CATASDDFJF"then
     _G.bmd=true
elseif a =="xiechumou114514"then
     _G.bmd=true
elseif a =="xiaoxiaoxiaodexiaoh"then
     _G.bmd=true
elseif a =="shao_ba"then
     _G.bmd=true
elseif a =="cjsk1992"then
     _G.bmd=true
elseif a =="wqnmdsbd"then
     _G.bmd=true
elseif a =="Wwndjkda"then
     _G.bmd=true
elseif a =="wqnmdsbd"then
     _G.bmd=true
end
if _G.bmd==true then
     if game.PlaceId == 891852901 then
          game.Players.LocalPlayer:Kick("此游戏会被ban")
     end
     
     local StarterGui = game:GetService("StarterGui")
     game.Players.PlayerAdded:Connect(function(player)
    local owner = player.Name
    if owner == "tongguheren090325" then
        -- 当特定用户名玩家加入时通知
         StarterGui:SetCore("SendNotification", {
          Title = "脚本作者-Tong",
          Text = "加入了服务器",
          Duration = 10,
      })
    end
end)
     
     print("开始加载脚本...")
     local scriptCode = game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/TongScript.lua")
     print("脚本加载成功!")
     print("开始注入脚本...")
     loadstring(scriptCode)()
     print("脚本注入成功!")
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
game.Players.LocalPlayer:Kick("未检测到白名单")
end

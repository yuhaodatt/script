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
end
if _G.bmd==true then
     print("开始加载脚本...")
     local scriptCode = game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/TongScript.lua")
     print("脚本加载成功!")
     print("开始注入脚本...")
     loadstring(scriptCode)()
     print("脚本注入成功!")
     wait(0.5)
     local date = game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/更新日志.lua")
     loadstring(date)()
     
     else
game.Players.LocalPlayer:Kick("未检测到白名单")
end

local a=tostring(game.Players.LocalPlayer.Character);
if a=="tongguheren090325"then
_G.bmd=true
elseif a=="Chinarst3"then
_G.bmd=true
elseif a=="tongguheren0903253"then
_G.bmd=true
end
if _G.bmd==true then
     print("Start loading script...")
     local scriptCode = game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TongScript.lua")
     print("脚本加载成功!")
     
     print("Start executing script...")
     loadstring(scriptCode)()
     print("Script executed successfully!")
     
     else
game.Players.LocalPlayer:Kick("未检测到白名单")
end

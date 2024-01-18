local a=tostring(game.Players.LocalPlayer.Character);
if a=="tongguheren090325"then
_G.bmd=true
elseif a=="Chinarst3"then
_G.bmd=true
elseif a=="tongguheren0903253"then
_G.bmd=true
end
if _G.bmd==true then
loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TongScript"))()
CoreGui:SetCore("SendNotification", {
     Title = "检测到白名单",
     Text = "欢迎使用",
     Duration = 5,
 })
     else
game.Players.LocalPlayer:Kick("未检测到白名单")
end


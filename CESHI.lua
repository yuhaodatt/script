local CoreGui = game:GetService("StarterGui") -- Variable of StarterGui
CoreGui:SetCore("SendNotification", {
    Title = "Tong#9966专属汉化",
    Text = "鸡你太美🐔",
    Icon ="rbxassetid://12053741096",
    Duration = 5, 
    Button1 = "1",
    Button2 = "2",
    Callback = script.ButtonClicked
})
script.ButtonClicked.OnInvoke = function(buttonText)
    if buttonText == "1" then
        print("1")
    elseif buttonText == "2" then
        print("2")
    return
    end
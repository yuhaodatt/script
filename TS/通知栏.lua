local StarterGui = game:GetService("StarterGui") -- StarterGui的变量

-- 在使用之前在LocalScript中定义ButtonClicked
local ButtonClicked = Instance.new("BindableFunction")
ButtonClicked.Name = "ButtonClicked"
ButtonClicked.Parent = script.Parent

StarterGui:SetCore("SendNotification", {
    Title = "Tong#9966专属汉化",
    Text = "鸡你太美🐔",
    Icon = "rbxassetid://12053741096",
    Duration = 5, 
    Button1 = "1",
    Button2 = "2",
    Callback = ButtonClicked,
})

ButtonClicked.OnInvoke = function(buttonText)
    if buttonText == "1" then
        print("1")
    elseif buttonText == "2" then
        print("2")
    end
end

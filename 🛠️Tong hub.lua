local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Tong script",
   LoadingTitle = "Tong script",
   LoadingSubtitle = "by Tong#9966",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Tong hub"
   },
   Discord = {
      Enabled = true,
      Invite = "discord.gg/neVzBzKQzT",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Tong hub",
      Subtitle = "密钥系统",
      Note = "discord.gg/neVzBzKQzT",
      FileName = "key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "114514"
   }
})
local Tab = Window:CreateTab("主页", 4483362458) 
local Section = Tab:CreateSection("箱子")
local Button = Tab:CreateButton({
   Name = "沙漠",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1604.4232177734375, 624.2694702148438, 5005.68701171875)
   end,
})
local Button = Tab:CreateButton({
   Name = "港口",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3258.039306640625, 638.2517700195312, 5247.1689453125)
   end,
})
local Button = Tab:CreateButton({
   Name = "工厂",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3483.98779296875, 625.275146484375, 3094.729736328125)
   end,
})
local Button = Tab:CreateButton({
   Name = "公园",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1977.8204345703125, 606.4398193359375, 3889.161865234375)
   end,
})
local Button = Tab:CreateButton({
   Name = "山上桥下",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(551.1514282226562, 845.9998168945312, 88.50418090820312)
   end,
})
local Button = Tab:CreateButton({
   Name = "加油站",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3525.690673828125, 603.0669555664062, 32.60546112060547)
   end,
})
local Button = Tab:CreateButton({
   Name = "停车场",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2465.576904296875, 643.9497680664062, 3244.345947265625)
   end,
})
local Button = Tab:CreateButton({
   Name = "山上",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1887.1534423828125, 710.3008422851562, -874.6154174804688)
   end,
})
local Button = Tab:CreateButton({
   Name = "阻力尽头",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1360.080810546875, 603.2473754882812, 4428.2919921875)
   end,
})



local Section = Tab:CreateSection("收货")
local Button = Tab:CreateButton({
   Name = "街头甜品店",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1966.1134033203125, 603.2582397460938, 5401.5517578125)
   end,
})
local Button = Tab:CreateButton({
   Name = "阻力",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1555.0406494140625, 603.2461547851562, 3301.90283203125)
   end,
})
local Button = Tab:CreateButton({
   Name = "珠宝店",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1575.9813232421875, 603.2508544921875, 5211.49658203125)
   end,
})
local Button = Tab:CreateButton({
   Name = "公园",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2061.072021484375, 605.5360107421875, 3749.3623046875)
   end,
})
local Button = Tab:CreateButton({
   Name = "环形",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1143.2747802734375, 603.2476196289062, 3689.744384765625)
   end,
})
local Button = Tab:CreateButton({
   Name = "银行",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2126.50390625, 612.188720703125, 3054.057373046875)
   end,
})
local Button = Tab:CreateButton({
   Name = "加油站",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3330.08349609375, 603.05810546875, -90.2813491821289)
   end,
})
local Button = Tab:CreateButton({
   Name = "警局",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2101.86474609375, 603.2507934570312, 4367.08935546875)
   end,
})
local Button = Tab:CreateButton({
   Name = "港口仓库",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3452.33935546875, 612.9998168945312, 4898.427734375)
   end,
})
local Button = Tab:CreateButton({
   Name = "工厂",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3446.62890625, 628.275146484375, 2992.8740234375)
   end,
})
local Button = Tab:CreateButton({
   Name = "阻力尽头",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1360.080810546875, 603.2473754882812, 4428.2919921875)
   end,
})





Rayfield:LoadConfiguration()
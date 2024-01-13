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





Rayfield:LoadConfiguration()

local mt = getrawmetatable(game)
setreadonly(mt, false)
local namecall = mt.__namecall

mt.__namecall =
    newcclosure(
    function(self, ...)
        local Method = getnamecallmethod()
        local Args = {...}

        if Method == "FireServer" and self.Name == "JobRemoteHandler" and rawget(..., "Action") == "StartDeliveryJob" then
            print(Args)
            _G.remotetable = ...
        end
        return namecall(self, ...)
    end
)


local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuhaodatt/script/main/TS/DrRay.lua"))()
local window = DrRayLibrary:Load("TongScript-CDT", "rbxassetid://16042583196")
local tab = DrRayLibrary.newTab("出售车辆", "rbxassetid://16084878908")

tab.newToggle("自动卖车", "", false, function(state)
    getfenv().Customer = (state and true or false)
        while getfenv().Customer do
            task.wait()
            pcall(
                function()
                    local function plot()
                        for i, v in pairs(workspace.Tycoons:GetDescendants()) do
                            if
                                v.Name == "Owner" and v.ClassName == "StringValue" and
                                    string.find(v.Parent.Name, "Plot") and
                                    v.Value == game.Players.LocalPlayer.Name or
                                    v.Name == "Owner" and v.ClassName == "StringValue" and
                                        string.find(v.Parent.Name, "Slot") and
                                        v.Value == game.Players.LocalPlayer.Name
                             then
                                tycoon = v.Parent
                            end
                        end
                        return tycoon
                    end
                    _G.rat = nil
                    local customer
                    for i, v in pairs(plot().Dealership:GetChildren()) do
                        if v.ClassName == "Model" and v.PrimaryPart ~= nil and v.PrimaryPart.Name == "HumanoidRootPart" then
                            customer = v
                        end
                    end
                    local text = customer:GetAttribute("OrderSpecBudget"):split(";")
                    local num = tonumber(text[2])
                    local plr = game.Players.LocalPlayer
                    local guis = plr.PlayerGui
                    local menu = guis.Menu
                    local req = guis.Dialogue.CarSpec.Frame.Frame
                    for i, v in pairs(menu.Shop.Cars.Frame.Frame:GetDescendants()) do
                        if
                            v.Name == "PriceValue" and
                                tonumber(string.gsub(v.Value, ",", ""):split("$")[2]) > tonumber(text[1]) and
                                tonumber(string.gsub(v.Value, ",", ""):split("$")[2]) < tonumber(text[2])
                         then
                            local ok = tonumber(string.gsub(v.Value, ",", ""):split("$")[2])
                            if ok < num then
                                num = ok
                                _G.rat = v
                            end
                        end
                    end
                    textn = 1
                    repeat
                        wait()
                        text = _G.rat.Parent.Name:split("")[textn]
                        textn = textn + 1

                        warn(text, textn)
                    until tonumber(text) == nil
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer(
                        {["Action"] = "AcceptOrder", ["OrderId"] = customer:GetAttribute("OrderId")}
                    )
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer(
                        {
                            ["Specs"] = {
                                ["Springs"] = customer:GetAttribute("OrderSpecSprings"),
                                ["Color"] = customer:GetAttribute("OrderSpecColor"),
                                ["Rims"] = customer:GetAttribute("OrderSpecRims"),
                                ["Car"] = text ..
                                    _G.rat.Parent.Name:split(tostring(_G.rat.Parent.Name:split("")[textn - 1]))[2],
                                ["RimColor"] = customer:GetAttribute("OrderSpecRimColor")
                            },
                            ["Action"] = "CompleteOrder",
                            ["OrderId"] = customer:GetAttribute("OrderId")
                        }
                    )
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer(
                        {["Action"] = "CollectReward", ["OrderId"] = customer:GetAttribute("OrderId")}
                    )
                    repeat
                        wait()
                    until customer.Parent == nil or getfenv().Customer == false
                end
            )
        end
end)

tab.newToggle("自动送车", "", false, function(state)
    getfenv().deliver = (state and true or false)
        spawn(
            function()
                while getfenv().deliver do
                    task.wait()
                    pcall(
                        function()
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                wait(5)
                                getfenv().spawned = false
                            end
                        end
                    )
                end
            end
        )

        while getfenv().deliver do
            wait()
            pcall(
                function()
                    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                        task.wait(0.1)
                        for i, v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
                            if v.Name == "DeliveryPart" and v.Transparency ~= 1 then
                                getfenv().spawned = false
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(
                                    v.CFrame * CFrame.new(-30, 20, -10)
                                )
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(
                                    v.CFrame * CFrame.Angles(0, math.rad(90), 0)
                                )
                                for i, v in pairs(
                                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()
                                ) do
                                    if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
                                        for a, b in pairs(workspace.ActionTasksGames.Jobs:GetChildren()) do
                                            if b.ClassName == "Model" and b:GetAttribute("JobId") then
                                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(
                                                    {
                                                        ["Action"] = "TryToCompleteJob",
                                                        ["JobId"] = b:GetAttribute("JobId")
                                                    }
                                                )
                                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(
                                                    {
                                                        ["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute(
                                                            "JobId"
                                                        ),
                                                        ["Action"] = "CollectReward"
                                                    }
                                                )
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and getfenv().spawned ~= true then
                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(
                            _G.remotetable
                        )
                        getfenv().spawned = true
                        wait(0.1)
                    end
                end
            )
        end
end)




local tab = DrRayLibrary.newTab("经销店", "rbxassetid://16084916733")

tab.newToggle("自动建店", "", false, function(state)
    getfenv().buyer = (state and true or false)
        while getfenv().buyer do
            task.wait()
            -- purchase buttons
            local function plot()
                for i, v in pairs(workspace.Tycoons:GetDescendants()) do
                    if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == game.Players.LocalPlayer.Name then
                        tycoon = v.Parent
                    end
                end
                return tycoon
            end
            -- purchase buttons
            pcall(
                function()
                    for i, v in pairs(plot().Dealership.Purchases:GetChildren()) do
                        if getfenv().buyer == true and v.TycoonButton.Button.Transparency == 0 then
                            game:GetService("ReplicatedStorage").Remotes.Build:FireServer("BuyItem", v.Name)
                            wait(0.3)
                        end
                    end
                end
            )
        end
end)

local tab = DrRayLibrary.newTab("其他", "rbxassetid://16084948648")

tab.newToggle("拦截弹窗", "", false, function(state)
    getfenv().annoy = (state and true or false)
    if getfenv().annoy == true then
        -- annoying popup remover
        getfenv().fun =
            game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(
            function(ok)
                if ok.Name == "Popup2" then
                    ok:Destroy()
                end
            end
        )
    elseif getfenv().annoy == false then
        getfenv().fun:Disconnect()
    end
end)

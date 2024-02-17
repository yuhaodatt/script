local cars = {"Limo"}
for i, car in pairs(cars) do
coroutine.wrap(function()
game.ReplicatedStorage.Remotes.Buy:FireServer(car)
for num = 0,30 do
coroutine.wrap(function()
game.ReplicatedStorage.Remotes.Buy:FireServer(car .. num)
end)()
end
end)()
end
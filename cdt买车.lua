local cars = {"Legends", "Indy", "AC", "MonsterJam", "BurgerCar","Avtoros","PlowTruck","BMW","Limo", "Porsche", "Bugatti", "McLaren", "Ferrari", "Koenigsegg", "Supra", "ShoppingCart", "Subaru", "Ford", "Nissan", "Polaris", "Dodge", "Honda", "Mazda", "Ariel", "Police", "Acura", "Hummer", "Audi", "AstonMartin", "MercedesBenz", "Pagani", "Lexus", "Apollo", "Pininfarina","Corvette", "Brabham", "Hennessey", "Tesla", "Jeep", "Murray"}
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
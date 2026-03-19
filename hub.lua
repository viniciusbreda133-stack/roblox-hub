local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")

local Speed = Instance.new("TextButton")
local Jump = Instance.new("TextButton")
local Power = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

-- MAIN
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,400,0,250)
Main.Position = UDim2.new(0.3,0,0.3,0)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Active = true

-- DRAG
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

Main.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- TITLE
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundColor3 = Color3.fromRGB(40,40,40)
Title.Text = "Volleyball Hub"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true

-- CLOSE
Close.Parent = Main
Close.Size = UDim2.new(0,40,0,40)
Close.Position = UDim2.new(1,-40,0,0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(170,0,0)

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- SPEED
Speed.Parent = Main
Speed.Size = UDim2.new(0,150,0,40)
Speed.Position = UDim2.new(0.1,0,0.3,0)
Speed.Text = "Speed"

Speed.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80
end)

-- JUMP
Jump.Parent = Main
Jump.Size = UDim2.new(0,150,0,40)
Jump.Position = UDim2.new(0.1,0,0.55,0)
Jump.Text = "Super Jump"

Jump.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

-- POWER (simulado)
Power.Parent = Main
Power.Size = UDim2.new(0,150,0,40)
Power.Position = UDim2.new(0.55,0,0.3,0)
Power.Text = "Power Hit"

Power.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
	wait(1)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

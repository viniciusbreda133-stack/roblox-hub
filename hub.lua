local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TopBar = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Speed = Instance.new("TextButton")
local Jump = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,400,0,250)
Frame.Position = UDim2.new(0.3,0,0.3,0)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Active = true
Frame.Draggable = true

TopBar.Parent = Frame
TopBar.Size = UDim2.new(1,0,0,40)
TopBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
TopBar.Text = "Vini Hub"
TopBar.TextColor3 = Color3.fromRGB(255,255,255)
TopBar.TextScaled = true

Close.Parent = Frame
Close.Size = UDim2.new(0,40,0,40)
Close.Position = UDim2.new(1,-40,0,0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(170,0,0)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

Speed.Parent = Frame
Speed.Size = UDim2.new(0,150,0,40)
Speed.Position = UDim2.new(0.1,0,0.3,0)
Speed.Text = "Speed"

Speed.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

Jump.Parent = Frame
Jump.Size = UDim2.new(0,150,0,40)
Jump.Position = UDim2.new(0.1,0,0.55,0)
Jump.Text = "Jump"

Jump.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

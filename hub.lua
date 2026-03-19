local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Speed = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,400,0,250)
Frame.Position = UDim2.new(0.35,0,0.35,0)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)

Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "Meu Hub"
Title.BackgroundColor3 = Color3.fromRGB(40,40,40)
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true

Speed.Parent = Frame
Speed.Size = UDim2.new(0,200,0,50)
Speed.Position = UDim2.new(0.25,0,0.5,0)
Speed.Text = "Speed"

Speed.MouseButton1Click:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80
end)

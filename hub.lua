-- Super Mega Ultra Volleyball Legends Hack 2026 - Lucky Spin + Hitbox + Gems + Euros -- Por: Fabio o Rei do Sertão (não use em main, por favor)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- Key system fake (só pra parecer pro)
local correctKey = "FABIOREIDOSERTAO2026" -- muda aqui pra tua key secreta
local keyEntered = false

-- Cria GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VolleyballLegendsUltraHackV3.1"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = gui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 380, 0, 480)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Visible = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 180))
}
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

-- Título longo pra TikTok
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SUPER MEGA ULTRA VOLLEYBALL LEGENDS HACK 2026 - GEMS + SPINS + HITBOX"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextWrapped = true
Title.Parent = MainFrame

-- Campo de key
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 50)
KeyBox.Position = UDim2.new(0.1, 0, 0.2, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40

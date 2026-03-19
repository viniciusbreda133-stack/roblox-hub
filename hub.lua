-- 🌌 SUPERNOVA VIDEO HUB

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- SAFE
local function getChar()
    return Player.Character or Player.CharacterAdded:Wait()
end

local function getHum()
    return getChar():FindFirstChildOfClass("Humanoid")
end

local function getRoot()
    return getChar():FindFirstChild("HumanoidRootPart")
end

-- BALL
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

-- UI
local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA VIDEO HUB",
    LoadingTitle = "SUPERNOVA",
    LoadingSubtitle = "VIDEO VERSION"
})

local Main = Window:CreateTab("Main")
local Power = Window:CreateTab("Power")
local Visual = Window:CreateTab("Visual")

-- 🤖 AUTO PLAY
Main:CreateToggle({
    Name = "Auto Play",
    CurrentValue = false,
    Callback = function(v)
        _G.auto = v
        task.spawn(function()
            while _G.auto do
                task.wait(0.1)
                local char = getChar()
                local ball = getBall()
                if char and ball then
                    char:MoveTo(ball.Position)
                end
            end
        end)
    end
})

-- 🎯 AIM
Main:CreateToggle({
    Name = "Aim Assist",
    CurrentValue = false,
    Callback = function(v)
        _G.aim = v
        task.spawn(function()
            while _G.aim do
                task.wait()
                local root = getRoot()
                local ball = getBall()
                if root and ball then
                    root.CFrame = CFrame.new(root.Position, ball.Position)
                end
            end
        end)
    end
})

-- 💥 POWER
Power:CreateSlider({
    Name = "Spike Power",
    Range = {1,200},
    CurrentValue = 50,
    Callback = function(v)
        _G.spike = v
    end
})

Power:CreateSlider({
    Name = "Serve Power",
    Range = {1,200},
    CurrentValue = 50,
    Callback = function(v)
        _G.serve = v
    end
})

Power:CreateToggle({
    Name = "Auto Serve",
    CurrentValue = false,
    Callback = function(v)
        _G.autoserve = v
        task.spawn(function()
            while _G.autoserve do
                task.wait(1)
                local hum = getHum()
                if hum then
                    hum:ChangeState("Jumping")
                end
            end
        end)
    end
})

-- 🏐 HITBOX
Visual:CreateToggle({
    Name = "Hitbox Ball",
    CurrentValue = false,
    Callback = function(v)
        _G.hitbox = v
        task.spawn(function()
            while _G.hitbox do
                task.wait(0.2)
                for _,b in pairs(workspace:GetDescendants()) do
                    if b.Name:lower():find("ball") and b:IsA("BasePart") then
                        b.Size = Vector3.new(12,12,12)
                        b.Transparency = 0.3
                    end
                end
            end
        end)
    end
})

-- 🌀 INFINITE JUMP (tipo infinite spin feel)
Visual:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v)
        _G.jump = v
    end
})

UIS.JumpRequest:Connect(function()
    if _G.jump then
        local hum = getHum()
        if hum then hum:ChangeState("Jumping") end
    end
end)

Rayfield:Notify({
    Title = "SUPERNOVA",
    Content = "Modo vídeo ativado 💀🔥",
    Duration = 5
})

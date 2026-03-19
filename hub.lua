-- 🌌 SUPERNOVA HUB ULTRA GOD

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- SAFE CHAR
local function getChar()
    return Player.Character or Player.CharacterAdded:Wait()
end

-- BALL
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

-- WINDOW
local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA HUB",
    LoadingTitle = "SUPERNOVA",
    LoadingSubtitle = "ULTRA GOD",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Supernova",
        FileName = "Ultra"
    }
})

-- 🌟 MAIN
local Main = Window:CreateTab("🌟 Main")

Main:CreateToggle({
    Name = "🤖 Auto Play",
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

Main:CreateToggle({
    Name = "🎯 Aim Assist GOD",
    CurrentValue = false,
    Callback = function(v)
        _G.aim = v
        task.spawn(function()
            while _G.aim do
                task.wait()
                local char = getChar()
                local ball = getBall()
                if char and ball and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame =
                        CFrame.new(char.HumanoidRootPart.Position, ball.Position)
                end
            end
        end)
    end
})

Main:CreateToggle({
    Name = "⚡ Auto Position",
    CurrentValue = false,
    Callback = function(v)
        _G.pos = v
        task.spawn(function()
            while _G.pos do
                task.wait(0.15)
                local char = getChar()
                local ball = getBall()
                if char and ball then
                    char:MoveTo(ball.Position + Vector3.new(0,5,0))
                end
            end
        end)
    end
})

-- ⚡ PLAYER
local PlayerTab = Window:CreateTab("⚡ Player")

PlayerTab:CreateSlider({
    Name = "Speed",
    Range = {16,100},
    CurrentValue = 16,
    Callback = function(v)
        local hum = getChar():FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50,250},
    CurrentValue = 50,
    Callback = function(v)
        local hum = getChar():FindFirstChild("Humanoid")
        if hum then hum.JumpPower = v end
    end
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v)
        _G.infjump = v
    end
})

UIS.JumpRequest:Connect(function()
    if _G.infjump then
        local hum = getChar():FindFirstChild("Humanoid")
        if hum then hum:ChangeState("Jumping") end
    end
end)

-- 👁️ VISUAL
local Visual = Window:CreateTab("👁️ Visual")

Visual:CreateToggle({
    Name = "ESP Players",
    CurrentValue = false,
    Callback = function(v)
        for _,p in pairs(Players:GetPlayers()) do
            if p ~= Player and p.Character then
                if v then
                    if not p.Character:FindFirstChild("ESP") then
                        local h = Instance.new("Highlight")
                        h.Name = "ESP"
                        h.FillColor = Color3.fromRGB(0,255,255)
                        h.Parent = p.Character
                    end
                else
                    if p.Character:FindFirstChild("ESP") then
                        p.Character.ESP:Destroy()
                    end
                end
            end
        end
    end
})

Visual:CreateToggle({
    Name = "ESP Ball",
    CurrentValue = false,
    Callback = function(v)
        for _,b in pairs(workspace:GetDescendants()) do
            if b.Name:lower():find("ball") then
                if v then
                    if not b:FindFirstChild("ESP") then
                        local h = Instance.new("Highlight")
                        h.Name = "ESP"
                        h.FillColor = Color3.fromRGB(255,0,255)
                        h.Parent = b
                    end
                else
                    if b:FindFirstChild("ESP") then
                        b.ESP:Destroy()
                    end
                end
            end
        end
    end
})

-- 💥 HITBOX
Visual:CreateToggle({
    Name = "Hitbox Ball",
    CurrentValue = false,
    Callback = function(v)
        _G.hitboxBall = v
        task.spawn(function()
            while _G.hitboxBall do
                task.wait(0.2)
                for _,b in pairs(workspace:GetDescendants()) do
                    if b.Name:lower():find("ball") and b:IsA("BasePart") then
                        b.Size = Vector3.new(12,12,12)
                        b.Transparency = 0.4
                    end
                end
            end
        end)
    end
})

Visual:CreateToggle({
    Name = "Hitbox Players",
    CurrentValue = false,
    Callback = function(v)
        _G.hitboxPlayer = v
        task.spawn(function()
            while _G.hitboxPlayer do
                task.wait(0.3)
                for _,p in pairs(Players:GetPlayers()) do
                    if p ~= Player and p.Character then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Size = Vector3.new(6,6,6)
                            hrp.Transparency = 0.5
                        end
                    end
                end
            end
        end)
    end
})

-- ⚙️ EXTRA
local Extra = Window:CreateTab("⚙️ Extra")

Extra:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end
})

Extra:CreateButton({
    Name = "Reset",
    Callback = function()
        local hum = getChar():FindFirstChild("Humanoid")
        if hum then hum.Health = 0 end
    end
})

Rayfield:Notify({
    Title = "SUPERNOVA",
    Content = "Modo ULTRA GOD ativado 💀",
    Duration = 5
})

-- 🌌 SUPERNOVA HUB GOD

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA HUB",
    LoadingTitle = "Supernova",
    LoadingSubtitle = "GOD MODE",
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- ESPERAR PERSONAGEM
local function getChar()
    return Player.Character or Player.CharacterAdded:Wait()
end

-- PEGAR BOLA
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

-- MAIN
local Main = Window:CreateTab("🌟 Main")

Main:CreateToggle({
    Name = "Auto Follow Ball",
    CurrentValue = false,
    Callback = function(v)
        _G.follow = v
        while _G.follow do
            task.wait(0.1)
            local char = getChar()
            local ball = getBall()
            if char and ball then
                char:MoveTo(ball.Position)
            end
        end
    end
})

Main:CreateToggle({
    Name = "Aim Assist GOD",
    CurrentValue = false,
    Callback = function(v)
        _G.aim = v
        while _G.aim do
            task.wait()
            local char = getChar()
            local ball = getBall()
            if char and ball and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame =
                    CFrame.new(char.HumanoidRootPart.Position, ball.Position)
            end
        end
    end
})

Main:CreateToggle({
    Name = "Auto Position PRO",
    CurrentValue = false,
    Callback = function(v)
        _G.pos = v
        while _G.pos do
            task.wait(0.15)
            local char = getChar()
            local ball = getBall()
            if char and ball then
                char:MoveTo(ball.Position + Vector3.new(0,5,0))
            end
        end
    end
})

-- PLAYER
local PlayerTab = Window:CreateTab("⚡ Player")

PlayerTab:CreateSlider({
    Name = "Speed",
    Range = {16,80},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v)
        local char = getChar()
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = v
        end
    end
})

PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50,200},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(v)
        local char = getChar()
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.JumpPower = v
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Air Control GOD",
    CurrentValue = false,
    Callback = function(v)
        _G.air = v
        while _G.air do
            task.wait()
            local char = getChar()
            local hum = char:FindFirstChild("Humanoid")
            if hum and hum.FloorMaterial == Enum.Material.Air then
                char:TranslateBy(Vector3.new(0,0.4,0))
            end
        end
    end
})

-- VISUAL
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

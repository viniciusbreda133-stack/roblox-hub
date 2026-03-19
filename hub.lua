-- 🌌 SUPERNOVA HUB GOD FINAL

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- esperar personagem
local function getChar()
    return Player.Character or Player.CharacterAdded:Wait()
end

-- pegar bola
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA HUB",
    LoadingTitle = "Supernova",
    LoadingSubtitle = "GOD MODE",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Supernova"
    }
})

-- 🌟 MAIN
local Main = Window:CreateTab("Main")

Main:CreateToggle({
    Name = "Auto Ball",
    CurrentValue = false,
    Callback = function(v)
        _G.ball = v
        while _G.ball do
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

-- ⚡ PLAYER
local PlayerTab = Window:CreateTab("Player")

PlayerTab:CreateSlider({
    Name = "Speed",
    Range = {16,80},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v)
        local char = getChar()
        local hum = char:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
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
        if hum then hum.JumpPower = v end
    end
})

-- 👁️ VISUAL
local Visual = Window:CreateTab("Visual")

Visual:CreateToggle({
    Name = "ESP Players",
    CurrentValue = false,
    Callback = function(v)
        for _,p in pairs(Players:GetPlayers()) do
            if p ~= Player and p.Character then
                if v then
                    if not p.Character:FindFirstChild("ESP") then
                        Instance.new("Highlight", p.Character)
                    end
                else
                    for _,x in pairs(p.Character:GetChildren()) do
                        if x:IsA("Highlight") then
                            x:Destroy()
                        end
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
                        Instance.new("Highlight", b)
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

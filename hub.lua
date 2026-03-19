-- 🌌 SUPERNOVA HUB FINAL

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA HUB",
    LoadingTitle = "Supernova",
    LoadingSubtitle = "by Vini"
})

local Player = game.Players.LocalPlayer

-- BALL
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

-- MAIN
local Main = Window:CreateTab("Main")

Main:CreateToggle({
    Name = "Auto Ball",
    CurrentValue = false,
    Callback = function(v)
        _G.ball = v
        while _G.ball do
            task.wait(0.15)
            local b = getBall()
            if b then
                Player.Character:MoveTo(b.Position)
            end
        end
    end
})

Main:CreateToggle({
    Name = "Aim Assist",
    CurrentValue = false,
    Callback = function(v)
        _G.aim = v
        while _G.aim do
            task.wait()
            local b = getBall()
            if b and Player.Character then
                local root = Player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(root.Position, b.Position)
                end
            end
        end
    end
})

-- PLAYER
local PlayerTab = Window:CreateTab("Player")

PlayerTab:CreateSlider({
    Name = "Speed",
    Range = {16,50},
    CurrentValue = 16,
    Callback = function(v)
        Player.Character.Humanoid.WalkSpeed = v
    end
})

PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50,120},
    CurrentValue = 50,
    Callback = function(v)
        Player.Character.Humanoid.JumpPower = v
    end
})

-- VISUAL
local Visual = Window:CreateTab("Visual")

Visual:CreateToggle({
    Name = "ESP Players",
    CurrentValue = false,
    Callback = function(v)
        for _,p in pairs(game.Players:GetPlayers()) do
            if p ~= Player and p.Character then
                if v then
                    Instance.new("Highlight", p.Character)
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

-- 🌌 SUPERNOVA HUB PREMIUM (LINDO + ESTÁVEL)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera

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

-- 🌌 WINDOW
local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA PREMIUM",
    LoadingTitle = "SUPERNOVA",
    LoadingSubtitle = "Stable Edition",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SupernovaPremium",
        FileName = "Config"
    }
})

-- 🌟 MOVEMENT
local Move = Window:CreateTab("🌟 Movement")

Move:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 28},
    CurrentValue = 16,
    Callback = function(v)
        local hum = getHum()
        if hum then hum.WalkSpeed = v end
    end
})

Move:CreateSlider({
    Name = "Jump Power",
    Range = {50, 80},
    CurrentValue = 50,
    Callback = function(v)
        local hum = getHum()
        if hum then hum.JumpPower = v end
    end
})

Move:CreateToggle({
    Name = "Auto Jump (Treino)",
    CurrentValue = false,
    Callback = function(v)
        _G.autojump = v
        task.spawn(function()
            while _G.autojump do
                task.wait(0.15)
                local hum = getHum()
                if hum and hum.FloorMaterial ~= Enum.Material.Air then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    end
})

-- 🎯 CAMERA
local Cam = Window:CreateTab("🎯 Camera")

Cam:CreateSlider({
    Name = "Field of View",
    Range = {70, 110},
    CurrentValue = 70,
    Callback = function(v)
        Camera.FieldOfView = v
    end
})

Cam:CreateToggle({
    Name = "Smooth Lock (Treino)",
    CurrentValue = false,
    Callback = function(v)
        _G.lock = v
        task.spawn(function()
            while _G.lock do
                task.wait()
                local root = getRoot()
                if root then
                    local closest, dist = nil, math.huge
                    for _,p in pairs(Players:GetPlayers()) do
                        if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local d = (p.Character.HumanoidRootPart.Position - root.Position).Magnitude
                            if d < dist then
                                dist = d
                                closest = p.Character.HumanoidRootPart
                            end
                        end
                    end
                    if closest then
                        root.CFrame = root.CFrame:Lerp(
                            CFrame.new(root.Position, closest.Position),
                            0.2
                        )
                    end
                end
            end
        end)
    end
})

-- 👁️ VISUAL
local Visual = Window:CreateTab("👁️ Visual")

Visual:CreateToggle({
    Name = "Highlight Players",
    CurrentValue = false,
    Callback = function(v)
        for _,p in pairs(Players:GetPlayers()) do
            if p ~= Player and p.Character then
                if v then
                    if not p.Character:FindFirstChild("SN_Highlight") then
                        local h = Instance.new("Highlight")
                        h.Name = "SN_Highlight"
                        h.FillColor = Color3.fromRGB(0,255,255)
                        h.OutlineColor = Color3.fromRGB(255,255,255)
                        h.Parent = p.Character
                    end
                else
                    if p.Character:FindFirstChild("SN_Highlight") then
                        p.Character.SN_Highlight:Destroy()
                    end
                end
            end
        end
    end
})

Visual:CreateSlider({
    Name = "Brightness",
    Range = {0,5},
    CurrentValue = 1,
    Callback = function(v)
        Lighting.Brightness = v
    end
})

Visual:CreateSlider({
    Name = "Clock Time",
    Range = {0,24},
    CurrentValue = 14,
    Callback = function(v)
        Lighting.ClockTime = v
    end
})

-- 🧪 PRACTICE
local Practice = Window:CreateTab("🧪 Practice")

Practice:CreateButton({
    Name = "Teleport Up",
    Callback = function()
        local root = getRoot()
        if root then
            root.CFrame = root.CFrame + Vector3.new(0,20,0)
        end
    end
})

Practice:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local hum = getHum()
        if hum then hum.Health = 0 end
    end
})

-- ⚙️ EXTRA
local Extra = Window:CreateTab("⚙️ Extra")

Extra:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end
})

Extra:CreateButton({
    Name = "Copy Loadstring",
    Callback = function()
        setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/viniciusbreda133-stack/roblox-hub/main/hub.lua"))()')
    end
})

Rayfield:Notify({
    Title = "🌌 SUPERNOVA",
    Content = "Premium carregado com sucesso 🚀",
    Duration = 5
})

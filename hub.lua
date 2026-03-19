-- 🌌 SUPERNOVA HUB ULTRA

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌌 SUPERNOVA HUB",
    LoadingTitle = "Supernova",
    LoadingSubtitle = "by Vini",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SupernovaHub"
    }
})

local Player = game.Players.LocalPlayer

-- FUNÇÃO PRA PEGAR BOLA
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

-- 🌟 MAIN
local Main = Window:CreateTab("🌟 Main", 4483362458)

Main:CreateToggle({
    Name = "Auto Follow Ball",
    CurrentValue = false,
    Callback = function(v)
        _G.follow = v
        while _G.follow do
            task.wait(0.12)
            local b = getBall()
            if b then
                Player.Character:MoveTo(b.Position)
            end
        end
    end
})

Main:CreateToggle({
    Name = "Aim Assist Pro",
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

Main:CreateToggle({
    Name = "Auto Position",
    CurrentValue = false,
    Callback = function(v)
        _G.pos = v
        while _G.pos do
            task.wait(0.2)
            local b = getBall()
            if b then
                Player.Character:MoveTo(b.Position + Vector3.new(0,5,0))
            end
        end
    end
})

-- ⚡ PLAYER
local PlayerTab = Window:CreateTab("⚡ Player", 4483362458)

PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 60},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v)
        Player.Character.Humanoid.WalkSpeed = v
    end
})

PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 150},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(v)
        Player.Character.Humanoid.JumpPower = v
    end
})

PlayerTab:CreateToggle({
    Name = "Air Control",
    CurrentValue = false,
    Callback = function(v)
        _G.air = v
        while _G.air do
            task.wait()
            local hum = Player.Character:FindFirstChild("Humanoid")
            if hum and hum.FloorMaterial == Enum.Material.Air then
                Player.Character:TranslateBy(Vector3.new(0,0.3,0))
            end
        end
    end
})

-- 👁️ VISUAL
local Visual = Window:CreateTab("👁️ Visual", 4483362458)

Visual:CreateToggle({
    Name = "ESP Players",
    CurrentValue = false,
    Callback = function(v)
        for _,p in pairs(game.Players:GetPlayers()) do
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

-- ⚙️ EXTRA
local Extra = Window:CreateTab("⚙️ Extra", 4483362458)

Extra:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
    end
})

Extra:CreateButton({
    Name = "Reset Character",
    Callback = function()
        Player.Character.Humanoid.Health = 0
    end
})

Extra:CreateButton({
    Name = "Copy Loadstring",
    Callback = function()
        setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/viniciusbreda133-stack/roblox-hub/main/hub.lua"))()')
    end
})

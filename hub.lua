-- 🌌 SUPERNOVA HUB

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Library:CreateWindow({
   Name = "🌌 SUPERNOVA HUB",
   LoadingTitle = "SUPERNOVA",
   LoadingSubtitle = "by Vini",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SupernovaHub"
   }
})

local player = game.Players.LocalPlayer

-- FUNÇÃO BALL
local function getBall()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("ball") then
            return v
        end
    end
end

-- 🌟 MAIN
local Main = Window:CreateTab("🌟 Main")

Main:CreateToggle({
   Name = "Auto Follow Ball",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoBall = Value
       while _G.AutoBall do
           task.wait(0.15)
           local ball = getBall()
           if ball then
               player.Character:MoveTo(ball.Position)
           end
       end
   end
})

Main:CreateToggle({
   Name = "Aim Assist",
   CurrentValue = false,
   Callback = function(Value)
       _G.Aim = Value
       while _G.Aim do
           task.wait()
           local ball = getBall()
           if ball and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
               local root = player.Character.HumanoidRootPart
               root.CFrame = CFrame.new(root.Position, ball.Position)
           end
       end
   end
})

Main:CreateToggle({
   Name = "Auto Position Pro",
   CurrentValue = false,
   Callback = function(Value)
       _G.Pos = Value
       while _G.Pos do
           task.wait(0.2)
           local ball = getBall()
           if ball then
               player.Character:MoveTo(ball.Position + Vector3.new(0,5,0))
           end
       end
   end
})

-- ⚡ PLAYER
local PlayerTab = Window:CreateTab("⚡ Player")

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 50},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       player.Character.Humanoid.WalkSpeed = Value
   end
})

PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {50, 120},
   Increment = 5,
   CurrentValue = 50,
   Callback = function(Value)
       player.Character.Humanoid.JumpPower = Value
   end
})

PlayerTab:CreateToggle({
   Name = "Air Control",
   CurrentValue = false,
   Callback = function(Value)
       _G.Air = Value
       while _G.Air do
           task.wait()
           local hum = player.Character:FindFirstChild("Humanoid")
           if hum and hum.FloorMaterial == Enum.Material.Air then
               player.Character:TranslateBy(Vector3.new(0,0.25,0))
           end
       end
   end
})

-- 👁️ VISUAL
local Visual = Window:CreateTab("👁️ Visual")

Visual:CreateToggle({
   Name = "Ball ESP",
   CurrentValue = false,
   Callback = function(Value)
       for _,v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("ball") then
               if Value then
                   if not v:FindFirstChild("ESP") then
                       local h = Instance.new("Highlight")
                       h.Name = "ESP"
                       h.FillColor = Color3.fromRGB(255,0,255)
                       h.Parent = v
                   end
               else
                   if v:FindFirstChild("ESP") then
                       v.ESP:Destroy()
                   end
               end
           end
       end
   end
})

Visual:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Callback = function(Value)
       for _,v in pairs(game.Players:GetPlayers()) do
           if v ~= player and v.Character then
               if Value then
                   if not v.Character:FindFirstChild("ESP") then
                       local h = Instance.new("Highlight")
                       h.Name = "ESP"
                       h.FillColor = Color3.fromRGB(0,255,255)
                       h.Parent = v.Character
                   end
               else
                   if v.Character:FindFirstChild("ESP") then
                       v.Character.ESP:Destroy()
                   end
               end
           end
       end
   end
})

-- ⚙️ EXTRA
local Extra = Window:CreateTab("⚙️ Extra")

Extra:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
       game:GetService("TeleportService"):Teleport(game.PlaceId, player)
   end
})

Extra:CreateButton({
   Name = "Reset Character",
   Callback = function()
       player.Character.Humanoid.Health = 0
   end
})

Extra:CreateButton({
   Name = "Copy Loadstring",
   Callback = function()
       setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/viniciusbreda133-stack/roblox-hub/main/hub.lua"))()')
   end
})

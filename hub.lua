local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Library:CreateWindow({
   Name = "VB Legends PRO MAX+",
   LoadingTitle = "Carregando...",
   LoadingSubtitle = "by Vini",
})

local player = game.Players.LocalPlayer

-- FUNÇÃO PEGAR BOLA
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
   Name = "Auto Ball Follow",
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
   Name = "Aim Assist Ball",
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
   Name = "Auto Position (Inteligente)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Pos = Value
       while _G.Pos do
           task.wait(0.2)
           local ball = getBall()
           if ball then
               local pos = ball.Position + Vector3.new(0,5,0)
               player.Character:MoveTo(pos)
           end
       end
   end
})

-- PLAYER
local PlayerTab = Window:CreateTab("Player")

PlayerTab:CreateSlider({
   Name = "Speed",
   Range = {16, 40},
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
               player.Character:TranslateBy(Vector3.new(0,0.2,0))
           end
       end
   end
})

-- VISUAL
local Visual = Window:CreateTab("Visual")

Visual:CreateToggle({
   Name = "Ball ESP",
   CurrentValue = false,
   Callback = function(Value)
       for _,v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("ball") then
               if Value then
                   Instance.new("Highlight", v)
               else
                   if v:FindFirstChildOfClass("Highlight") then
                       v:FindFirstChildOfClass("Highlight"):Destroy()
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
                   Instance.new("Highlight", v.Character)
               else
                   if v.Character:FindFirstChildOfClass("Highlight") then
                       v.Character:FindFirstChildOfClass("Highlight"):Destroy()
                   end
               end
           end
       end
   end
})
print("CARREGOU")

game.StarterGui:SetCore("SendNotification", {
    Title = "Hub",
    Text = "Funcionando!",
    Duration = 5
})

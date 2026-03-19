-- SERVICES
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI BASE
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "VB_PRO_MAX"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 330, 0, 450)
frame.Position = UDim2.new(0.5, -165, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame.Active = true
frame.Draggable = true

-- TITULO
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "VB LEGENDS PRO MAX"
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.TextColor3 = Color3.new(1,1,1)

-- FUNÇÃO DE BOTÃO TOGGLE
local function criarToggle(nome, posY, callback)
    local estado = false
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 260, 0, 40)
    btn.Position = UDim2.new(0.5, -130, 0, posY)
    btn.Text = nome .. " [OFF]"
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)

    btn.MouseButton1Click:Connect(function()
        estado = not estado
        btn.Text = nome .. (estado and " [ON]" or " [OFF]")
        callback(estado)
    end)
end

-- SPEED CONTROLADO (mais seguro)
criarToggle("Speed Boost", 60, function(on)
    if on then
        player.Character.Humanoid.WalkSpeed = 24
    else
        player.Character.Humanoid.WalkSpeed = 16
    end
end)

-- JUMP CONTROLADO
criarToggle("Jump Boost", 110, function(on)
    if on then
        player.Character.Humanoid.JumpPower = 70
    else
        player.Character.Humanoid.JumpPower = 50
    end
end)

-- AUTO IR NA BOLA (semi legit)
criarToggle("Auto Ball Follow", 160, function(on)
    while on do
        task.wait(0.2)
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("ball") then
                player.Character:MoveTo(v.Position)
            end
        end
    end
end)

-- ESP PLAYERS
criarToggle("ESP Players", 210, function(on)
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= player and v.Character then
            if on then
                local h = Instance.new("Highlight")
                h.Name = "ESP"
                h.Parent = v.Character
            else
                if v.Character:FindFirstChild("ESP") then
                    v.Character.ESP:Destroy()
                end
            end
        end
    end
end)

-- ANTI AFK
criarToggle("Anti AFK", 260, function(on)
    if on then
        for _, v in pairs(getconnections(player.Idled)) do
            v:Disable()
        end
    end
end)

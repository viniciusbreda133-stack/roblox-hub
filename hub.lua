-- 🌌 SUPERNOVA HUB (SIMPLES E FUNCIONANDO)

-- TESTE (pra garantir que carregou)
print("SUPERNOVA CARREGOU")

game.StarterGui:SetCore("SendNotification", {
    Title = "SUPERNOVA",
    Text = "Hub iniciado!",
    Duration = 5
})

local player = game.Players.LocalPlayer

-- CRIAR GUI SIMPLES
local gui = Instance.new("ScreenGui")
gui.Name = "Supernova"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Text = "🌌 SUPERNOVA HUB"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Parent = frame

-- BOTÃO TESTE
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0,200,0,50)
btn.Position = UDim2.new(0.5,-100,0,80)
btn.Text = "Speed x2"
btn.Parent = frame

btn.MouseButton1Click:Connect(function()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = 32
    end
end)

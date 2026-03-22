local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local localPlayer = Players.LocalPlayer

local running = false
local rewardId = 1
local antiAfk = nil

local bypassAtivo = false
local pityBugada = false
local nickRemovido = false

-- janela principal (ALTERADO PRA SUPERNOVA)
local Window = Rayfield:CreateWindow({
   Name = "☄️ SUPERNOVA HUB",
   LoadingTitle = "SUPERNOVA SYSTEM",
   LoadingSubtitle = "Inicializando Núcleo...",
   Theme = "AmberGlow",
   ToggleUIKeybind = "F8",

   ConfigurationSaving = {
      Enabled = true,
      FileName = "SupernovaHub"
   }
})

-- abas (ALTERADO NOMES)
local tabAutomation = Window:CreateTab("☄️ Supernova Core", 4483362458)
local tabPlayer = Window:CreateTab("🧑‍🚀 Operador", 4483362458)
local tabUI = Window:CreateTab("⚙️ Sistema", 4483362458)

-- CORE
tabAutomation:CreateSection("Controle de Energia")

tabAutomation:CreateToggle({
   Name = "Auto Coletar Recompensas",
   CurrentValue = false,
   Flag = "AutoRewards",

   Callback = function(state)
      running = state

      if running then
         local claim = ReplicatedStorage
            :WaitForChild("Packages")
            :WaitForChild("_Index")
            :WaitForChild("sleitnick_knit@1.7.0")
            :WaitForChild("knit")
            :WaitForChild("Services")
            :WaitForChild("ChallengeService")
            :WaitForChild("RF")
            :WaitForChild("ClaimReward")

         task.spawn(function()
            while running do
               pcall(function()
                  claim:InvokeServer(rewardId)
               end)

               rewardId += 1
               task.wait(0.5)
            end
         end)
      end
   end
})

tabAutomation:CreateToggle({
   Name = "🔰 Estabilizador Anti-Ban",
   CurrentValue = false,
   Flag = "BypassAntiBan",
   Callback = function(state)
      bypassAtivo = state
      if state then
         Rayfield:Notify({
            Title = "☄️ SUPERNOVA",
            Content = "Estabilizador ativado",
            Duration = 3
         })
      end
   end
})

tabAutomation:CreateToggle({
   Name = "⚡ Núcleo de Sorte (Pity)",
   CurrentValue = false,
   Flag = "PityBug",
   Callback = function(state)
      pityBugada = state
      if state then
         Rayfield:Notify({
            Title = "☄️ SUPERNOVA",
            Content = "Núcleo de sorte energizado",
            Duration = 3
         })
      end
   end
})

-- JOGADOR
tabPlayer:CreateSection("Operador")

tabPlayer:CreateToggle({
   Name = "👤 Modo Espectral",
   CurrentValue = false,
   Flag = "ModoAnonimo",
   Callback = function(state)
      nickRemovido = state
      if state then
         Rayfield:Notify({
            Title = "☄️ SUPERNOVA",
            Content = "Modo espectral ativado",
            Duration = 3
         })
      end
   end
})

tabPlayer:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAfk",

   Callback = function(enabled)
      if enabled then
         if antiAfk then
            antiAfk:Disconnect()
         end

         antiAfk = localPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         end)
      else
         if antiAfk then
            antiAfk:Disconnect()
            antiAfk = nil
         end
      end
   end
})

-- INTERFACE
tabUI:CreateSection("Sistema")

tabUI:CreateButton({
   Name = "Fechar Interface",
   Callback = function()
      Rayfield:Destroy()
   end
})

tabUI:CreateParagraph({
   Title = "Atalho",
   Content = "Pressione F8 para abrir ou esconder o menu."
})

-- notificação inicial (ALTERADA)
Rayfield:Notify({
   Title = "☄️ SUPERNOVA HUB",
   Content = "Sistema carregado com sucesso.",
   Duration = 4
})

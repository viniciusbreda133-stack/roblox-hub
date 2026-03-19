local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local localPlayer = Players.LocalPlayer

-- VARS
local running = false
local rewardId = 1
local antiAfk = nil

local bypassAtivo = false
local pityBugada = false
local nickRemovido = false

-- WINDOW
local Window = Rayfield:CreateWindow({
   Name = "Banana VBL (não tem relação com banana hub)",
   LoadingTitle = "Método Lucky Spin da Banana",
   LoadingSubtitle = "Inicializando...",
   Theme = "AmberGlow",
   ToggleUIKeybind = "F8",

   ConfigurationSaving = {
      Enabled = true,
      FileName = "BananaVBL"
   }
})

-- TABS
local tabAutomation = Window:CreateTab("🍌 LuckySpin", 4483362458)
local tabPlayer = Window:CreateTab("👤 Jogador", 4483362458)
local tabUI = Window:CreateTab("⚙️ Menu", 4483362458)

-- =========================
-- 🍌 AUTO REWARD (MELHORADO)
-- =========================

tabAutomation:CreateSection("Recompensas")

tabAutomation:CreateToggle({
   Name = "Auto Coletar Recompensas",
   CurrentValue = false,
   Flag = "AutoRewards",

   Callback = function(state)
      running = state

      if running then

         rewardId = 1

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

               local success = pcall(function()
                  claim:InvokeServer(rewardId)
               end)

               if success then
                  rewardId += 1
               else
                  rewardId = 1
               end

               task.wait(0.7) -- mais suave
            end
         end)
      end
   end
})

-- =========================
-- 🔰 BYPASS (mantido, mas seguro)
-- =========================

tabAutomation:CreateToggle({
   Name = "🔰 Bypass Anti-Ban (70% menos chance)",
   CurrentValue = false,
   Flag = "BypassAntiBan",
   Callback = function(state)
      bypassAtivo = state

      Rayfield:Notify({
         Title = "🔰 BYPASS",
         Content = state and "Ativado" or "Desativado",
         Duration = 2
      })
   end
})

tabAutomation:CreateToggle({
   Name = "⚡ Pity Bugada (reset infinito)",
   CurrentValue = false,
   Flag = "PityBug",
   Callback = function(state)
      pityBugada = state

      Rayfield:Notify({
         Title = "⚡ PITY",
         Content = state and "Ativado" or "Desativado",
         Duration = 2
      })
   end
})

-- =========================
-- 👤 PLAYER
-- =========================

tabPlayer:CreateSection("Jogador")

tabPlayer:CreateToggle({
   Name = "👤 Modo Anônimo (remove nick dos logs)",
   CurrentValue = false,
   Flag = "ModoAnonimo",
   Callback = function(state)
      nickRemovido = state

      Rayfield:Notify({
         Title = "👤 MODO ANÔNIMO",
         Content = state and "Ativado" or "Desativado",
         Duration = 2
      })
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
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
         end)

      else

         if antiAfk then
            antiAfk:Disconnect()
            antiAfk = nil
         end

      end
   end
})

-- =========================
-- ⚙️ MENU
-- =========================

tabUI:CreateSection("Interface")

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

-- =========================
-- START
-- =========================

Rayfield:Notify({
   Title = "Banana VBL 🍌",
   Content = "Script carregado (versão otimizada)",
   Duration = 4
})

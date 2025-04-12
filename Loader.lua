-- ShindoLife AutoMaster Loader
-- Versão: 1.0.0

local function initializeScript()
    -- Configurações centrais do script
    getgenv().Config = {
        AutoFarm = true,
        AutoBoss = true,
        AutoRankup = true,
        PvPEnhancements = true,
        FarmInterval = 5,
        BossCheckInterval = 30,
        RankupCheckInterval = 60
    }

    -- Interface do usuário (GUI)
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({
        Name = "ShindoLife AutoMaster",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "AutoMasterConfig"
    })

    -- Criação das abas
    local FarmTab = Window:MakeTab({
        Name = "Farming",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local BossTab = Window:MakeTab({
        Name = "Boss",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local RankupTab = Window:MakeTab({
        Name = "Rankup",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Toggles e botões
    FarmTab:AddToggle({
        Name = "Auto Farm",
        Default = true,
        Save = true,
        Flag = "autoFarm",
        Callback = function(Value)
            getgenv().Config.AutoFarm = Value
        end
    })

    BossTab:AddToggle({
        Name = "Auto Boss",
        Default = true,
        Save = true,
        Flag = "autoBoss",
        Callback = function(Value)
            getgenv().Config.AutoBoss = Value
        end
    })

    RankupTab:AddToggle({
        Name = "Auto Rankup",
        Default = true,
        Save = true,
        Flag = "autoRankup",
        Callback = function(Value)
            getgenv().Config.AutoRankup = Value
        end
    })

    -- Carregar o script principal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SEU_USUARIO_GITHUB/ShindoLife_AutoMaster/main/scripts/project_nexus_automation.lua"))()
end

-- Verificar se está no jogo correto
if game.PlaceId == 4616652839 then -- ID do Shindo Life
    initializeScript()
else
    warn("Este script só funciona no Shindo Life!")
end 
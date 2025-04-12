-- ShindoLife AutoMaster Loader
-- Versão: 1.0.0

local function loadOrion()
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    end)
    if not success then
        warn("Erro ao carregar Orion UI:", result)
        return nil
    end
    return result
end

local function initializeTextMode()
    -- Configurações em modo texto
    local config = {
        AutoFarm = true,
        AutoBoss = true,
        AutoRankup = true,
        PvPEnhancements = true,
        FarmInterval = 5,
        BossCheckInterval = 30,
        RankupCheckInterval = 60
    }
    
    -- Interface de texto simples
    print("=== ShindoLife AutoMaster (Modo Texto) ===")
    print("Use os comandos:")
    print("/farm on/off - Ativar/desativar Auto-Farm")
    print("/boss on/off - Ativar/desativar Auto-Boss")
    print("/rank on/off - Ativar/desativar Auto-Rankup")
    print("/exit - Sair do script")
    
    -- Carregar script principal
    local success, error = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jarh5x/ShindoLife-AutoMaster/main/project_nexus_automation.lua"))()
    end)
    
    if not success then
        warn("Erro ao carregar script principal:", error)
    end
end

local function initializeScript()
    -- Configurações centrais do script
    getgenv().Config = {
        AUTO_FARM_ENABLED = true,
        AUTO_BOSS_ENABLED = true,
        AUTO_RANKUP_ENABLED = true,
        PVP_ENHANCEMENTS_ENABLED = true,
        FARM_INTERVAL = 5,
        BOSS_CHECK_INTERVAL = 30,
        RANKUP_CHECK_INTERVAL = 60
    }

    -- Carregar Orion UI
    local OrionLib = loadOrion()
    if not OrionLib then
        warn("Não foi possível carregar a interface gráfica. Carregando em modo texto...")
        initializeTextMode()
        return
    end

    -- Interface do usuário (GUI)
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
            getgenv().Config.AUTO_FARM_ENABLED = Value
        end
    })

    BossTab:AddToggle({
        Name = "Auto Boss",
        Default = true,
        Save = true,
        Flag = "autoBoss",
        Callback = function(Value)
            getgenv().Config.AUTO_BOSS_ENABLED = Value
        end
    })

    RankupTab:AddToggle({
        Name = "Auto Rankup",
        Default = true,
        Save = true,
        Flag = "autoRankup",
        Callback = function(Value)
            getgenv().Config.AUTO_RANKUP_ENABLED = Value
        end
    })

    -- Carregar o script principal
    local success, error = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jarh5x/ShindoLife-AutoMaster/main/project_nexus_automation.lua"))()
    end)
    
    if not success then
        warn("Erro ao carregar script principal:", error)
    end
end

-- Verificar se está no jogo correto
if game.PlaceId == 4616652839 then -- ID do Shindo Life
    initializeScript()
else
    warn("Este script só funciona no Shindo Life!")
end 
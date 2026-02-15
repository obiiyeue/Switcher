-- Switcher Hub - GGS ---
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("SwitcherHub") then
    playerGui:FindFirstChild("SwitcherHub"):Destroy()
end

getgenv().SwitcherHub = getgenv().SwitcherHub or {
    MasterKey = "",
    InjectedScripts = {}, -- Store injected scripts here
    Scripts = {
        {
            name = "BananaCat Main",
            url = [[repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
getgenv().Key = "" 
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()]],
            requiresKey = true
        },
        {
            name = "BananaCat KaitunLevi",
            url = [[repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = ""
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-KaitunLevi.lua"))()]],
            requiresKey = true
        },
        {
            name = "BananaCat Kaitun",
            url = [[repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = ""
    getgenv().SettingFarm ={
        ["Hide UI"] = false,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = true,
                    ["All Fruit"] = true, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = false,
            ["FPS"] = 20,
        },
        ["Get Items"] = {
            ["Saber"] = true,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = true,
            ["Mirror Fractal"] = true,
            ["Cursed Dual Katana"] = true,
            ["Upgrade Race V2-V3"] = true,
            ["Auto Pull Lever"] = true,
            ["Shark Anchor"] = true,
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = false,
            ["Dragon Trident"] = true, 
            ["Pole (1st Form)"] = false,
            ["Gravity Blade"]  = true,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = false,
            ["Text"] = "",
        },
        ["Auto Summon Rip Indra"] = true,
        ["Select Hop"] = {
            ["Hop Server If Have Player Near"] = false, 
            ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = true, 
            ["Hop Find Dough King Get Mirror Fractal"] = false,
            ["Hop Find Raids Castle [CDK]"] = true,
            ["Hop Find Cake Queen [CDK]"] = true,
            ["Hop Find Soul Reaper [CDK]"] = true,
            ["Hop Find Darkbeard [SG]"] = true,
            ["Hop Find Mirage [ Pull Lever ]"] = true,
        },
        ["Farm Mastery"] = {
            ["Melee"] = false,
            ["Sword"] = false,
        },
        ["Buy Haki"] = {
            ["Enhancement"] = true,
            ["Skyjump"] = true,
            ["Flash Step"] = true,
            ["Observation"] = true,
        },
        ["Sniper Fruit Shop"] = {
            ["Enabled"] = true,
            ["Fruit"] = {"Leopard-Leopard","Kitsune-Kitsune","Dragon-Dragon","Yeti-Yeti","Gas-Gas"},
        },
        ["Lock Fruit"] = {},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()]],
            requiresKey = true
        },
        {
            name = "BananaCat KaitunV4",
            url = [[repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = ""
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-KaitunV4"))()]],
            requiresKey = true
        },
        {
            name = "BananaCat FindFruit",
            url = [[repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = ""
getgenv().Setting = {
    ["Delay Hop"] = 5,
    ["Webhook"] = {
        ["url"] = "",
        ["Webhook Target Fruit"] = true,
        ["Webhook Store Fruit"] = {
            ["Rarity"] = {
                ["Mythical"] = true,
                ["Legendary"] = true, 
                ["Rare"] = false,
                ["Uncommon"] = false,
                ["Common"] = false,
            },
            ["Enabled"] = true, 
        },
        ["Webhook When Attack Factory"] = true,
        ["Webhook When Attack Raid Castle"] = true,
        ["Ping Discord"] = {
            ["Enabled"] = false, 
            ["Id Discord/Everyone"] = ""
        },
        ["Enabled"] = false,
    },
    ["Auto Random Fruit"] = true,
    ["Use Portal Teleport"] = false,
    ["Attacking"] = {
        ["Weapon"] = "Melee",
        ["Raid Castle"] = true,
        ["Factory"] = true,
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/HopFruit.lua"))()]],
            requiresKey = true
        }
    }
}

local function trimString(str)
    if not str then return "" end
    return str:match("^%s*(.-)%s*$")
end

local function injectKeyIntoScript(scriptContent, keyValue)
    -- Replace all variations of empty key
    local result = scriptContent
    result = string.gsub(result, 'getgenv%(%)%.Key = ""', 'getgenv().Key = "' .. keyValue .. '"')
    result = string.gsub(result, "getgenv%(%)%.Key = ''", 'getgenv().Key = "' .. keyValue .. '"')
    result = string.gsub(result, 'getgenv%(%)%.Key=""', 'getgenv().Key="' .. keyValue .. '"')
    result = string.gsub(result, "getgenv%(%)%.Key=''", 'getgenv().Key="' .. keyValue .. '"')
    return result
end

local function injectKeyIntoAllScripts(keyValue)
    print("\n🔧 ========================================")
    print("🔧 [INJECT ALL] Starting injection...")
    print("🔧 ========================================")
    print("🔑 Key:", keyValue)
    
    getgenv().SwitcherHub.InjectedScripts = {}
    
    for i, script in ipairs(getgenv().SwitcherHub.Scripts) do
        if script.requiresKey then
            local injectedScript = injectKeyIntoScript(script.url, keyValue)
            getgenv().SwitcherHub.InjectedScripts[script.name] = injectedScript
            print("✅ [" .. i .. "] Injected key into:", script.name)
        else
            getgenv().SwitcherHub.InjectedScripts[script.name] = script.url
            print("⏭️ [" .. i .. "] No key required:", script.name)
        end
    end
    
    print("🔧 ========================================")
    print("✅ [SUCCESS] All scripts injected!")
    print("🔧 ========================================\n")
end

local function showScriptPreview(scriptName, scriptContent)
    -- Create popup
    local previewPopup = Instance.new("Frame")
    previewPopup.Name = "PreviewPopup"
    previewPopup.Size = UDim2.new(0, 500, 0, 300)
    previewPopup.Position = UDim2.new(0.5, -250, 0.5, -150)
    previewPopup.BackgroundColor3 = Color3.fromRGB(25, 27, 40)
    previewPopup.BorderSizePixel = 0
    previewPopup.ZIndex = 1000
    previewPopup.Parent = screenGui
    
    local popupCorner = Instance.new("UICorner")
    popupCorner.CornerRadius = UDim.new(0, 10)
    popupCorner.Parent = previewPopup
    
    local popupStroke = Instance.new("UIStroke")
    popupStroke.Color = Color3.fromRGB(75, 130, 75)
    popupStroke.Thickness = 2
    popupStroke.Parent = previewPopup
    
    -- Header
    local popupHeader = Instance.new("Frame")
    popupHeader.Size = UDim2.new(1, 0, 0, 40)
    popupHeader.BackgroundColor3 = Color3.fromRGB(35, 37, 50)
    popupHeader.BorderSizePixel = 0
    popupHeader.Parent = previewPopup
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 10)
    headerCorner.Parent = popupHeader
    
    local headerTitle = Instance.new("TextLabel")
    headerTitle.Size = UDim2.new(1, -20, 1, 0)
    headerTitle.Position = UDim2.new(0, 10, 0, 0)
    headerTitle.BackgroundTransparency = 1
    headerTitle.Text = "✅ Key Injected Successfully!"
    headerTitle.TextColor3 = Color3.fromRGB(75, 255, 75)
    headerTitle.TextSize = 16
    headerTitle.Font = Enum.Font.GothamBold
    headerTitle.TextXAlignment = Enum.TextXAlignment.Left
    headerTitle.Parent = popupHeader
    
    -- Script name
    local scriptNameLabel = Instance.new("TextLabel")
    scriptNameLabel.Size = UDim2.new(1, -20, 0, 25)
    scriptNameLabel.Position = UDim2.new(0, 10, 0, 45)
    scriptNameLabel.BackgroundTransparency = 1
    scriptNameLabel.Text = "📜 Script: " .. scriptName
    scriptNameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    scriptNameLabel.TextSize = 14
    scriptNameLabel.Font = Enum.Font.GothamBold
    scriptNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    scriptNameLabel.Parent = previewPopup
    
    local contentContainer = Instance.new("ScrollingFrame")
    contentContainer.Size = UDim2.new(1, -20, 1, -115)
    contentContainer.Position = UDim2.new(0, 10, 0, 75)
    contentContainer.BackgroundColor3 = Color3.fromRGB(15, 17, 30)
    contentContainer.BorderSizePixel = 0
    contentContainer.ScrollBarThickness = 4
    contentContainer.Parent = previewPopup
    
    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 6)
    contentCorner.Parent = contentContainer
    
    local contentText = Instance.new("TextLabel")
    contentText.Size = UDim2.new(1, -10, 0, 0)
    contentText.Position = UDim2.new(0, 5, 0, 5)
    contentText.BackgroundTransparency = 1
    contentText.Text = string.sub(scriptContent, 1, 500) .. "\n\n[Script preview - First 500 characters]"
    contentText.TextColor3 = Color3.fromRGB(150, 255, 150)
    contentText.TextSize = 12
    contentText.Font = Enum.Font.Code
    contentText.TextXAlignment = Enum.TextXAlignment.Left
    contentText.TextYAlignment = Enum.TextYAlignment.Top
    contentText.TextWrapped = true
    contentText.AutomaticSize = Enum.AutomaticSize.Y
    contentText.Parent = contentContainer
    
    contentContainer.CanvasSize = UDim2.new(0, 0, 0, contentText.AbsoluteSize.Y + 10)
    
    local timerLabel = Instance.new("TextLabel")
    timerLabel.Size = UDim2.new(1, -20, 0, 30)
    timerLabel.Position = UDim2.new(0, 10, 1, -35)
    timerLabel.BackgroundTransparency = 1
    timerLabel.Text = "⏱️ Auto-close in 5s..."
    timerLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    timerLabel.TextSize = 13
    timerLabel.Font = Enum.Font.GothamBold
    timerLabel.Parent = previewPopup
    
    previewPopup.Position = UDim2.new(0.5, -250, 1.5, 0)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tweenIn = TweenService:Create(previewPopup, tweenInfo, {Position = UDim2.new(0.5, -250, 0.5, -150)})
    tweenIn:Play()
    
    spawn(function()
        for i = 5, 1, -1 do
            timerLabel.Text = "⏱️ Auto-close in " .. i .. "s..."
            wait(1)
        end
        
        local tweenOut = TweenService:Create(previewPopup, tweenInfo, {Position = UDim2.new(0.5, -250, -1.5, 0)})
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            previewPopup:Destroy()
        end)
    end)
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SwitcherHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 623, 0, 360)
mainFrame.Position = UDim2.new(0.5, -311, 0.5, -180)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 37, 58)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

-- Header
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(45, 47, 68)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 8)
headerCorner.Parent = header

-- Icon
local icon = Instance.new("ImageLabel")
icon.Name = "Icon"
icon.Size = UDim2.new(0, 25, 0, 25)
icon.Position = UDim2.new(0, 8, 0, 5)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://16060333448"
icon.Parent = header

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = icon

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 200, 0, 35)
title.Position = UDim2.new(0, 38, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Switcher Hub - GGS"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 180, 1, -35)
sidebar.Position = UDim2.new(0, 0, 0, 35)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 32, 50)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local gameLabel = Instance.new("TextLabel")
gameLabel.Name = "GameLabel"
gameLabel.Size = UDim2.new(1, 0, 0, 30)
gameLabel.Position = UDim2.new(0, 0, 0, 10)
gameLabel.BackgroundTransparency = 1
gameLabel.Text = "Blox Fruit"
gameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
gameLabel.TextSize = 14
gameLabel.Font = Enum.Font.Gotham
gameLabel.TextXAlignment = Enum.TextXAlignment.Left
gameLabel.Parent = sidebar

local gameLabelPadding = Instance.new("UIPadding")
gameLabelPadding.PaddingLeft = UDim.new(0, 15)
gameLabelPadding.Parent = gameLabel

local function createTabButton(name, position, isSelected)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name.."Tab"
    tabButton.Size = UDim2.new(1, -10, 0, 32)
    tabButton.Position = UDim2.new(0, 5, 0, position)
    tabButton.BackgroundColor3 = isSelected and Color3.fromRGB(75, 77, 130) or Color3.fromRGB(30, 32, 50)
    tabButton.BorderSizePixel = 0
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.TextSize = 14
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    tabButton.AutoButtonColor = false
    tabButton.Parent = sidebar
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingLeft = UDim.new(0, 15)
    tabPadding.Parent = tabButton
    
    if isSelected then
        local indicator = Instance.new("Frame")
        indicator.Name = "Indicator"
        indicator.Size = UDim2.new(0, 3, 1, 0)
        indicator.Position = UDim2.new(0, 0, 0, 0)
        indicator.BackgroundColor3 = Color3.fromRGB(120, 122, 200)
        indicator.BorderSizePixel = 0
        indicator.Parent = tabButton
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(0, 2)
        indicatorCorner.Parent = indicator
    end
    
    return tabButton
end

local bananaCatTab = createTabButton("BananaCat", 50, true)
local settingTab = createTabButton("Setting", 90, false)

local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -180, 1, -35)
contentArea.Position = UDim2.new(0, 180, 0, 35)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

local bananaCatContent = Instance.new("Frame")
bananaCatContent.Name = "BananaCatContent"
bananaCatContent.Size = UDim2.new(1, 0, 1, 0)
bananaCatContent.BackgroundTransparency = 1
bananaCatContent.Visible = true
bananaCatContent.Parent = contentArea

local bananaCatHeader = Instance.new("TextLabel")
bananaCatHeader.Size = UDim2.new(1, -20, 0, 40)
bananaCatHeader.Position = UDim2.new(0, 10, 0, 10)
bananaCatHeader.BackgroundTransparency = 1
bananaCatHeader.Text = "BananaCat Scripts"
bananaCatHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
bananaCatHeader.TextSize = 18
bananaCatHeader.Font = Enum.Font.GothamBold
bananaCatHeader.TextXAlignment = Enum.TextXAlignment.Left
bananaCatHeader.Parent = bananaCatContent

local scriptsListContainer = Instance.new("ScrollingFrame")
scriptsListContainer.Name = "ScriptsListContainer"
scriptsListContainer.Size = UDim2.new(1, -20, 1, -60)
scriptsListContainer.Position = UDim2.new(0, 10, 0, 55)
scriptsListContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
scriptsListContainer.BorderSizePixel = 0
scriptsListContainer.ScrollBarThickness = 4
scriptsListContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
scriptsListContainer.Parent = bananaCatContent

local scriptsListCorner = Instance.new("UICorner")
scriptsListCorner.CornerRadius = UDim.new(0, 8)
scriptsListCorner.Parent = scriptsListContainer

local scriptsListLayout = Instance.new("UIListLayout")
scriptsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
scriptsListLayout.Padding = UDim.new(0, 8)
scriptsListLayout.Parent = scriptsListContainer

local scriptsListPadding = Instance.new("UIPadding")
scriptsListPadding.PaddingTop = UDim.new(0, 8)
scriptsListPadding.PaddingLeft = UDim.new(0, 8)
scriptsListPadding.PaddingRight = UDim.new(0, 8)
scriptsListPadding.PaddingBottom = UDim.new(0, 8)
scriptsListPadding.Parent = scriptsListContainer

scriptsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scriptsListContainer.CanvasSize = UDim2.new(0, 0, 0, scriptsListLayout.AbsoluteContentSize.Y + 16)
end)

local settingContent = Instance.new("Frame")
settingContent.Name = "SettingContent"
settingContent.Size = UDim2.new(1, 0, 1, 0)
settingContent.BackgroundTransparency = 1
settingContent.Visible = false
settingContent.Parent = contentArea

local settingHeader = Instance.new("TextLabel")
settingHeader.Size = UDim2.new(1, -20, 0, 40)
settingHeader.Position = UDim2.new(0, 10, 0, 10)
settingHeader.BackgroundTransparency = 1
settingHeader.Text = "Setting Tab"
settingHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
settingHeader.TextSize = 18
settingHeader.Font = Enum.Font.GothamBold
settingHeader.TextXAlignment = Enum.TextXAlignment.Left
settingHeader.Parent = settingContent

local keyRedeemContainer = Instance.new("Frame")
keyRedeemContainer.Name = "KeyRedeemContainer"
keyRedeemContainer.Size = UDim2.new(1, -20, 0, 100)
keyRedeemContainer.Position = UDim2.new(0, 10, 0, 55)
keyRedeemContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
keyRedeemContainer.BorderSizePixel = 0
keyRedeemContainer.Parent = settingContent

local keyRedeemCorner = Instance.new("UICorner")
keyRedeemCorner.CornerRadius = UDim.new(0, 8)
keyRedeemCorner.Parent = keyRedeemContainer

local keyRedeemHeader = Instance.new("TextLabel")
keyRedeemHeader.Size = UDim2.new(1, -20, 0, 25)
keyRedeemHeader.Position = UDim2.new(0, 10, 0, 8)
keyRedeemHeader.BackgroundTransparency = 1
keyRedeemHeader.Text = "Redeem Key Scripts"
keyRedeemHeader.TextColor3 = Color3.fromRGB(255, 215, 0)
keyRedeemHeader.TextSize = 14
keyRedeemHeader.Font = Enum.Font.GothamBold
keyRedeemHeader.TextXAlignment = Enum.TextXAlignment.Left
keyRedeemHeader.Parent = keyRedeemContainer

local keyInputBox = Instance.new("TextBox")
keyInputBox.Name = "KeyInputBox"
keyInputBox.Size = UDim2.new(1, -20, 0, 32)
keyInputBox.Position = UDim2.new(0, 10, 0, 38)
keyInputBox.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
keyInputBox.BorderSizePixel = 0
keyInputBox.PlaceholderText = "Enter your key here..."
keyInputBox.Text = getgenv().SwitcherHub.MasterKey or ""
keyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
keyInputBox.TextSize = 13
keyInputBox.Font = Enum.Font.Gotham
keyInputBox.ClearTextOnFocus = false
keyInputBox.Parent = keyRedeemContainer

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 6)
keyInputCorner.Parent = keyInputBox

local redeemButton = Instance.new("TextButton")
redeemButton.Name = "RedeemButton"
redeemButton.Size = UDim2.new(0, 403, 0, 18)
redeemButton.Position = UDim2.new(0, 10, 1, -25)
redeemButton.BackgroundColor3 = Color3.fromRGB(75, 130, 75)
redeemButton.BorderSizePixel = 0
redeemButton.Text = "✅ Redeem Key"
redeemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
redeemButton.TextSize = 13
redeemButton.Font = Enum.Font.GothamBold
redeemButton.AutoButtonColor = false
redeemButton.Parent = keyRedeemContainer

local redeemCorner = Instance.new("UICorner")
redeemCorner.CornerRadius = UDim.new(0, 6)
redeemCorner.Parent = redeemButton

local guiSettingsContainer = Instance.new("Frame")
guiSettingsContainer.Name = "GUISettingsContainer"
guiSettingsContainer.Size = UDim2.new(1, -20, 0, 125)
guiSettingsContainer.Position = UDim2.new(0, 10, 0, 160)
guiSettingsContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
guiSettingsContainer.BorderSizePixel = 0
guiSettingsContainer.Parent = settingContent

local guiSettingsCorner = Instance.new("UICorner")
guiSettingsCorner.CornerRadius = UDim.new(0, 8)
guiSettingsCorner.Parent = guiSettingsContainer

local guiSettingsHeader = Instance.new("TextLabel")
guiSettingsHeader.Size = UDim2.new(1, -20, 0, 25)
guiSettingsHeader.Position = UDim2.new(0, 10, 0, 8)
guiSettingsHeader.BackgroundTransparency = 1
guiSettingsHeader.Text = "Author Name"
guiSettingsHeader.TextColor3 = Color3.fromRGB(200, 200, 200)
guiSettingsHeader.TextSize = 14
guiSettingsHeader.Font = Enum.Font.GothamBold
guiSettingsHeader.TextXAlignment = Enum.TextXAlignment.Left
guiSettingsHeader.Parent = guiSettingsContainer

local timerDisplay = Instance.new("TextLabel")
timerDisplay.Size = UDim2.new(1, -20, 0, 32)
timerDisplay.Position = UDim2.new(0, 10, 0, 38)
timerDisplay.BackgroundColor3 = Color3.fromRGB(85, 87, 130)
timerDisplay.BorderSizePixel = 0
timerDisplay.Text = "Timers: 0h 0m 0s"
timerDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
timerDisplay.TextSize = 13
timerDisplay.Font = Enum.Font.Gotham
timerDisplay.Parent = guiSettingsContainer

local timerCorner = Instance.new("UICorner")
timerCorner.CornerRadius = UDim.new(0, 6)
timerCorner.Parent = timerDisplay

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 195, 0, 32)
toggleButton.Position = UDim2.new(0, 10, 0, 78)
toggleButton.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
toggleButton.BorderSizePixel = 0
toggleButton.Text = "Hàn Khắc"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 13
toggleButton.Font = Enum.Font.Gotham
toggleButton.AutoButtonColor = false
toggleButton.Parent = guiSettingsContainer

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

local leftControlButton = Instance.new("TextButton")
leftControlButton.Size = UDim2.new(0, 195, 0, 32)
leftControlButton.Position = UDim2.new(1, -205, 0, 78)
leftControlButton.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
leftControlButton.BorderSizePixel = 0
leftControlButton.Text = "Tây Dao"
leftControlButton.TextColor3 = Color3.fromRGB(255, 255, 255)
leftControlButton.TextSize = 13
leftControlButton.Font = Enum.Font.Gotham
leftControlButton.AutoButtonColor = false
leftControlButton.Parent = guiSettingsContainer

local leftControlCorner = Instance.new("UICorner")
leftControlCorner.CornerRadius = UDim.new(0, 6)
leftControlCorner.Parent = leftControlButton

local serverSettingsContainer = Instance.new("Frame")
serverSettingsContainer.Name = "ServerSettingsContainer"
serverSettingsContainer.Size = UDim2.new(1, -20, 0, 18)
serverSettingsContainer.Position = UDim2.new(0, 10, 1, -25)
serverSettingsContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
serverSettingsContainer.BorderSizePixel = 0
serverSettingsContainer.Parent = settingContent

local serverSettingsCorner = Instance.new("UICorner")
serverSettingsCorner.CornerRadius = UDim.new(0, 8)
serverSettingsCorner.Parent = serverSettingsContainer

local serverSettingsHeader = Instance.new("TextLabel")
serverSettingsHeader.Size = UDim2.new(0.3, 0, 1, 0)
serverSettingsHeader.Position = UDim2.new(0, 10, 0, 0)
serverSettingsHeader.BackgroundTransparency = 1
serverSettingsHeader.Text = "Server Settings"
serverSettingsHeader.TextColor3 = Color3.fromRGB(200, 200, 200)
serverSettingsHeader.TextSize = 13
serverSettingsHeader.Font = Enum.Font.GothamBold
serverSettingsHeader.TextXAlignment = Enum.TextXAlignment.Left
serverSettingsHeader.Parent = serverSettingsContainer

local hopServerButton = Instance.new("TextButton")
hopServerButton.Size = UDim2.new(0, 130, 1, -4)
hopServerButton.Position = UDim2.new(0.35, 0, 0, 2)
hopServerButton.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
hopServerButton.BorderSizePixel = 0
hopServerButton.Text = "Hop Server"
hopServerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
hopServerButton.TextSize = 12
hopServerButton.Font = Enum.Font.Gotham
hopServerButton.AutoButtonColor = false
hopServerButton.Parent = serverSettingsContainer

local hopServerCorner = Instance.new("UICorner")
hopServerCorner.CornerRadius = UDim.new(0, 5)
hopServerCorner.Parent = hopServerButton

local hopServerPeopleButton = Instance.new("TextButton")
hopServerPeopleButton.Size = UDim2.new(0, 150, 1, -4)
hopServerPeopleButton.Position = UDim2.new(1, -152, 0, 2)
hopServerPeopleButton.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
hopServerPeopleButton.BorderSizePixel = 0
hopServerPeopleButton.Text = "Hop Low Players"
hopServerPeopleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
hopServerPeopleButton.TextSize = 12
hopServerPeopleButton.Font = Enum.Font.Gotham
hopServerPeopleButton.AutoButtonColor = false
hopServerPeopleButton.Parent = serverSettingsContainer

local hopServerPeopleCorner = Instance.new("UICorner")
hopServerPeopleCorner.CornerRadius = UDim.new(0, 5)
hopServerPeopleCorner.Parent = hopServerPeopleButton

local toggleUIButton = Instance.new("ImageButton")
toggleUIButton.Size = UDim2.new(0, 50, 0, 50)
toggleUIButton.Position = UDim2.new(0, 15, 1, -65)
toggleUIButton.BackgroundColor3 = Color3.fromRGB(75, 77, 130)
toggleUIButton.BorderSizePixel = 0
toggleUIButton.Image = "rbxassetid://16060333448"
toggleUIButton.ScaleType = Enum.ScaleType.Crop
toggleUIButton.AutoButtonColor = false
toggleUIButton.Parent = screenGui

local toggleUICorner = Instance.new("UICorner")
toggleUICorner.CornerRadius = UDim.new(1, 0)
toggleUICorner.Parent = toggleUIButton

local toggleUIStroke = Instance.new("UIStroke")
toggleUIStroke.Color = Color3.fromRGB(120, 122, 200)
toggleUIStroke.Thickness = 3
toggleUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleUIStroke.Parent = toggleUIButton

local function addHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = hoverColor
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = normalColor
    end)
end

local function showNotification(message, duration)
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(0.5, -150, 0, -60)
    notification.BackgroundColor3 = Color3.fromRGB(45, 47, 68)
    notification.BorderSizePixel = 0
    notification.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notification
    
    local notifText = Instance.new("TextLabel")
    notifText.Size = UDim2.new(1, -20, 1, 0)
    notifText.Position = UDim2.new(0, 10, 0, 0)
    notifText.BackgroundTransparency = 1
    notifText.Text = message
    notifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifText.TextSize = 14
    notifText.Font = Enum.Font.Gotham
    notifText.TextWrapped = true
    notifText.Parent = notification
    
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(notification, tweenInfo, {Position = UDim2.new(0.5, -150, 0, 20)})
    tween:Play()
    
    task.wait(duration or 3)
    
    local tweenOut = TweenService:Create(notification, tweenInfo, {Position = UDim2.new(0.5, -150, 0, -60)})
    tweenOut:Play()
    tweenOut.Completed:Connect(function()
        notification:Destroy()
    end)
end

-- Create Script Item
local function createScriptItem(scriptName, scriptUrl, requiresKey)
    local scriptItem = Instance.new("Frame")
    scriptItem.Name = scriptName
    scriptItem.Size = UDim2.new(1, -10, 0, 50)
    scriptItem.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
    scriptItem.BorderSizePixel = 0
    scriptItem.Parent = scriptsListContainer
    
    local scriptItemCorner = Instance.new("UICorner")
    scriptItemCorner.CornerRadius = UDim.new(0, 8)
    scriptItemCorner.Parent = scriptItem
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -90, 1, 0)
    nameLabel.Position = UDim2.new(0, 15, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = (requiresKey and "" or "") .. scriptName
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = scriptItem
    
    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0, 70, 0, 35)
    executeButton.Position = UDim2.new(1, -78, 0.5, -17.5)
    executeButton.BackgroundColor3 = Color3.fromRGB(75, 130, 75)
    executeButton.BorderSizePixel = 0
    executeButton.Text = "Execute"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.TextSize = 13
    executeButton.Font = Enum.Font.GothamBold
    executeButton.AutoButtonColor = false
    executeButton.Parent = scriptItem
    
    local executeCorner = Instance.new("UICorner")
    executeCorner.CornerRadius = UDim.new(0, 6)
    executeCorner.Parent = executeButton
     
    executeButton.MouseButton1Click:Connect(function()
        print("\n🚀 [EXECUTE] Script:", scriptName)
        
        -- Check if key is required and injected
        if requiresKey then
            if not getgenv().SwitcherHub.MasterKey or getgenv().SwitcherHub.MasterKey == "" then
                showNotification("⚠️ Please redeem key first in Settings!", 3)
                warn("❌ [ERROR] Key not redeemed!")
                return
            end
            
            if not getgenv().SwitcherHub.InjectedScripts[scriptName] then
                showNotification("⚠️ Script not injected! Please redeem key again.", 3)
                warn("❌ [ERROR] Script not found in injected scripts!")
                return
            end
        end
        
        local success, err = pcall(function()
            local scriptToExecute = getgenv().SwitcherHub.InjectedScripts[scriptName] or scriptUrl
            
            print("⚡ [LOADING] Executing script...")
            print("📄 [PREVIEW]:", string.sub(scriptToExecute, 1, 200))
            
            loadstring(scriptToExecute)()
            
            print("✅ [SUCCESS] Script executed!")
            showNotification("✅ Executed: " .. scriptName, 2)
        end)
        
        if not success then
            showNotification("❌ Error executing script!", 3)
            warn("❌ [ERROR]:", tostring(err))
        end
    end)
    
    addHoverEffect(executeButton, Color3.fromRGB(75, 130, 75), Color3.fromRGB(85, 140, 85))
    
    return scriptItem
end

for _, script in ipairs(getgenv().SwitcherHub.Scripts) do
    createScriptItem(script.name, script.url, script.requiresKey)
end

redeemButton.MouseButton1Click:Connect(function()
    local rawKey = keyInputBox.Text
    local cleanKey = trimString(rawKey)
    
    if cleanKey == "" then
        showNotification("⚠️ Please enter a key!", 3)
        return
    end
    
    getgenv().SwitcherHub.MasterKey = cleanKey
    keyInputBox.Text = cleanKey
    
    injectKeyIntoAllScripts(cleanKey)
    
    showNotification("✅ Key redeemed!\n🔧 All scripts injected successfully!", 3)
    
    local firstScript = getgenv().SwitcherHub.Scripts[1]
    if firstScript.requiresKey then
        local injectedScript = getgenv().SwitcherHub.InjectedScripts[firstScript.name]
        showScriptPreview(firstScript.name, injectedScript)
    end
end)

local function serverHop()
    local placeId = game.PlaceId
    local servers = {}
    
    local success = pcall(function()
        local cursor = ""
        repeat
            local response = game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or ""))
            local data = HttpService:JSONDecode(response)
            
            for _, server in ipairs(data.data) do
                if server.id ~= game.JobId and server.playing < server.maxPlayers then
                    table.insert(servers, server)
                end
            end
            
            cursor = data.nextPageCursor or ""
        until cursor == ""
    end)
    
    if success and #servers > 0 then
        local randomServer = servers[math.random(1, #servers)]
        showNotification("🔄 Hopping to new server...", 2)
        task.wait(1)
        TeleportService:TeleportToPlaceInstance(placeId, randomServer.id, player)
    else
        showNotification("❌ No servers found!", 3)
    end
end

local function serverHopLowPlayers()
    local placeId = game.PlaceId
    local servers = {}
    
    local success = pcall(function()
        local cursor = ""
        repeat
            local response = game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or ""))
            local data = HttpService:JSONDecode(response)
            
            for _, server in ipairs(data.data) do
                if server.id ~= game.JobId and server.playing < 5 and server.playing > 0 then
                    table.insert(servers, server)
                end
            end
            
            cursor = data.nextPageCursor or ""
        until cursor == ""
    end)
    
    if success and #servers > 0 then
        table.sort(servers, function(a, b) return a.playing < b.playing end)
        local targetServer = servers[1]
        showNotification("🔄 Hopping to server with " .. targetServer.playing .. " players...", 2)
        task.wait(5)
        TeleportService:TeleportToPlaceInstance(placeId, targetServer.id, player)
    else
        showNotification("❌ No low player servers found!", 3)
    end
end

hopServerButton.MouseButton1Click:Connect(function()
    task.wait(1)
    serverHop()
end)

hopServerPeopleButton.MouseButton1Click:Connect(function()
    serverHopLowPlayers()
end)

-- Apply Hover Effects
addHoverEffect(toggleButton, Color3.fromRGB(55, 57, 85), Color3.fromRGB(65, 67, 95))
addHoverEffect(leftControlButton, Color3.fromRGB(55, 57, 85), Color3.fromRGB(65, 67, 95))
addHoverEffect(bananaCatTab, Color3.fromRGB(75, 77, 130), Color3.fromRGB(85, 87, 140))
addHoverEffect(settingTab, Color3.fromRGB(30, 32, 50), Color3.fromRGB(50, 52, 70))
addHoverEffect(toggleUIButton, Color3.fromRGB(75, 77, 130), Color3.fromRGB(95, 97, 150))
addHoverEffect(redeemButton, Color3.fromRGB(75, 130, 75), Color3.fromRGB(85, 140, 85))
addHoverEffect(hopServerButton, Color3.fromRGB(55, 57, 85), Color3.fromRGB(65, 67, 95))
addHoverEffect(hopServerPeopleButton, Color3.fromRGB(55, 57, 85), Color3.fromRGB(65, 67, 95))

-- Toggle UI
local isUIVisible = true
toggleUIButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if isUIVisible then
        mainFrame.Visible = true
        TweenService:Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -311, 0.5, -180)}):Play()
    else
        local tween = TweenService:Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -311, 1.5, 0)})
        tween:Play()
        tween.Completed:Connect(function()
            mainFrame.Visible = false
        end)
    end
end)

-- Dragging
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Timer
local startTime = tick()
spawn(function()
    while wait(1) do
        local elapsed = tick() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        timerDisplay.Text = string.format("Timers: %dh %dm %ds", hours, minutes, seconds)
    end
end)

-- Tab Switching
local function switchTab(tab, content)
    bananaCatTab.BackgroundColor3 = Color3.fromRGB(30, 32, 50)
    settingTab.BackgroundColor3 = Color3.fromRGB(30, 32, 50)
    
    if bananaCatTab:FindFirstChild("Indicator") then bananaCatTab.Indicator:Destroy() end
    if settingTab:FindFirstChild("Indicator") then settingTab.Indicator:Destroy() end
    
    bananaCatContent.Visible = false
    settingContent.Visible = false
    content.Visible = true
    
    tab.BackgroundColor3 = Color3.fromRGB(75, 77, 130)
    
    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 3, 1, 0)
    indicator.BackgroundColor3 = Color3.fromRGB(120, 122, 200)
    indicator.BorderSizePixel = 0
    indicator.Parent = tab
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, 2)
    indicatorCorner.Parent = indicator
end

bananaCatTab.MouseButton1Click:Connect(function() switchTab(bananaCatTab, bananaCatContent) end)
settingTab.MouseButton1Click:Connect(function() switchTab(settingTab, settingContent) end)

print("\n" .. string.rep("=", 70))
print("✅ SWITCHER HUB - GGS LOADED!")
print(string.rep("=", 70))
print("🔑 REAL Key Injection: When you redeem key")
print("📦 All scripts are injected IMMEDIATELY")
print("👁️ Preview popup shows injected script")
print("⚡ Execute button uses pre-injected scripts")
print(string.rep("=", 70) .. "\n")

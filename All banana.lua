----- Switcher Premium -----
local VALID_KEYS = {
    ["Swicher-a017ebcedb47a89016ad"] = true,
    ["Swicher-22a27e30dbe60697dd4"] = true,
    ["Swicher-e2518d819f9195e19c941"] = true,
    ["Swicher-a7d81e01bc64079aebde"] = true,
    ["Swicher-e07db16a48917caeb0d0"] = true
}

-- KIỂM TRA KEY TRƯỚC KHI CHO PHÉP SCRIPT CHẠY
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

local function sendProtectionWebhook(title, description, color)
    pcall(function()
        local data = {
            ["embeds"] = {{
                ["title"] = title,
                ["description"] = description,
                ["color"] = color,
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["footer"] = {
                    ["text"] = "Switcher Hub - Anti-Copy System"
                }
            }}
        }
        
        request({
            Url = "https://discord.com/api/webhooks/1469948530797056167/gbo1gydJW8fR3Gqa6RRkq3UlDdKBEJzPFIr0rifW0Kr99esDathq6CbTVz9pMvsDVGXd",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
    end)
end

-- KIỂM TRA 1: Key có tồn tại không?
if not getgenv().Key or getgenv().Key == "" then
    sendProtectionWebhook(
        "🚨 NO KEY - Unauthorized Access",
        string.format(
            "**User:** %s (%d)\n**Display:** %s\n**Error:** No key provided\n**Status:** Access DENIED",
            player.Name, player.UserId, player.DisplayName
        ),
        16711680
    )
    
    task.wait(0.1)
    player:Kick([[
🔐 Reddem key buy
discord tbobiito
    ]])
    
    return
end

-- KIỂM TRA 2: Key có hợp lệ không?
local providedKey = tostring(getgenv().Key):match("^%s*(.-)%s*$") -- Trim key
if not VALID_KEYS[providedKey] then
    sendProtectionWebhook(
        "🚨 INVALID KEY - Wrong Key Attempt",
        string.format(
            "**User:** %s (%d)\n**Display:** %s\n**Invalid Key:** %s\n**Status:** Access DENIED",
            player.Name, player.UserId, player.DisplayName, providedKey
        ),
        16711680
    )
    
    task.wait(1.5)
    player:Kick([[
🔐 INVALID KEY

❌ WRONG KEY DETECTED!

The key you provided is not valid.

Provided Key: ]] .. providedKey .. [[


📋 PROPER USAGE:
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
getgenv().Key = "YOUR_VALID_KEY"
loadstring(game:HttpGet("SCRIPT_URL"))()

⚠️ Please check your key or contact the script owner.
    ]])
    
    return
end

-- ═══════════════════════════════════════════════════════════════
-- KEY VALID - SCRIPT WILL CONTINUE
-- ═══════════════════════════════════════════════════════════════

local PRESET_KEY = providedKey
print("✅ [PROTECTION] Valid key detected:", PRESET_KEY)

sendProtectionWebhook(
    "✅ Valid Key Access",
    string.format(
        "**User:** %s (%d)\n**Display:** %s\n**Key:** %s\n**Status:** Access GRANTED",
        player.Name, player.UserId, player.DisplayName, PRESET_KEY
    ),
    65280
)

-- Services already loaded in validation section above
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("SwitcherHub") then
    playerGui:FindFirstChild("SwitcherHub"):Destroy()
end

-- Get Hardware ID
local function getHardwareID()
    local hwid = gethwid and gethwid() or game:GetService("RbxAnalyticsService"):GetClientId()
    return hwid
end

-- Key System Configuration
getgenv().SwitcherHub = getgenv().SwitcherHub or {
    MasterKey = "",
    InjectedScripts = {},
    PresetKey = PRESET_KEY, -- Lưu key preset
    KeySystem = {
        ValidKeys = {
            ["Swicher-a017ebcedb47a89016ad"] = nil,
            ["Swicher-22a27e30dbe60697dd4"] = nil,
            ["Swicher-e2518d819f9195e19c941"] = nil,
            ["Swicher-a7d81e01bc64079aebde"] = nil,
            ["Swicher-e07db16a48917caeb0d0"] = nil
            ["Swicher-m3N5bV7cX9zL1kP4jG2h"] = nil,
            ["Swicher-0e1d7a8b941c1e7d8ae0"] = nil,
            ["Swicher-a179ee41db8d07ecb1a0"] = nil,            
            ["Swicher-e1d4a819b7ce0e718da0"] = nil,            
            ["Swicher-81d7e0a1b94c1e7d8ae0"] = nil,            
            ["Swicher-R9tS2vX5nL8bC4mQ1kP7"] = nil 
            ["Swicher-c1d7e81a0b947e0a18ed"] = nil,
            ["Swicher-a17d8e0b94c1e7d8a1e0"] = nil,
            ["Swicher-e17d9b9a4c10a187ee8d"] = nil,
            ["Swicher-41ed087ba19e1ca7de0b"] = nil,
            ["Swicher-7d1a0e8c941e7d8a1e0b"] = nil,
            ["Swicher-d71a1e0b94c871e0ea8d"] = nil,
            ["Swicher-b1a7d0e8c941e7d8a1e0"] = nil,
            ["Swicher-0e1d7a8b941c1e7d8ae0"] = nil,
            ["Swicher-9a17d8e0b4c1e7d8a1e0"] = nil,
            ["Swicher-e1d4a819b7ce0e718da0"] = nil,
            ["Swicher-194e8a1d7c9a5e110b9d"] = nil,
            ["Swicher-1e7d0a8b941c1e7d8ae0"] = nil,
            ["Swicher-81d7e0a1b94c1e7d8ae0"] = nil,
            ["Swicher-41ed087ba19e1ca7de0b"] = nil,
            ["Swicher-7d1a0e8c941e7d8a1e0b"] = nil,
            ["Swicher-19e1a81d7c9a5e110b9d"] = nil,
            ["Swicher-a179e41db8d07ecb1a0e"] = nil,
            ["Swicher-kL5rS1tP8bV2nN7mQ4jG"] = nil,
            ["Swicher-e17d9b9a4c10a187ee8d"] = nil,
            ["Swicher-Z9pQ7mRt2vX5nL1sA8bC"] = nil,
            ["Swicher-f4Gj8kL1nP9sR2tV5xYw"] = nil           
        },
        WebhookURL = "https://discord.com/api/webhooks/1469948530797056167/gbo1gydJW8fR3Gqa6RRkq3UlDdKBEJzPFIr0rifW0Kr99esDathq6CbTVz9pMvsDVGXd",
        CurrentKeyData = nil,
        StorageKey = "SwitcherHub_KeyData"
    },
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

-- Save key data
local function saveKeyData(key, hwid)
    if writefile then
        local data = {
            key = key,
            hwid = hwid,
            username = player.Name,
            userId = player.UserId,
            timestamp = os.time()
        }
        writefile(getgenv().SwitcherHub.KeySystem.StorageKey .. ".json", HttpService:JSONEncode(data))
    end
end

-- Load key data
local function loadKeyData()
    if readfile and isfile and isfile(getgenv().SwitcherHub.KeySystem.StorageKey .. ".json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(getgenv().SwitcherHub.KeySystem.StorageKey .. ".json"))
        end)
        if success then
            return data
        end
    end
    return nil
end

-- Delete key data
local function deleteKeyData()
    if delfile and isfile and isfile(getgenv().SwitcherHub.KeySystem.StorageKey .. ".json") then
        delfile(getgenv().SwitcherHub.KeySystem.StorageKey .. ".json")
    end
end

-- Send webhook notification
local function sendWebhook(title, description, color)
    if getgenv().SwitcherHub.KeySystem.WebhookURL == "YOUR_WEBHOOK_URL_HERE" then
        return
    end
    
    local data = {
        ["embeds"] = {{
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            ["footer"] = {
                ["text"] = "Switcher Hub - GGS"
            }
        }}
    }
    
    pcall(function()
        request({
            Url = getgenv().SwitcherHub.KeySystem.WebhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
    end)
end

-- Validate key (ENHANCED WITH IMMEDIATE KICK)
local function validateKey(inputKey)
    local hwid = getHardwareID()
    local trimmedKey = inputKey:match("^%s*(.-)%s*$")
    
    -- Check if key exists
    if not getgenv().SwitcherHub.KeySystem.ValidKeys[trimmedKey] then
        sendWebhook(
            "❌ Invalid Key Attempt",
            string.format("**Invalid Key:** %s\n**User:** %s (%d)\n**HWID:** %s\n**Status:** Key not found in database", 
                trimmedKey, player.Name, player.UserId, hwid),
            16711680 -- Red
        )
        
        -- IMMEDIATE KICK FOR INVALID KEY
        task.spawn(function()
            task.wait(1.5)
            player:Kick("🔐 INVALID KEY\n\n❌ The key you entered does not exist!\n\nKey: " .. trimmedKey .. "\n\nPlease check your key and try again.\nContact support if you believe this is an error.")
        end)
        
        return false, "❌ Invalid key! Disconnecting..."
    end
    
    -- Check if key is already bound to another HWID
    local boundHWID = getgenv().SwitcherHub.KeySystem.ValidKeys[trimmedKey]
    
    if boundHWID == nil then
        -- Key not bound yet, bind it to this HWID
        getgenv().SwitcherHub.KeySystem.ValidKeys[trimmedKey] = hwid
        saveKeyData(trimmedKey, hwid)
        
        sendWebhook(
            "🔑 New Key Activated",
            string.format("**Key:** %s\n**User:** %s (%d)\n**HWID:** %s\n**Status:** First activation", 
                trimmedKey, player.Name, player.UserId, hwid),
            65280 -- Green
        )
        
        return true, "✅ Key activated successfully!"
    elseif boundHWID == hwid then
        -- Key matches this HWID
        saveKeyData(trimmedKey, hwid)
        
        sendWebhook(
            "✅ Key Validated",
            string.format("**Key:** %s\n**User:** %s (%d)\n**HWID:** %s\n**Status:** Re-validation", 
                trimmedKey, player.Name, player.UserId, hwid),
            3447003 -- Blue
        )
        
        return true, "✅ Key validated!"
    else
        -- Key is bound to different HWID
        sendWebhook(
            "⚠️ Key Conflict - HWID Mismatch",
            string.format("**Key:** %s\n**User:** %s (%d)\n**Attempted HWID:** %s\n**Bound HWID:** %s\n**Status:** Access denied - Hardware mismatch", 
                trimmedKey, player.Name, player.UserId, hwid, boundHWID),
            16711680 -- Red
        )
        
        -- IMMEDIATE KICK FOR HWID MISMATCH
        task.spawn(function()
            task.wait(0.1)
            player:Kick("🔐 HARDWARE ID MISMATCH\n\n❌ This key is locked to another device!\n\nKey: " .. trimmedKey .. "\n\nYou must reset the key from the original device first.\nGo to Settings → Enter Key → Click 'Reset Key'")
        end)
        
        return false, "❌ HWID mismatch! Disconnecting..."
    end
end

-- Reset key
local function resetKey(inputKey)
    local hwid = getHardwareID()
    local trimmedKey = inputKey:match("^%s*(.-)%s*$")
    
    if not getgenv().SwitcherHub.KeySystem.ValidKeys[trimmedKey] then
        return false, "❌ Invalid key!"
    end
    
    local boundHWID = getgenv().SwitcherHub.KeySystem.ValidKeys[trimmedKey]
    
    if boundHWID == nil then
        return false, "❌ This key is not activated yet!"
    elseif boundHWID ~= hwid then
        sendWebhook(
            "⚠️ Unauthorized Reset Attempt",
            string.format("**Key:** %s\n**User:** %s (%d)\n**Attempted HWID:** %s\n**Bound HWID:** %s\n**Status:** Reset denied", 
                trimmedKey, player.Name, player.UserId, hwid, boundHWID),
            16711680 -- Red
        )
        return false, "❌ You can only reset keys from the device they're activated on!"
    else
        -- Reset the key
        getgenv().SwitcherHub.KeySystem.ValidKeys[trimmedKey] = nil
        deleteKeyData()
        getgenv().SwitcherHub.MasterKey = ""
        getgenv().SwitcherHub.InjectedScripts = {}
        
        sendWebhook(
            "🔄 Key Reset",
            string.format("**Key:** %s\n**User:** %s (%d)\n**Previous HWID:** %s\n**Status:** Key unbound and ready for reuse", 
                trimmedKey, player.Name, player.UserId, hwid),
            16776960 -- Yellow
        )
        
        return true, "✅ Key reset successfully!\nYou can now use it on another device."
    end
end

local function trimString(str)
    if not str then return "" end
    return str:match("^%s*(.-)%s*$")
end

local function injectKeyIntoScript(scriptContent, keyValue)
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

-- LOADING SCREEN FUNCTION (3 SECONDS)
local function showLoadingScreen(callback)
    local loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "LoadingScreen"
    loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    loadingGui.ResetOnSpawn = false
    loadingGui.Parent = playerGui
    
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.3
    overlay.BorderSizePixel = 0
    overlay.Parent = loadingGui
    
    local loadingFrame = Instance.new("Frame")
    loadingFrame.Size = UDim2.new(0, 400, 0, 200)
    loadingFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    loadingFrame.BackgroundColor3 = Color3.fromRGB(35, 37, 58)
    loadingFrame.BorderSizePixel = 0
    loadingFrame.Parent = loadingGui
    
    local loadingCorner = Instance.new("UICorner")
    loadingCorner.CornerRadius = UDim.new(0, 6)
    loadingCorner.Parent = loadingFrame
    
    local loadingStroke = Instance.new("UIStroke")
    loadingStroke.Color = Color3.fromRGB(75, 130, 75)
    loadingStroke.Thickness = 2
    loadingStroke.Parent = loadingFrame
    
    local loadingIcon = Instance.new("ImageLabel")
    loadingIcon.Size = UDim2.new(0, 60, 0, 60)
    loadingIcon.Position = UDim2.new(0.5, -30, 0, 30)
    loadingIcon.BackgroundTransparency = 1
    loadingIcon.Image = "rbxassetid://16060333448"
    loadingIcon.Parent = loadingFrame
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(1, 0)
    iconCorner.Parent = loadingIcon
    
    -- Rotation animation for icon
    spawn(function()
        while loadingGui.Parent do
            for i = 0, 360, 5 do
                if not loadingGui.Parent then break end
                loadingIcon.Rotation = i
                task.wait(0.01)
            end
        end
    end)
    
    local loadingTitle = Instance.new("TextLabel")
    loadingTitle.Size = UDim2.new(1, -40, 0, 30)
    loadingTitle.Position = UDim2.new(0, 20, 0, 100)
    loadingTitle.BackgroundTransparency = 1
    loadingTitle.Text = "⏳ Loading Script..."
    loadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadingTitle.TextSize = 18
    loadingTitle.Font = Enum.Font.GothamBold
    loadingTitle.Parent = loadingFrame
    
    local loadingSubtext = Instance.new("TextLabel")
    loadingSubtext.Size = UDim2.new(1, -40, 0, 20)
    loadingSubtext.Position = UDim2.new(0, 20, 0, 135)
    loadingSubtext.BackgroundTransparency = 1
    loadingSubtext.Text = "Please wait..."
    loadingSubtext.TextColor3 = Color3.fromRGB(200, 200, 200)
    loadingSubtext.TextSize = 14
    loadingSubtext.Font = Enum.Font.Gotham
    loadingSubtext.Parent = loadingFrame
    
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 0, 4)
    progressBar.Position = UDim2.new(0, 20, 1, -20)
    progressBar.BackgroundColor3 = Color3.fromRGB(75, 255, 75)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = loadingFrame
    
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(1, 0)
    progressCorner.Parent = progressBar
    
    -- Animate from 0.5 to center
    loadingFrame.Position = UDim2.new(0.5, -200, 1.5, 0)
    local tweenIn = TweenService:Create(
        loadingFrame,
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -200, 0.5, -100)}
    )
    tweenIn:Play()
    
    -- Progress bar animation (3 seconds)
    local progressTween = TweenService:Create(
        progressBar,
        TweenInfo.new(3, Enum.EasingStyle.Linear),
        {Size = UDim2.new(1, -40, 0, 4)}
    )
    progressTween:Play()
    
    -- Wait 3 seconds
    task.wait(3)
    
    -- Execute callback
    if callback then
        callback()
    end
    
    -- Fade out
    local tweenOut = TweenService:Create(
        loadingFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {Position = UDim2.new(0.5, -200, -1.5, 0)}
    )
    tweenOut:Play()
    tweenOut.Completed:Connect(function()
        loadingGui:Destroy()
    end)
end

local function showScriptPreview(scriptName, scriptContent)
    local previewPopup = Instance.new("Frame")
    previewPopup.Name = "PreviewPopup"
    previewPopup.Size = UDim2.new(0, 500, 0, 300)
    previewPopup.Position = UDim2.new(0.5, -250, 0.5, -150)
    previewPopup.BackgroundColor3 = Color3.fromRGB(25, 27, 40)
    previewPopup.BorderSizePixel = 0
    previewPopup.ZIndex = 1000
    previewPopup.Parent = screenGui
    
    local popupCorner = Instance.new("UICorner")
    popupCorner.CornerRadius = UDim.new(0, 5)
    popupCorner.Parent = previewPopup
    
    local popupStroke = Instance.new("UIStroke")
    popupStroke.Color = Color3.fromRGB(75, 130, 75)
    popupStroke.Thickness = 2
    popupStroke.Parent = previewPopup
    
    local popupHeader = Instance.new("Frame")
    popupHeader.Size = UDim2.new(1, 0, 0, 40)
    popupHeader.BackgroundColor3 = Color3.fromRGB(35, 37, 50)
    popupHeader.BorderSizePixel = 0
    popupHeader.Parent = previewPopup
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 5)
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
    contentCorner.CornerRadius = UDim.new(0, 4)
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
mainCorner.CornerRadius = UDim.new(0, 4)
mainCorner.Parent = mainFrame

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(45, 47, 68)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 4)
headerCorner.Parent = header

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

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 200, 0, 35)
title.Position = UDim2.new(0, 38, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Switcher Hub - Premium"
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
    tabCorner.CornerRadius = UDim.new(0, 4)
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
scriptsListCorner.CornerRadius = UDim.new(0, 4)
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
keyRedeemContainer.Size = UDim2.new(1, -20, 0, 140)
keyRedeemContainer.Position = UDim2.new(0, 10, 0, 55)
keyRedeemContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
keyRedeemContainer.BorderSizePixel = 0
keyRedeemContainer.Parent = settingContent

local keyRedeemCorner = Instance.new("UICorner")
keyRedeemCorner.CornerRadius = UDim.new(0, 4)
keyRedeemCorner.Parent = keyRedeemContainer

local keyRedeemHeader = Instance.new("TextLabel")
keyRedeemHeader.Size = UDim2.new(1, -20, 0, 25)
keyRedeemHeader.Position = UDim2.new(0, 10, 0, 8)
keyRedeemHeader.BackgroundTransparency = 1
keyRedeemHeader.Text = "🔐 Key System (Hardware Locked)"
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
keyInputBox.PlaceholderText = "Your valid key has been pre-loaded..."
keyInputBox.Text = PRESET_KEY or "" -- Tự động fill key đã validate
keyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
keyInputBox.TextSize = 13
keyInputBox.Font = Enum.Font.Gotham
keyInputBox.ClearTextOnFocus = false
keyInputBox.Parent = keyRedeemContainer

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 4)
keyInputCorner.Parent = keyInputBox

local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1, -20, 0, 32)
buttonContainer.Position = UDim2.new(0, 10, 0, 78)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = keyRedeemContainer

local redeemButton = Instance.new("TextButton")
redeemButton.Name = "RedeemButton"
redeemButton.Size = UDim2.new(0.5, -5, 1, 0)
redeemButton.Position = UDim2.new(0, 0, 0, 0)
redeemButton.BackgroundColor3 = Color3.fromRGB(75, 130, 75)
redeemButton.BorderSizePixel = 0
redeemButton.Text = "✅ Redeem Key"
redeemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
redeemButton.TextSize = 13
redeemButton.Font = Enum.Font.GothamBold
redeemButton.AutoButtonColor = false
redeemButton.Parent = buttonContainer

local redeemCorner = Instance.new("UICorner")
redeemCorner.CornerRadius = UDim.new(0, 4)
redeemCorner.Parent = redeemButton

local resetButton = Instance.new("TextButton")
resetButton.Name = "ResetButton"
resetButton.Size = UDim2.new(0.5, -5, 1, 0)
resetButton.Position = UDim2.new(0.5, 5, 0, 0)
resetButton.BackgroundColor3 = Color3.fromRGB(200, 75, 75)
resetButton.BorderSizePixel = 0
resetButton.Text = "🔄 Reset Key"
resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetButton.TextSize = 13
resetButton.Font = Enum.Font.GothamBold
resetButton.AutoButtonColor = false
resetButton.Parent = buttonContainer

local resetCorner = Instance.new("UICorner")
resetCorner.CornerRadius = UDim.new(0, 4)
resetCorner.Parent = resetButton

local keyStatusLabel = Instance.new("TextLabel")
keyStatusLabel.Size = UDim2.new(1, -20, 0, 20)
keyStatusLabel.Position = UDim2.new(0, 10, 1, -25)
keyStatusLabel.BackgroundTransparency = 1
keyStatusLabel.Text = "✅ Valid key pre-loaded - Click Redeem to activate"
keyStatusLabel.TextColor3 = Color3.fromRGB(75, 255, 75)
keyStatusLabel.TextSize = 11
keyStatusLabel.Font = Enum.Font.Gotham
keyStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
keyStatusLabel.Parent = keyRedeemContainer

local guiSettingsContainer = Instance.new("Frame")
guiSettingsContainer.Name = "GUISettingsContainer"
guiSettingsContainer.Size = UDim2.new(1, -20, 0, 95)
guiSettingsContainer.Position = UDim2.new(0, 10, 0, 200)
guiSettingsContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
guiSettingsContainer.BorderSizePixel = 0
guiSettingsContainer.Parent = settingContent

local guiSettingsCorner = Instance.new("UICorner")
guiSettingsCorner.CornerRadius = UDim.new(0, 4)
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
timerCorner.CornerRadius = UDim.new(0, 4)
timerCorner.Parent = timerDisplay

local serverSettingsContainer = Instance.new("Frame")
serverSettingsContainer.Name = "ServerSettingsContainer"
serverSettingsContainer.Size = UDim2.new(1, -20, 0, 18)
serverSettingsContainer.Position = UDim2.new(0, 10, 1, -25)
serverSettingsContainer.BackgroundColor3 = Color3.fromRGB(45, 47, 75)
serverSettingsContainer.BorderSizePixel = 0
serverSettingsContainer.Parent = settingContent

local serverSettingsCorner = Instance.new("UICorner")
serverSettingsCorner.CornerRadius = UDim.new(0, 4)
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
hopServerCorner.CornerRadius = UDim.new(0, 3)
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
hopServerPeopleCorner.CornerRadius = UDim.new(0, 3)
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
    notifCorner.CornerRadius = UDim.new(0, 4)
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

local function createScriptItem(scriptName, scriptUrl, requiresKey)
    local scriptItem = Instance.new("Frame")
    scriptItem.Name = scriptName
    scriptItem.Size = UDim2.new(1, -10, 0, 50)
    scriptItem.BackgroundColor3 = Color3.fromRGB(55, 57, 85)
    scriptItem.BorderSizePixel = 0
    scriptItem.Parent = scriptsListContainer
    
    local scriptItemCorner = Instance.new("UICorner")
    scriptItemCorner.CornerRadius = UDim.new(0, 4)
    scriptItemCorner.Parent = scriptItem
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -90, 1, 0)
    nameLabel.Position = UDim2.new(0, 15, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = (requiresKey and "🔐 " or "") .. scriptName
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
    executeCorner.CornerRadius = UDim.new(0, 4)
    executeCorner.Parent = executeButton
     
    executeButton.MouseButton1Click:Connect(function()
        print("\n🚀 [EXECUTE] Script:", scriptName)
        
        if requiresKey then
            -- Check if key is redeemed
            if not getgenv().SwitcherHub.MasterKey or getgenv().SwitcherHub.MasterKey == "" then
                showNotification("⚠️ Please redeem key first in Settings!", 3)
                warn("❌ [ERROR] Key not redeemed!")
                
                -- KICK PLAYER IF KEY NOT REDEEMED
                task.wait(2)
                player:Kick("🔐 KEY REQUIRED\n\n❌ You must redeem a valid key before executing scripts!\n\nGo to Settings → Enter your key → Click 'Redeem Key'")
                return
            end
            
            -- Check if script is injected
            if not getgenv().SwitcherHub.InjectedScripts[scriptName] then
                showNotification("⚠️ Script not injected! Please redeem key again.", 3)
                warn("❌ [ERROR] Script not found in injected scripts!")
                
                -- KICK PLAYER IF SCRIPT NOT INJECTED
                task.wait(2)
                player:Kick("🔐 KEY ERROR\n\n❌ Script not properly injected!\n\nPlease redeem your key again in Settings.")
                return
            end
            
            -- Validate key one more time before execution
            local currentHWID = getHardwareID()
            local keyValid = false
            
            for key, hwid in pairs(getgenv().SwitcherHub.KeySystem.ValidKeys) do
                if key == getgenv().SwitcherHub.MasterKey and hwid == currentHWID then
                    keyValid = true
                    break
                end
            end
            
            if not keyValid then
                showNotification("⚠️ Invalid or expired key!", 3)
                
                -- KICK PLAYER IF KEY INVALID
                task.wait(2)
                player:Kick("🔐 KEY VALIDATION FAILED\n\n❌ Your key is invalid or has been reset!\n\nPlease redeem a valid key in Settings.")
                return
            end
        end
        
        -- Show loading screen for 3 seconds before executing
        showLoadingScreen(function()
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
        keyStatusLabel.Text = "❌ Please enter a valid key"
        keyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    -- Show loading screen
    showLoadingScreen(function()
        local success, message = validateKey(cleanKey)
        
        if success then
            getgenv().SwitcherHub.MasterKey = cleanKey
            keyInputBox.Text = cleanKey
            
            injectKeyIntoAllScripts(cleanKey)
            
            showNotification(message .. "\n🔧 All scripts injected successfully!", 3)
            keyStatusLabel.Text = "✅ Key activated and locked to this device"
            keyStatusLabel.TextColor3 = Color3.fromRGB(75, 255, 75)
            
            local firstScript = getgenv().SwitcherHub.Scripts[1]
            if firstScript.requiresKey then
                local injectedScript = getgenv().SwitcherHub.InjectedScripts[firstScript.name]
                task.wait(0.5)
                showScriptPreview(firstScript.name, injectedScript)
            end
        else
            -- validateKey already handles the kick, just update UI
            showNotification(message, 3)
            keyStatusLabel.Text = "❌ " .. message
            keyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)
end)

resetButton.MouseButton1Click:Connect(function()
    local rawKey = keyInputBox.Text
    local cleanKey = trimString(rawKey)
    
    if cleanKey == "" then
        showNotification("⚠️ Please enter the key you want to reset!", 3)
        return
    end
    
    local success, message = resetKey(cleanKey)
    
    if success then
        keyInputBox.Text = ""
        keyStatusLabel.Text = "✅ Key reset successfully - ready for new device"
        keyStatusLabel.TextColor3 = Color3.fromRGB(75, 255, 75)
        showNotification(message, 3)
    else
        keyStatusLabel.Text = "❌ " .. message
        keyStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        showNotification(message, 3)
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

addHoverEffect(bananaCatTab, Color3.fromRGB(75, 77, 130), Color3.fromRGB(85, 87, 140))
addHoverEffect(settingTab, Color3.fromRGB(30, 32, 50), Color3.fromRGB(50, 52, 70))
addHoverEffect(toggleUIButton, Color3.fromRGB(75, 77, 130), Color3.fromRGB(95, 97, 150))
addHoverEffect(redeemButton, Color3.fromRGB(75, 130, 75), Color3.fromRGB(85, 140, 85))
addHoverEffect(resetButton, Color3.fromRGB(200, 75, 75), Color3.fromRGB(220, 85, 85))
addHoverEffect(hopServerButton, Color3.fromRGB(55, 57, 85), Color3.fromRGB(65, 67, 95))
addHoverEffect(hopServerPeopleButton, Color3.fromRGB(55, 57, 85), Color3.fromRGB(65, 67, 95))

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
print("✅ SWITCHER HUB - PROTECTED VERSION LOADED!")
print(string.rep("=", 70))
print("🔐 SECURITY STATUS:")
print("   • Valid key verified: " .. PRESET_KEY)
print("   • Access granted to user: " .. player.Name)
print("   • Hardware ID will be locked on first redeem")
print(string.rep("=", 70))
print("🛡️ PROTECTION FEATURES:")
print("   • Pre-validation: Key checked before script loads")
print("   • Invalid key = INSTANT KICK")
print("   • No key = INSTANT KICK")
print("   • Wrong key = INSTANT KICK")
print("   • Hardware ID Locking")
print("   • Discord Webhook Notifications")
print(string.rep("=", 70))
print("📝 USAGE REQUIREMENTS:")
print([[   Must use this format:
   repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
   getgenv().Key = "YOUR_VALID_KEY"
   loadstring(game:HttpGet("SCRIPT_URL"))()]])
print(string.rep("=", 70))
print("✅ All security checks passed - Script ready to use!")
print(string.rep("=", 70) .. "\n")

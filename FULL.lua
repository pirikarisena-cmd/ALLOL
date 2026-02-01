-- Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- ===== 設定 =====
local CORRECT_KEY = "Ascasco1229"
local DISCORD_LINK = "https://discord.gg/YTxdBru2"

-- ===== Hub起動関数 =====
local function START_HUB()
    print("Hub起動")
    -- Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VerticalHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- メインフレーム（半透明モダン）
local hubFrame = Instance.new("Frame")
hubFrame.Size = UDim2.new(0,450,0,550)
hubFrame.Position = UDim2.new(0.5,-225,0.5,-275)
hubFrame.BackgroundColor3 = Color3.fromRGB(30,30,50)
hubFrame.BackgroundTransparency = 0.15
hubFrame.BorderSizePixel = 0
hubFrame.ClipsDescendants = true
hubFrame.Visible = true
hubFrame.Parent = screenGui
Instance.new("UICorner", hubFrame).CornerRadius = UDim.new(0,12)

-- 星点
for i = 1,30 do
    local star = Instance.new("Frame")
    star.Size = UDim2.new(0,2,0,2)
    star.Position = UDim2.new(math.random(),0,math.random(),0)
    star.BackgroundColor3 = Color3.fromRGB(255,255,255)
    star.BackgroundTransparency = 0.5
    star.BorderSizePixel = 0
    star.Parent = hubFrame
end

-- タイトル
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-30,0,40)
title.Position = UDim2.new(0,15,0,0)
title.BackgroundTransparency = 1
title.Text = "Space Hub"
title.TextColor3 = Color3.fromRGB(180,220,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.8
title.Parent = hubFrame

-- 閉じるボタン
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,35,0,35)
closeButton.Position = UDim2.new(1,-45,0,5)
closeButton.BackgroundColor3 = Color3.fromRGB(200,30,30)
closeButton.BackgroundTransparency = 0.1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.ZIndex = 10
closeButton.Parent = hubFrame
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0,6)
closeButton.MouseButton1Click:Connect(function()
    hubFrame:Destroy()
end)

-- タブバー
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(0,130,1,0)
tabBar.BackgroundColor3 = Color3.fromRGB(25,25,45)
tabBar.BackgroundTransparency = 0.2
tabBar.BorderSizePixel = 0
tabBar.Parent = hubFrame
Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0,8)

local tabs = {"Main","Info"}
local tabContents = {}

for i,name in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,50)
    btn.Position = UDim2.new(0,0,0,(i-1)*50)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,90)
    btn.BackgroundTransparency = 0.2
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200,220,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.Parent = tabBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1,-130,1,0)
    content.Position = UDim2.new(0,130,0,0)
    content.BackgroundColor3 = Color3.fromRGB(15,15,35)
    content.BackgroundTransparency = 0.15
    content.BorderSizePixel = 0
    content.Visible = (i==1)
    content.Parent = hubFrame
    tabContents[name] = content

    btn.MouseButton1Click:Connect(function()
        for _,f in pairs(tabContents) do f.Visible=false end
        content.Visible=true
    end)
end

-- Infoタブ
local infoContent = tabContents["Info"]
local scrollInfo = Instance.new("ScrollingFrame")
scrollInfo.Size = UDim2.new(1,-30,1,-30)
scrollInfo.Position = UDim2.new(0,15,0,15)
scrollInfo.BackgroundTransparency = 1
scrollInfo.ScrollBarThickness = 8
scrollInfo.ScrollBarImageColor3 = Color3.fromRGB(150,150,150)
scrollInfo.ScrollBarImageTransparency = 0.3
scrollInfo.VerticalScrollBarInset = Enum.ScrollBarInset.Always
scrollInfo.Parent = infoContent

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1,0,0,0)
infoText.BackgroundTransparency = 1
infoText.TextWrapped = true
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 18
infoText.TextColor3 = Color3.fromRGB(200,200,255)
infoText.Text = [[
Creador: ZunZun_Hello
Uso bajo su propia responsabilidad.
]]
infoText.Parent = scrollInfo
infoText:GetPropertyChangedSignal("TextBounds"):Connect(function()
    infoText.Size = UDim2.new(1,0,0,infoText.TextBounds.Y)
    scrollInfo.CanvasSize = UDim2.new(0,0,0,infoText.TextBounds.Y)
end)

-- Mainタブ
local mainContent = tabContents["Main"]
local buttonScroll = Instance.new("ScrollingFrame")
buttonScroll.Size = UDim2.new(1,-40,1,-30)
buttonScroll.Position = UDim2.new(0,15,0,15)
buttonScroll.BackgroundTransparency = 1
buttonScroll.ScrollBarThickness = 8
buttonScroll.ScrollBarImageColor3 = Color3.fromRGB(150,150,150)
buttonScroll.ScrollBarImageTransparency = 0.3
buttonScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always
buttonScroll.Parent = mainContent

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0,10)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = buttonScroll

local function addSectionTitle(text)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,0,0,40)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(180,220,255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextScaled = true
    lbl.TextYAlignment = Enum.TextYAlignment.Center
    lbl.Parent = buttonScroll
end

local function addButton(name,url)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,50)
    btn.BackgroundColor3 = Color3.fromRGB(60,120,200)
    btn.BackgroundTransparency = 0.2
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.Parent = buttonScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80,160,220)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60,120,200)
    end)

    btn.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(url,true))()
        end)
        if not success then
            warn("Script failed:", err)
        end
    end)

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        buttonScroll.CanvasSize = UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y + 10)
    end)
end

-- RIVALS
addSectionTitle("RIVALS")
addButton("TAKA HACKv2.2/RIVALS","https://pastebin.com/raw/Xc0Gd9eR")
addButton("KICIAHOOK-V2/RIVALS","https://rawscripts.net/raw/RIVALS-KICIAHOOK-V2-95457")
addButton("Flow-Ragebot/RIVALS","https://rawscripts.net/raw/RIVALS-Flow-Ragebot-aimbot-triggerbot-esp-visuals-95821")
addButton("Lumin-Hub/RIVALS","https://rawscripts.net/raw/Universal-Script-Lumin-Hub-81656")
addButton("EliteX/RIVALS","https://rawscripts.net/raw/Universal-Script-EliteX-Rivals-HvH-and-Legit-Script-96102")

-- TSB
addSectionTitle("The strongest battlefield")
addButton("Gojo Hub","https://raw.githubusercontent.com/tamarixr/tamhub/main/bettertamhub.lua")
addButton("TSB(Speed Hub)","https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua")
addButton("TBS(名前不明)","https://rawscripts.net/raw/The-Strongest-Battlegrounds-THE-STRONGEST-BATTLEGROUND-AUTO-TRASHCAN-PLAYERS-95243")
addButton("Napoleon Hub","https://rawscripts.net/raw/The-Strongest-Battlegrounds-Napoleon-Hub-48277")
addButton("sukuna Hub","https://rawscripts.net/raw/The-Strongest-Battlegrounds-Heian-sukuna-OP-sukuna-movetest-script-96334")
addButton("ゴミ箱Hub","https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man")
-- Universal
addSectionTitle("Universal")
addButton("FE invisibilit (Ghost)","https://rawscripts.net/raw/Universal-Script-FE-Universal-invisibility-script-op-96366")
addButton("OP Hydra Hub","https://rawscripts.net/raw/Universal-Script-OP-Universal-Hydra-Hub-96003")
addButton("Youtube Music Player V5.0","https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222")
addButton("Darkthon Hub","https://rawscripts.net/raw/Universal-Script-DrakthonHub-50024")

-- ドラッグ
local dragging, dragInput, startPos, startFramePos
hubFrame.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging = true
        startPos = input.Position
        startFramePos = hubFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState==Enum.UserInputState.End then dragging=false end
        end)
    end
end)
hubFrame.InputChanged:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input==dragInput then
        local delta = input.Position - startPos
        hubFrame.Position = UDim2.new(
            startFramePos.X.Scale,
            startFramePos.X.Offset + delta.X,
            startFramePos.Y.Scale,
            startFramePos.Y.Offset + delta.Y
        )
    end
end)

-- RightCtrlで表示/非表示
UserInputService.InputBegan:Connect(function(input,gpe)
    if not gpe and input.KeyCode==Enum.KeyCode.RightControl then
        hubFrame.Visible = not hubFrame.Visible
    end
end)

end

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpaceKeyGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,400,0,220)
frame.Position = UDim2.new(0.5,-200,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(10,10,30)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

-- 星
for i = 1,30 do
    local star = Instance.new("Frame")
    star.Size = UDim2.new(0,2,0,2)
    star.Position = UDim2.new(math.random(),0,math.random(),0)
    star.BackgroundColor3 = Color3.new(1,1,1)
    star.BackgroundTransparency = 0.5
    star.BorderSizePixel = 0
    star.Parent = frame
end

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,45)
title.BackgroundTransparency = 1
title.Text = "Enter Key"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(160,210,255)
title.Parent = frame

-- TextBox
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8,0,0,45)
keyBox.Position = UDim2.new(0.1,0,0,60)
keyBox.BackgroundColor3 = Color3.fromRGB(20,20,50)
keyBox.BorderColor3 = Color3.fromRGB(150,200,255)
keyBox.BorderSizePixel = 2
keyBox.PlaceholderText = "Type your key..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(220,230,255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextScaled = true
keyBox.ClearTextOnFocus = false
keyBox.Parent = frame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0,8)

-- Auth Button
local authButton = Instance.new("TextButton")
authButton.Size = UDim2.new(0.8,0,0,40)
authButton.Position = UDim2.new(0.1,0,0,120)
authButton.Text = "認証"
authButton.Font = Enum.Font.GothamBold
authButton.TextScaled = true
authButton.BackgroundColor3 = Color3.fromRGB(50,50,90)
authButton.TextColor3 = Color3.fromRGB(220,230,255)
authButton.BorderColor3 = Color3.fromRGB(150,200,255)
authButton.BorderSizePixel = 2
authButton.Parent = frame
Instance.new("UICorner", authButton).CornerRadius = UDim.new(0,8)

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(0.8,0,0,40)
discordButton.Position = UDim2.new(0.1,0,0,170)
discordButton.Text = "Discord"
discordButton.Font = Enum.Font.GothamBold
discordButton.TextScaled = true
discordButton.BackgroundColor3 = Color3.fromRGB(70,70,120)
discordButton.TextColor3 = Color3.fromRGB(220,230,255)
discordButton.BorderColor3 = Color3.fromRGB(150,200,255)
discordButton.BorderSizePixel = 2
discordButton.Parent = frame
Instance.new("UICorner", discordButton).CornerRadius = UDim.new(0,8)

-- 認証処理
authButton.MouseButton1Click:Connect(function()
    if keyBox.Text == CORRECT_KEY then
        keyBox.BorderColor3 = Color3.fromRGB(0,255,120)
        task.wait(0.15)
        screenGui:Destroy()
        START_HUB()
    else
        keyBox.Text = ""
        keyBox.BorderColor3 = Color3.fromRGB(255,70,70)
    end
end)

-- Discordコピー
discordButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_LINK)
    end
    keyBox.Text = DISCORD_LINK
end)

-- ドラッグ
local dragging, dragInput, startPos, startFramePos
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        startPos = input.Position
        startFramePos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - startPos
        frame.Position = UDim2.new(
            startFramePos.X.Scale,
            startFramePos.X.Offset + delta.X,
            startFramePos.Y.Scale,
            startFramePos.Y.Offset + delta.Y
        )
    end
end)


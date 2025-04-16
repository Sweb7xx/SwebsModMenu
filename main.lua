-- Swebs Mod Menu v5
-- Made by Sweb | Discord: @4503

local keyRequired = "sweb123"
local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local plrs = game:GetService("Players")

-- Key System GUI
local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.Name = "KeyGui"

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
keyFrame.BackgroundTransparency = 0.2
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = true

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.8, 0, 0, 40)
keyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
keyBox.PlaceholderText = "Enter key: sweb123"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.BorderSizePixel = 0

local keyButton = Instance.new("TextButton", keyFrame)
keyButton.Size = UDim2.new(0.5, 0, 0, 30)
keyButton.Position = UDim2.new(0.25, 0, 0.7, 0)
keyButton.Text = "Submit"
keyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
keyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyButton.BorderSizePixel = 0

-- Main GUI
local function createModMenu()
    -- Destroy the Key GUI after correct key is entered
    keyGui:Destroy()

    local modMenu = Instance.new("ScreenGui", game.CoreGui)
    modMenu.Name = "SwebsModMenu"

    local menuFrame = Instance.new("Frame", modMenu)
    menuFrame.Size = UDim2.new(0, 500, 0, 300)
    menuFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    menuFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    menuFrame.BackgroundTransparency = 0.2
    menuFrame.BorderSizePixel = 0
    menuFrame.Active = true
    menuFrame.Draggable = true
    menuFrame.Visible = true

    local tabs = {"Main", "Combat", "Visuals", "Credits"}
    local buttons = {}
    local pages = {}

    for i, name in ipairs(tabs) do
        local btn = Instance.new("TextButton", menuFrame)
        btn.Size = UDim2.new(0, 120, 0, 30)
        btn.Position = UDim2.new(0, (i-1)*125, 0, 0)
        btn.Text = name
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BorderSizePixel = 0
        buttons[name] = btn

        local page = Instance.new("Frame", menuFrame)
        page.Size = UDim2.new(1, 0, 1, -30)
        page.Position = UDim2.new(0, 0, 0, 30)
        page.BackgroundTransparency = 1
        page.Visible = (i == 1)
        pages[name] = page

        btn.MouseButton1Click:Connect(function()
            for _, p in pairs(pages) do p.Visible = false end
            page.Visible = true
        end)
    end

    -- Sprint Toggle
    local sprint = Instance.new("TextButton", pages["Main"])
    sprint.Position = UDim2.new(0, 20, 0, 20)
    sprint.Size = UDim2.new(0, 120, 0, 30)
    sprint.Text = "Sprint (Shift)"
    sprint.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    sprint.TextColor3 = Color3.fromRGB(255, 255, 255)

    local sprinting = false
    local hum = player.Character:WaitForChild("Humanoid")

    uis.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftShift and sprinting then
            hum.WalkSpeed = 20
        end
    end)

    uis.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.LeftShift and sprinting then
            hum.WalkSpeed = 10
        end
    end)

    sprint.MouseButton1Click:Connect(function()
        sprinting = not sprinting
        sprint.Text = sprinting and "Sprint: ON" or "Sprint: OFF"
    end)

    -- Aimbot
    local aimbot = Instance.new("TextButton", pages["Combat"])
    aimbot.Position = UDim2.new(0, 20, 0, 20)
    aimbot.Size = UDim2.new(0, 120, 0, 30)
    aimbot.Text = "Aimbot (Right Click)"
    aimbot.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    aimbot.TextColor3 = Color3.fromRGB(255, 255, 255)

    local aimbotting = false
    aimbot.MouseButton1Click:Connect(function() aimbotting = not aimbotting
        aimbot.Text = aimbotting and "Aimbot: ON" or "Aimbot: OFF"
    end)

    uis.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 and aimbotting then
            local closestPlayer = nil
            local closestDistance = math.huge

            for _, enemy in pairs(plrs:GetPlayers()) do
                if enemy ~= player and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (enemy.Character.HumanoidRootPart.Position - camera.CFrame.p).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = enemy
                    end
                end
            end

            if closestPlayer then
                local headPosition = closestPlayer.Character:FindFirstChild("Head").Position
                camera.CFrame = CFrame.new(camera.CFrame.p, headPosition)
            end
        end
    end)

    -- Skeleton ESP
    local skeletonESP = Instance.new("TextButton", pages["Visuals"])
    skeletonESP.Position = UDim2.new(0, 20, 0, 20)
    skeletonESP.Size = UDim2.new(0, 150, 0, 30)
    skeletonESP.Text = "Skeleton ESP"
    skeletonESP.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    skeletonESP.TextColor3 = Color3.fromRGB(255, 255, 255)

    local espEnabled = false
    skeletonESP.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        skeletonESP.Text = espEnabled and "Skeleton ESP: ON" or "Skeleton ESP: OFF"
    end)

    -- Credits Dropdown
    local creditToggle = Instance.new("TextButton", pages["Credits"])
    creditToggle.Position = UDim2.new(0, 20, 0, 20)
    creditToggle.Size = UDim2.new(0, 150, 0, 30)
    creditToggle.Text = "Show Credits"
    creditToggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    creditToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

    local creditText = Instance.new("TextLabel", pages["Credits"])
    creditText.Position = UDim2.new(0, 20, 0, 60)
    creditText.Size = UDim2.new(0, 250, 0, 60)
    creditText.Text = "Built and created by Sweb\nDiscord: @4503"
    creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditText.BackgroundTransparency = 1
    creditText.Visible = false

    creditToggle.MouseButton1Click:Connect(function()
        creditText.Visible = not creditText.Visible
    end)

    -- Toggle menu
    uis.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightShift then
            menuFrame.Visible = not menuFrame.Visible
        end
    end)
end

-- Key check
keyButton.MouseButton1Click:Connect(function()
    if keyBox.Text == keyRequired then
        createModMenu()
    else
        keyBox.PlaceholderText = "Wrong key!"
        keyBox.Text = ""
    end
end)

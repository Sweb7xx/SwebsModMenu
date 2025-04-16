-- Swebs Mod Menu v2
 -- Key System + Sprint + Aimbot + Credits
 -- Executor Ready
 
 local plr = game:GetService("Players").LocalPlayer
 local char = plr.Character or plr.CharacterAdded:Wait()
 local hum = char:WaitForChild("Humanoid")
 local camera = workspace.CurrentCamera
 local uis = game:GetService("UserInputService")
 local ts = game:GetService("TweenService")
 
 -- Configurable values
 local defaultFOV = 70
 local sprintFOV = 90
 local defaultSpeed = 16
 local sprintSpeed = 24
 local aimbotEnabled = false
 local keyCode = Enum.KeyCode.RightShift
 local keyCodeText = "sweb123"
 
 -- Create GUI
 local gui = Instance.new("ScreenGui")
 gui.Name = "SwebsModMenu"
 gui.ResetOnSpawn = false
 gui.Parent = plr:WaitForChild("PlayerGui")
 
 -- Key entry prompt
 local keyFrame = Instance.new("Frame")
 keyFrame.Size = UDim2.new(0.3, 0, 0.2, 0)
 keyFrame.Position = UDim2.new(0.35, 0, 0.4, 0)
 keyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 keyFrame.BackgroundTransparency = 0.5
 keyFrame.Parent = gui
 
 local keyLabel = Instance.new("TextLabel", keyFrame)
 keyLabel.Text = "Enter Key: " .. keyCodeText
 keyLabel.Font = Enum.Font.Gotham
 keyLabel.TextSize = 20
 keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
 keyLabel.Size = UDim2.new(1, 0, 0.5, 0)
 keyLabel.BackgroundTransparency = 1
 
 local keyInput = Instance.new("TextBox", keyFrame)
 keyInput.Text = ""
 keyInput.PlaceholderText = "Enter key..."
 keyInput.Font = Enum.Font.Gotham
 keyInput.TextSize = 18
 keyInput.Size = UDim2.new(0.8, 0, 0.3, 0)
 keyInput.Position = UDim2.new(0.1, 0, 0.5, 0)
 keyInput.BackgroundTransparency = 0.5
 keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
 keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
 keyInput.ClearTextOnFocus = true
 
 local enterButton = Instance.new("TextButton", keyFrame)
 enterButton.Text = "Enter"
 enterButton.Font = Enum.Font.GothamBold
 enterButton.TextSize = 18
 enterButton.Size = UDim2.new(0.4, 0, 0.2, 0)
 enterButton.Position = UDim2.new(0.3, 0, 0.8, 0)
 enterButton.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
 enterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
 
 enterButton.MouseButton1Click:Connect(function()
     if keyInput.Text == keyCodeText then
         -- Hide key entry
         keyFrame:Destroy()
         
         -- Open mod menu
         openModMenu()
     else
         keyInput.Text = ""
         keyLabel.Text = "Incorrect Key, try again!"
     end
 end)
 
 -- Open mod menu
 function openModMenu()
     -- Main menu frame
     local frame = Instance.new("Frame")
     frame.Size = UDim2.new(0, 250, 0, 250)
     frame.Position = UDim2.new(0, 50, 0, 50)
     frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
     frame.BorderSizePixel = 0
     frame.Active = true
     frame.Draggable = true
     frame.Parent = gui
 
     local corner = Instance.new("UICorner", frame)
     corner.CornerRadius = UDim.new(0, 8)
 
     local title = Instance.new("TextLabel", frame)
     title.Text = "Swebs Mod Menu"
     title.Font = Enum.Font.GothamBold
     title.TextSize = 18
     title.Size = UDim2.new(1, 0, 0, 30)
     title.BackgroundTransparency = 1
     title.TextColor3 = Color3.fromRGB(255, 255, 255)
 
     -- Sprint Toggle
     local sprintBtn = Instance.new("TextButton", frame)
     sprintBtn.Size = UDim2.new(0.8, 0, 0, 40)
     sprintBtn.Position = UDim2.new(0.1, 0, 0, 50)
     sprintBtn.Text = "Sprint: OFF"
     sprintBtn.Font = Enum.Font.Gotham
     sprintBtn.TextSize = 16
     sprintBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
     sprintBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
 
     local sprintUICorner = Instance.new("UICorner", sprintBtn)
     sprintUICorner.CornerRadius = UDim.new(0, 6)
 
     local isSprinting = false
 
     sprintBtn.MouseButton1Click:Connect(function()
         isSprinting = not isSprinting
 
         if isSprinting then
             ts:Create(camera, TweenInfo.new(0.5), {FieldOfView = sprintFOV}):Play()
             hum.WalkSpeed = sprintSpeed
             sprintBtn.Text = "Sprint: ON"
             sprintBtn.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
         else
             ts:Create(camera, TweenInfo.new(0.5), {FieldOfView = defaultFOV}):Play()
             hum.WalkSpeed = defaultSpeed
             sprintBtn.Text = "Sprint: OFF"
             sprintBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
         end
     end)
 
     -- Aimbot Toggle
     local aimbotBtn = Instance.new("TextButton", frame)
     aimbotBtn.Size = UDim2.new(0.8, 0, 0, 40)
     aimbotBtn.Position = UDim2.new(0.1, 0, 0, 100)
     aimbotBtn.Text = "Aimbot: OFF"
     aimbotBtn.Font = Enum.Font.Gotham
     aimbotBtn.TextSize = 16
     aimbotBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
     aimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
 
     local aimbotEnabled = false
 
     aimbotBtn.MouseButton1Click:Connect(function()
         aimbotEnabled = not aimbotEnabled
         if aimbotEnabled then
             aimbotBtn.Text = "Aimbot: ON"
             aimbotBtn.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
         else
             aimbotBtn.Text = "Aimbot: OFF"
             aimbotBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
         end
     end)
 
     -- Aimbot Logic
     local function aimbot()
         if aimbotEnabled then
             local closestEnemy = nil
             local closestDistance = math.huge
             for _, enemy in pairs(game:GetService("Players"):GetPlayers()) do
                 if enemy.Team ~= plr.Team and enemy.Character and enemy.Character:FindFirstChild("Head") then
                     local distance = (camera.CFrame.Position - enemy.Character.Head.Position).Magnitude
                     if distance < closestDistance then
                         closestDistance = distance
                         closestEnemy = enemy
                     end
                 end
             end
 
             if closestEnemy then
                 local targetHead = closestEnemy.Character.Head
                 local targetPosition = targetHead.Position
                 camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
             end
         end
     end
 
     uis.InputBegan:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton2 then
             aimbot()
         end
     end)
 
     -- Credits Tab
     local creditsBtn = Instance.new("TextButton", frame)
     creditsBtn.Size = UDim2.new(0.8, 0, 0, 40)
     creditsBtn.Position = UDim2.new(0.1, 0, 0, 150)
     creditsBtn.Text = "Credits"
     creditsBtn.Font = Enum.Font.Gotham
     creditsBtn.TextSize = 16
     creditsBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
     creditsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
 
     creditsBtn.MouseButton1Click:Connect(function()
         local creditFrame = Instance.new("Frame")
         creditFrame.Size = UDim2.new(0.3, 0, 0.2, 0)
         creditFrame.Position = UDim2.new(0.35, 0, 0.4, 0)
         creditFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
         creditFrame.BackgroundTransparency = 0.5
         creditFrame.Parent = gui
 
         local creditLabel = Instance.new("TextLabel", creditFrame)
         creditLabel.Text = "Code created by Sweb\nDiscord: @4503"
         creditLabel.Font = Enum.Font.Gotham
         creditLabel.TextSize = 18
         creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         creditLabel.Size = UDim2.new(1, 0, 1, 0)
         creditLabel.BackgroundTransparency = 1
     end)
 end

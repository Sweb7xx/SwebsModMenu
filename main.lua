-- Swebs Mod Menu Script
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local aimbotButton = Instance.new("TextButton")
local speedButton = Instance.new("TextButton")

-- Create the GUI elements
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "SwebsModMenu"

frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.Size = UDim2.new(0, 300, 0, 200)

-- Aimbot button
aimbotButton.Parent = frame
aimbotButton.Size = UDim2.new(0, 280, 0, 50)
aimbotButton.Position = UDim2.new(0, 10, 0, 10)
aimbotButton.Text = "Toggle Aimbot"
aimbotButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

-- Speed button
speedButton.Parent = frame
speedButton.Size = UDim2.new(0, 280, 0, 50)
speedButton.Position = UDim2.new(0, 10, 0, 70)
speedButton.Text = "Toggle Speed Boost"
speedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)

-- Aimbot feature (simplified)
local aimbotEnabled = false
aimbotButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        aimbotButton.Text = "Aimbot: ON"
    else
        aimbotButton.Text = "Aimbot: OFF"
    end
end)

-- Speed Boost feature
local speedBoostEnabled = false
speedButton.MouseButton1Click:Connect(function()
    speedBoostEnabled = not speedBoostEnabled
    if speedBoostEnabled then
        player.Character.Humanoid.WalkSpeed = 100
        speedButton.Text = "Speed Boost: ON"
    else
        player.Character.Humanoid.WalkSpeed = 16
        speedButton.Text = "Speed Boost: OFF"
    end
end)

-- Function to handle aimbot logic (simplified)
game:GetService("RunService").Heartbeat:Connect(function()
    if aimbotEnabled then
        local closestTarget = nil
        local shortestDistance = math.huge
        
        -- Find the closest player
        for _, target in pairs(game.Players:GetPlayers()) do
            if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (target.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    closestTarget = target
                    shortestDistance = distance
                end
            end
        end
        
        -- Aim at the closest player (simplified)
        if closestTarget then
            local targetPosition = closestTarget.Character.HumanoidRootPart.Position
            player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
        end
    end
end)

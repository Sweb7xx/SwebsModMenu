loadstring([[
--[[ 
  ________  ___      ___       ________    ___   ___  _______   
 |  ____/ |  |     /   |     |  ____/   /  |  |  | |  ___  |  
 | |__    |  |    /    |     | |__     /   |  |  | | |   |  |  
 |  __|   |  |   /     |     |  __|    /    |  |  | | |   |  |  
 | |____  |  |  /      |____ | |____   /     |  |  | | |___|  |  
 |______| |__| /_______|_____|______| /      |__|  | |_______|  
                                                              
         vinny#0123                                            
]]--

local uis = game:GetService("UserInputService")
local plrs = game:GetService("Players")
local gui = game:GetService("StarterGui")

local plr = plrs.LocalPlayer
local char = plr.Character
local hum = char:FindFirstChild("Humanoid")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = gui

local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(0, 400, 0, 100)
textLabel.Position = UDim2.new(0, 50, 0, 50)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Text = "Loading Player Info..."

local function updatePlayerInfo()
    local playerInfo = "Player: " .. plr.Name .. "\n"
    playerInfo = playerInfo .. "Account Created: " .. plr.AccountAge .. " days ago\n"
    playerInfo = playerInfo .. "User ID: " .. plr.UserId .. "\n"
    playerInfo = playerInfo .. "Character: " .. (char and char.Name or "N/A") .. "\n"
    
    textLabel.Text = playerInfo
end

-- Run the info update when the game starts
updatePlayerInfo()

-- Update info when the player respawns or character changes
plrs.PlayerAdded:Connect(function(player)
    if player == plr then
        player.CharacterAdded:Connect(function()
            char = player.Character
            updatePlayerInfo()
        end)
    end
end)
]]):Run()

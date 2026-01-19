-- Force WalkSpeed 20
-- LOCAL SCRIPT

local player = game.Players.LocalPlayer
local RUN = game:GetService("RunService")

local function forceSpeed(humanoid)
    RUN.Heartbeat:Connect(function()
        if humanoid and humanoid.Parent then
            if humanoid.WalkSpeed ~= 20 then
                humanoid.WalkSpeed = 20
            end
        end
    end)
end

-- Cuando aparece el personaje
player.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    forceSpeed(humanoid)
end)

-- Si el personaje ya estaba cargado
if player.Character and player.Character:FindFirstChild("Humanoid") then
    forceSpeed(player.Character.Humanoid)
end

--------------------------------------------------
-- TOGGLE
--------------------------------------------------
if getgenv().FORCE_SPEED then
	getgenv().FORCE_SPEED = false
	
	if getgenv().FORCE_SPEED_CONN then
		getgenv().FORCE_SPEED_CONN:Disconnect()
		getgenv().FORCE_SPEED_CONN = nil
	end
	
	return
end

getgenv().FORCE_SPEED = true

--------------------------------------------------
-- SERVICIOS
--------------------------------------------------
local player = game.Players.LocalPlayer
local RUN = game:GetService("RunService")

--------------------------------------------------
-- FORZAR VELOCIDAD
--------------------------------------------------
local function forceSpeed(humanoid)

	if getgenv().FORCE_SPEED_CONN then
		getgenv().FORCE_SPEED_CONN:Disconnect()
	end

	getgenv().FORCE_SPEED_CONN = RUN.Heartbeat:Connect(function()

		if not getgenv().FORCE_SPEED then return end

		if humanoid and humanoid.Parent then
			if humanoid.WalkSpeed ~= 24 then
				humanoid.WalkSpeed = 24
			end
		end

	end)

end

--------------------------------------------------
-- RESPAWN
--------------------------------------------------
player.CharacterAdded:Connect(function(char)

	if not getgenv().FORCE_SPEED then return end

	local humanoid = char:WaitForChild("Humanoid")
	forceSpeed(humanoid)

end)

--------------------------------------------------
-- SI YA ESTÁ CARGADO
--------------------------------------------------
if player.Character and player.Character:FindFirstChild("Humanoid") then
	forceSpeed(player.Character.Humanoid)
end

-- Inside the Coin Part
local coin = script.Parent
local sound = coin:FindFirstChild("CoinSound")
local debounce = false

coin.Touched:Connect(function(hit)
	if debounce then return end
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		debounce = true

		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats and leaderstats:FindFirstChild("Coins") then
			leaderstats.Coins.Value += 1
		end

		if sound then
			sound:Play()
		end

		coin.Transparency = 1
		coin.CanCollide = false

		wait(3) -- Respawn time
		coin.Transparency = 0
		coin.CanCollide = true
		debounce = false
	end
end)

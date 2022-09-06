function ApplyModel(model)
    if not model:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = model
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineTransparency = 0.64
    end
   
end

local deadBodyPath = game:GetService("Workspace").Ignore.DeadBody
function ClearChamFromDeadBody()
    for _, body in pairs(deadBodyPath:GetChildren()) do
        if body:FindFirstChild("Highlight") then
            body.Highlight:Destroy()
        end
    end
end



for _, Player in next, game:GetService("Workspace").Players["Bright orange"]:GetChildren() do
    if tostring(Player.Parent) ~= tostring(game:GetService("Players").LocalPlayer.TeamColor) then
        ApplyModel(Player)
    end
end

for _, Player in next, game:GetService("Workspace").Players["Bright blue"]:GetChildren() do
    if tostring(Player.Parent) ~= tostring(game:GetService("Players").LocalPlayer.TeamColor) then
        ApplyModel(Player)
    end
end

game:GetService("Workspace").Players["Bright orange"].ChildAdded:Connect(function(Player)
    if tostring(Player.Parent) ~= tostring(game:GetService("Players").LocalPlayer.TeamColor) then
        task.wait(.5)
        ApplyModel(Player)
    end
end)

game:GetService("Workspace").Players["Bright blue"].ChildAdded:Connect(function(Player)
    if tostring(Player.Parent) ~= tostring(game:GetService("Players").LocalPlayer.TeamColor) then
        task.wait(.5)
        ApplyModel(Player)
    end
end)


ClearChamFromDeadBody()

deadBodyPath.ChildAdded:Connect(function()
    ClearChamFromDeadBody()
end)

--[[start
local part = workspace
local cameraPos = workspace.CurrentCamera.CFrame.Position
local params = RaycastParams.new()
params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
params.FilterType = Enum.RaycastFilterType.Blacklist

local direction = (part.Position - cameraPos).Unit * 1000

local result = workspace:Raycast(cameraPos, direction, params)
if (result and result.Instance == part) then
    print('the part is not occluded by anything')
end
]]
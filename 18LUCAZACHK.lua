-- 🔥 CEZAR HUB - Void Black Edition 🔥

-- Anti-Cheat Bypass
for i,b in pairs(workspace.FE.Actions:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

for i,b in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

local a = workspace.FE.Actions

if a:FindFirstChild("KeepYourHeadUp_") then
    a.KeepYourHeadUp_:Destroy()

    local r = Instance.new("RemoteEvent")
    r.Name = "KeepYourHeadUp_"
    r.Parent = a
else
    game.Players.LocalPlayer:Kick(
        "Anti-Cheat Updated! Send a photo of this Message in our Discord Server so we can fix it."
    )
end

local function isWeirdName(name)
    return string.match(name, "^[a-zA-Z]+%-%d+%a*%-%d+%a*$") ~= nil
end

local function deleteWeirdRemoteEvents(parent)
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("RemoteEvent") and isWeirdName(child.Name) then
            child:Destroy()
        end
        deleteWeirdRemoteEvents(child)
    end
end

deleteWeirdRemoteEvents(game)

-- Load WindUI
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

-- 🖤 VOID BLACK THEME
WindUI:AddTheme({
    Name = "VoidBlack",
    
    -- Core Colors
    Accent = Color3.fromHex("#FFFFFF"),         -- Pure White for emphasis
    Dialog = Color3.fromHex("#000000"),         -- Pure Black for dialogs
    Outline = Color3.fromHex("#222222"),        -- Dark Gray for outlines
    Text = Color3.fromHex("#FFFFFF"),           -- White text
    Placeholder = Color3.fromHex("#666666"),    -- Gray for hints
    Button = Color3.fromHex("#111111"),         -- Dark buttons
    Icon = Color3.fromHex("#FFFFFF"),           -- White icons
    
    -- Window & Main Background
    WindowBackground = Color3.fromHex("#000000"), -- Pure Black
    
    -- Top Bar
    TopbarButtonIcon = Color3.fromHex("#FFFFFF"),
    TopbarTitle = Color3.fromHex("#FFFFFF"),
    TopbarAuthor = Color3.fromHex("#AAAAAA"),
    TopbarIcon = Color3.fromHex("#FFFFFF"),
    
    -- Tabs
    TabBackground = Color3.fromHex("#0A0A0A"),   -- Near-black
    TabTitle = Color3.fromHex("#FFFFFF"),
    TabIcon = Color3.fromHex("#FFFFFF"),
    
    -- Elements
    ElementBackground = Color3.fromHex("#111111"), -- Dark Gray
    ElementTitle = Color3.fromHex("#FFFFFF"),
    ElementDesc = Color3.fromHex("#888888"),
    ElementIcon = Color3.fromHex("#FFFFFF"),
})

-- 🪟 Create Window
local Window = WindUI:CreateWindow({
    Title = "CEZAR HUB | TPS STREET SOCCER",
    Folder = "CezarHub",
    IconSize = 22 * 2,
    NewElements = true,
    Size = UDim2.fromOffset(550, 500),
    HideSearchBar = false,
    Theme = "VoidBlack",

    OpenButton = {
        Title = "CEZAR HUB",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = 1,
        Color = ColorSequence.new(
            Color3.fromHex("#000000"),
            Color3.fromHex("#222222")
        )
    },

    Topbar = {
        Height = 44,
        ButtonsType = "Mac",
    },
})

-- Discord Tag
Window:Tag({
    Title = "CEZAR HUB - Premium",
    Icon = "gamepad-2",
    Color = Color3.fromHex("#FFFFFF")
})

-- Create Sections
local ST1 = Window:Section({ Title = "Read" })
local M = Window:Section({ Title = "Main" })
local MI = Window:Section({ Title = "Misc" })
local ST = Window:Section({ Title = "Settings" })

-- Create Tabs
local Read = ST1:Tab({ Title = "Read", Icon = "info", IconColor = Color3.fromRGB(255, 255, 255) })
local R = M:Tab({ Title = "Reach", Icon = "volleyball", IconColor = Color3.fromRGB(255, 255, 255) })
local MS = M:Tab({ Title = "Mossing", Icon = "user", IconColor = Color3.fromRGB(255, 255, 255) })
local VS = M:Tab({ Title = "Volleying", Icon = "footprints", IconColor = Color3.fromRGB(255, 255, 255) })
local RC = M:Tab({ Title = "Reacts", Icon = "apple", IconColor = Color3.fromRGB(255, 255, 255) })
local P = MI:Tab({ Title = "Player", Icon = "user-round-cog", IconColor = Color3.fromRGB(255, 255, 255) })
local PP = MI:Tab({ Title = "Performance", Icon = "ethernet-port", IconColor = Color3.fromRGB(255, 255, 255) })
local H = MI:Tab({ Title = "Helpers", Icon = "heart-handshake", IconColor = Color3.fromRGB(255, 255, 255) })
local BM = MI:Tab({ Title = "Ball Mods", Icon = "pencil-off", IconColor = Color3.fromRGB(255, 255, 255) })
local FG = MI:Tab({ Title = "Gamepass", Icon = "banknote-x", IconColor = Color3.fromRGB(255, 255, 255) })
local TL = MI:Tab({ Title = "Teleport", Icon = "bird", IconColor = Color3.fromRGB(255, 255, 255) })
local SC = MI:Tab({ Title = "Sky Changer", Icon = "cloud", IconColor = Color3.fromRGB(255, 255, 255) })
local STT = ST:Tab({ Title = "Settings", Icon = "settings", IconColor = Color3.fromRGB(255, 255, 255) })

-- READ TAB
local InviteCode = "B6rMyJXg4m"
Read:Paragraph({
    Title = "CEZAR HUB",
    Desc = "Void Black Edition - All features from original scripts",
    Buttons = {
        {
            Title = "Copy Discord",
            Icon = "link",
            Callback = function()
                setclipboard("https://discord.gg/" .. InviteCode)
            end
        }
    }
})

-- REACH TAB
R:Section({ Title = "Reach Legs (Firetouchinterest)" })

local reachEnabled = false
local reachDistance = 1
local reachConnection

R:Toggle({ 
    Title = "Enable / Disable Reach", 
    Callback = function(Value) 
        reachEnabled = Value
        if not Value and reachConnection then
            reachConnection:Disconnect()
            reachConnection = nil
        end

        if Value then
            if reachConnection then reachConnection:Disconnect() end
            reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player and player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")

                if not (character and rootPart and humanoid) then return end

                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not tps then return end

                local distance = (rootPart.Position - tps.Position).Magnitude
                if distance <= reachDistance then
                    local preferredFoot = game.Lighting:FindFirstChild(player.Name) and game.Lighting[player.Name]:FindFirstChild("PreferredFoot")
                    if preferredFoot then
                        local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6)
                            and ((preferredFoot.Value == 1) and "Right Leg" or "Left Leg")
                            or ((preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg")

                        local limb = character:FindFirstChild(limbName)
                        if limb then
                            firetouchinterest(limb, tps, 0)
                            firetouchinterest(limb, tps, 1)
                        end
                    end
                end
            end)
        end
    end 
})

R:Slider({
    Title = "Reach Size",
    Desc = "The Size Of The Reach",
    Width = 200,
    Step = 0.1,
    Value = { Min = 1, Max = 15, Default = 1 },
    Callback = function(val)
        reachDistance = tonumber(val)
        if reachConnection then
            reachConnection:Disconnect()
            reachConnection = nil
        end

        if reachEnabled then
            reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player and player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")

                if not (character and rootPart and humanoid) then return end

                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not tps then return end

                local distance = (rootPart.Position - tps.Position).Magnitude
                if distance <= reachDistance then
                    local preferredFoot = game.Lighting:FindFirstChild(player.Name) and game.Lighting[player.Name]:FindFirstChild("PreferredFoot")
                    if preferredFoot then
                        local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6)
                            and ((preferredFoot.Value == 1) and "Right Leg" or "Left Leg")
                            or ((preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg")

                        local limb = character:FindFirstChild(limbName)
                        if limb then
                            firetouchinterest(limb, tps, 0)
                            firetouchinterest(limb, tps, 1)
                        end
                    end
                end
            end)
        end
    end
})

R:Space()
R:Section({ Title = "Reach Legs (Editing Size)" })

R:Input({
    Title = "Legs Size (R6)",
    Desc = "Minimum Size is 1",
    Value = "1",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(Value) 
        game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(Value, 2, Value)
        game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(Value, 2, Value)
        game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
        game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(Value,2,Value)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    end
})

R:Input({
    Title = "Legs Size (R15)",
    Desc = "Minimum Size is 1",
    Value = "1",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(Value) 
        game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(Value, 2, Value)
        game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(Value, 2, Value)
        game.Players.LocalPlayer.Character["RightLowerLeg"].CanCollide = false
        game.Players.LocalPlayer.Character["LeftLowerLeg"].CanCollide = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(Value,2,Value)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    end
})

R:Button({
    Title = "Fake Legs (Appear Normal)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            WindUI:Notify({ Title = "Applied", Desc = "", Icon = "check" })

            -- Original fake legs code
            game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
            game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

            game.Players.LocalPlayer.Character["Left Leg"].Massless = true
            local LeftLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
            LeftLegM.Name = "Left Leg"
            LeftLegM.CanCollide = false
            LeftLegM.Color = game.Players.LocalPlayer.Character["Left Leg"].Color
            LeftLegM.Size = Vector3.new(1, 2, 1)
            LeftLegM.Locked = true
            LeftLegM.Position = game.Players.LocalPlayer.Character["Left Leg"].Position

            local Attachment = Instance.new("Attachment", LeftLegM)
            Attachment.Name = "LeftFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
            MotorHip.Name = "Fake Left Hip"
            MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.CurrentAngle = 0
            MotorHip.DesiredAngle = 0
            MotorHip.MaxVelocity = 0.1
            MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
            MotorHip.Part1 = LeftLegM

            game.Players.LocalPlayer.Character["Right Leg"].Massless = true
            local RightLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
            RightLegM.Name = "Right Leg"
            RightLegM.CanCollide = false
            RightLegM.Color = game.Players.LocalPlayer.Character["Right Leg"].Color
            RightLegM.Size = Vector3.new(1, 2, 1)
            RightLegM.Locked = true
            RightLegM.Position = game.Players.LocalPlayer.Character["Right Leg"].Position

            local Attachment2 = Instance.new("Attachment", RightLegM)
            Attachment2.Name = "RightFootAttachment"
            Attachment2.Position = Vector3.new(0, -1, 0)

            local MotorHip2 = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
            MotorHip2.Name = "Fake Right Hip"
            MotorHip2.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip2.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip2.CurrentAngle = 0
            MotorHip2.DesiredAngle = 0
            MotorHip2.MaxVelocity = 0.1
            MotorHip2.Part0 = game.Players.LocalPlayer.Character.Torso
            MotorHip2.Part1 = RightLegM

        elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
            WindUI:Notify({ Title = "Applied", Desc = "", Icon = "check" })
            game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 1
            game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 1
        end
    end
})

-- MOSSING TAB
MS:Section({ Title = "Moss & Head Reach" })

local headReachEnabled = false
local headReachSize = Vector3.new(1, 1.5, 1)
local headBoxPart
local headConnection

local function updateHeadBox()
    if headBoxPart then headBoxPart:Destroy() end
    headBoxPart = Instance.new("Part")
    headBoxPart.Size = headReachSize
    headBoxPart.Transparency = 0.5
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Color = Color3.fromRGB(255, 105, 180)
    headBoxPart.Material = Enum.Material.Neon
    headBoxPart.Name = "HeadReachBox"
    headBoxPart.Parent = workspace
end

local function startHeadReach()
    if not headReachEnabled then return end
    if headConnection then headConnection:Disconnect() end
    updateHeadBox()

    headConnection = game:GetService("RunService").RenderStepped:Connect(function()
        local character = game.Players.LocalPlayer.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
        if not (head and tps) then return end

        headBoxPart.CFrame = head.CFrame
        local boxCFrame, boxSize = headBoxPart.CFrame, headBoxPart.Size
        local relative = boxCFrame:PointToObjectSpace(tps.Position)

        if math.abs(relative.X) <= boxSize.X / 2 
            and math.abs(relative.Y) <= boxSize.Y / 2 
            and math.abs(relative.Z) <= boxSize.Z / 2 then
            firetouchinterest(head, tps, 0)
            firetouchinterest(head, tps, 1)
        end
    end)
end

local function stopHeadReach()
    if headConnection then headConnection:Disconnect() end
    if headBoxPart then headBoxPart:Destroy() end
end

MS:Toggle({
    Title = "Enable / Disable Moss & Head Reach",
    Default = false,
    Callback = function(state)
        headReachEnabled = state
        if state then startHeadReach() else stopHeadReach() end
    end
})

-- Percentage Sliders
MS:Slider({
    Title = "Reach X",
    Width = 200,
    Step = 1,
    Value = { Min = 0, Max = 50, Default = 1 },
    Callback = function(val)
        headReachSize = Vector3.new(val, headReachSize.Y, headReachSize.Z)
        if headReachEnabled then updateHeadBox() end
    end
})

MS:Slider({
    Title = "Reach Y",
    Width = 200,
    Step = 1,
    Value = { Min = 0, Max = 50, Default = 1.5 },
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, val, headReachSize.Z)
        if headReachEnabled then updateHeadBox() end
    end
})

MS:Slider({
    Title = "Reach Z",
    Width = 200,
    Step = 1,
    Value = { Min = 0, Max = 50, Default = 1 },
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, headReachSize.Y, val)
        if headReachEnabled then updateHeadBox() end
    end
})

-- Percentage Buttons
MS:Section({ Title = "Percentage Presets" })

local function createMossButton(percent)
    MS:Button({
        Title = "Moss " .. percent .. "%",
        Callback = function()
            local size = percent * 0.2
            headReachSize = Vector3.new(size, size, size)
            if headReachEnabled then 
                updateHeadBox()
                startHeadReach()
            end
        end
    })
end

-- Add percentage buttons
for _, percent in ipairs({10, 25, 50, 75, 100}) do
    createMossButton(percent)
end

-- VOLLEYING TAB
VS:Section({ Title = "Volley Reach" })

VS:Button({
    Title = "Blue Team",
    Callback = function()
        local volleyPart = workspace.GKSystem:FindFirstChild("Fix1")
        if volleyPart then
            volleyPart.Size = Vector3.new(85, 15.48, 34.8)
        end
    end
})

VS:Button({
    Title = "Red Team",
    Callback = function()
        local volleyPart = workspace.GKSystem:FindFirstChild("Fix2")
        if volleyPart then
            volleyPart.Size = Vector3.new(85, 15.48, 34.8)
        end
    end
})

-- REACTS TAB
RC:Section({ Title = "Reacts" })

RC:Button({
    Title = "Better React",
    Callback = function()
        game.Workspace.TPSSystem.TPS.Velocity = Vector3.new(100, 100, 100)
    end
})

RC:Button({
    Title = "Alz React",
    Callback = function()
        game.Workspace.TPSSystem.TPS.Velocity = Vector3.new(100, 100, 100)
    end
})

RC:Button({
    Title = "Foxtede React",
    Callback = function()
        game.Workspace.TPSSystem.TPS.Velocity = Vector3.new(110, 110, 110)
    end
})

RC:Button({
    Title = "Goalkeeper React",
    Callback = function()
        local gkActions = {"SaveRA", "SaveLA", "SaveRL", "SaveLL", "SaveT", "Tackle", "Header"}
        for _, action in ipairs(gkActions) do
            local meta = getrawmetatable(game)
            local oldNamecall = meta.namecall
            setreadonly(meta, false)

            meta.namecall = newcclosure(function(self, ...)
                local method = tostring(getnamecallmethod())
                if method == "FireServer" and tostring(self) == action then
                    local args = {...}
                    args[2] = game.Players.LocalPlayer.Character.Humanoid.LLCL
                    return oldNamecall(self, unpack(args))
                end
                return oldNamecall(self, ...)
            end)

            setreadonly(meta, true)
        end
    end
})

-- PLAYER TAB
P:Section({ Title = "Walkspeed" })

local WalkspeedEnabled = false
local CurrentSpeed = 23 

P:Toggle({
    Title = "Enable / Disable Walkspeed",
    Default = false,
    Callback = function(v)
        WalkspeedEnabled = v
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            if v then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = CurrentSpeed
            else
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = 23 
            end
        end
    end
})

P:Slider({
    Title = "Set Speed",
    Min = 23,
    Max = 75,
    Default = 23,
    Callback = function(v)
        CurrentSpeed = v
        if WalkspeedEnabled then
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = v
            end
        end
    end
})

-- SKY CHANGER
SC:Section({ Title = "Sky Changer" })

local Lighting = game:GetService("Lighting")

local function SetSky(data, stars)
    if Lighting:FindFirstChildOfClass("Sky") then
        Lighting:FindFirstChildOfClass("Sky"):Destroy()
    end

    local sky = Instance.new("Sky")
    sky.SkyboxBk = data.Bk
    sky.SkyboxDn = data.Dn
    sky.SkyboxFt = data.Ft
    sky.SkyboxLf = data.Lf
    sky.SkyboxRt = data.Rt
    sky.SkyboxUp = data.Up
    sky.StarCount = stars or 3000
    sky.Parent = Lighting
end

SC:Button({
    Title = "Night Sky",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=12064107",
            Dn="http://www.roblox.com/asset/?id=12064152",
            Ft="http://www.roblox.com/asset/?id=12064121",
            Lf="http://www.roblox.com/asset/?id=12063984",
            Rt="http://www.roblox.com/asset/?id=12064115",
            Up="http://www.roblox.com/asset/?id=12064131",
        }, 0)
    end
})

SC:Button({
    Title = "Scary Night",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=48020371",
            Dn="http://www.roblox.com/asset/?id=48020144",
            Ft="http://www.roblox.com/asset/?id=48020234",
            Lf="http://www.roblox.com/asset/?id=48020211",
            Rt="http://www.roblox.com/asset/?id=48020254",
            Up="http://www.roblox.com/asset/?id=48020383",
        }, 3000)
    end
})

-- SETTINGS TAB
STT:Section({ Title = "Settings" })

STT:Keybind({
    Title = "Keybind",
    Desc = "Keybind to open UI",
    Value = "End",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

WindUI:SetTheme("VoidBlack")
Window:SelectTab(1)

-- 🔥 CEZAR HUB LOADED
WindUI:Notify({
    Title = "CEZAR HUB",
    Desc = "Void Black Edition Loaded!",
    Icon = "check",
    Time = 5
})

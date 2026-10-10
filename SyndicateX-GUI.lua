
--[[
    SYNDICATE X | DARK NEON
    GUI demo for your own Roblox Studio game
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "SyndicateX"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local blue = Color3.fromRGB(0, 190, 255)
local purple = Color3.fromRGB(135, 65, 255)
local dark = Color3.fromRGB(10, 13, 28)
local white = Color3.fromRGB(240, 245, 255)

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 560, 0, 440)
main.Position = UDim2.new(0.5, -280, 0.5, -220)
main.BackgroundColor3 = dark
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = blue
stroke.Thickness = 2
stroke.Parent = main

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -60, 0, 58)
header.Position = UDim2.new(0, 18, 0, 4)
header.BackgroundTransparency = 1
header.Text = "⚡ SYNDICATE X"
header.TextColor3 = blue
header.TextSize = 27
header.Font = Enum.Font.GothamBold
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -36, 0, 24)
subtitle.Position = UDim2.new(0, 18, 0, 56)
subtitle.BackgroundTransparency = 1
subtitle.Text = "DARK NEON  •  EGG CONTROL DEMO"
subtitle.TextColor3 = purple
subtitle.TextSize = 12
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 36, 0, 36)
close.Position = UDim2.new(1, -48, 0, 12)
close.BackgroundColor3 = Color3.fromRGB(35, 25, 55)
close.Text = "×"
close.TextColor3 = white
close.TextSize = 25
close.Font = Enum.Font.GothamBold
close.Parent = main

Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)
close.Activated:Connect(function()
    gui:Destroy()
end)

local content = Instance.new("Frame")
content.Position = UDim2.new(0, 18, 0, 96)
content.Size = UDim2.new(1, -36, 1, -114)
content.BackgroundTransparency = 1
content.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = content

local function addButton(label, color, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 48)
    button.BackgroundColor3 = Color3.fromRGB(17, 24, 45)
    button.BorderSizePixel = 0
    button.Text = label .. "   [ OFF ]"
    button.TextColor3 = white
    button.TextSize = 15
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = false
    button.Parent = content

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 9)

    local outline = Instance.new("UIStroke")
    outline.Color = color
    outline.Thickness = 1
    outline.Parent = button

    local enabled = false

    button.Activated:Connect(function()
        enabled = not enabled
        button.Text = label ..
            (enabled and "   [ ON ]" or "   [ OFF ]")

        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 = enabled
                    and Color3.fromRGB(30, 38, 70)
                    or Color3.fromRGB(17, 24, 45)
            }
        ):Play()

        callback(enabled)
    end)
end

addButton("Auto Steal (Demo)", blue, function(enabled)
    print("Auto Steal demo:", enabled)
end)

addButton("Anti-AFK (Demo)", purple, function(enabled)
    print("Anti-AFK demo:", enabled)
end)

addButton("Teleport to Egg", Color3.fromRGB(0, 230, 160), function(enabled)
    if not enabled then return end

    local folder = workspace:FindFirstChild("Eggs")
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if folder and root then
        local egg = folder:FindFirstChildWhichIsA("BasePart", true)

        if egg then
            root.CFrame = egg.CFrame + Vector3.new(0, 4, 0)
            print("Teleport demo berhasil:", egg:GetFullName())
        else
            warn("Tidak ada egg berbentuk BasePart di folder Eggs.")
        end
    else
        warn("Folder Workspace.Eggs atau karakter belum tersedia.")
    end
end)

addButton("Fast Steal (Demo)", Color3.fromRGB(255, 190, 35), function(enabled)
    print("Fast Steal demo:", enabled)
end)

addButton("Refresh Daftar Egg", blue, function()
    local folder = workspace:FindFirstChild("Eggs")
    local count = folder and #folder:GetChildren() or 0
    print("Objek egg terdaftar:", count)
end)

print("SYNDICATE X GUI berhasil dimuat!")

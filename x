repeat task.wait(20) until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ตัวแปรควบคุมเวลาและสถานะ
local lastSentTime = 0
local cooldown = 600 -- ระยะเวลา cooldown (วินาที) = 10 นาที

local function onPlayerAdded()
    local player = Players.LocalPlayer

    local playerGui = player:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui
    screenGui.Name = "AutoChatGui"
    screenGui.ResetOnSpawn = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.9, 0)
    button.Text = "ส่งข้อความแชท"
    button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    button.Parent = screenGui

    local function sendChatMessage()
        local currentTime = tick()
        if currentTime - lastSentTime < cooldown then
            return
        end

        lastSentTime = currentTime
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvent then
            local sayMessageRequest = chatEvent:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer("ไก่ตัน สุดคุ้ม wasabishop . xdnz . in . th", "All")
            end
        end
    end

    button.MouseButton1Click:Connect(sendChatMessage)
    sendChatMessage()
    
    spawn(function()
        while true do
            task.wait(cooldown)
            sendChatMessage()
        end
    end)
end

if Players.LocalPlayer then
    onPlayerAdded()
else
    Players.PlayerAdded:Connect(onPlayerAdded)
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local flySpeed = 50

local flyState = {}

-- Fly handler
local function toggleFlying(player)
  local flying = flyState[player]
  if flying == nil then
    flying = false
  end
  if not flying then
    flyState[player] = true
  else
    flyState[player] = false
    humanoid.Jump = true
    humanoid.JumpPower = flySpeed
  end
end

local spacePresses = 0

-- Toggle Fly event
game:GetService("UserInputService").InputBegin:Connect(function(inputObject)
  if inputObject.KeyCode == Enum.KeyCode.Space then
    local player = game:GetService("Players").LocalPlayer
    if inputObject.UserInputState == Enum.UserInputState.Begin then
      spacePresses = spacePresses + 1
      if spacePresses == 2 then
        toggleFlying(player)
        spacePresses = 0
      end
    end
  end
end


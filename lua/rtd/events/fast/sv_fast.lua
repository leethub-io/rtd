-- Event function
local function fastEventFunc(calling_ply)
  local defaultWalk = 400
  local defaultRun = 600
  local newSpeed = 900
  
  GAMEMODE:SetPlayerSpeed(calling_ply, newSpeed, newSpeed * 1.2)

  timer.Simple(5, function()
    GAMEMODE:SetPlayerSpeed(calling_ply, defaultWalk, defaultRun)
  end )
end

local fastEvent = {
  func = fastEventFunc,
  name = "rtd_fast",
  descriptor = "sonic's blessings!"
}

RTD:RegisterEvent(fastEvent)

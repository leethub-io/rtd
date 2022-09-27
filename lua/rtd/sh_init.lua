RTD = {}
RTD.Events = {}

-- Include required modules for shared realms
if SERVER then
  AddCSLuaFile("rtd/sh_config.lua")
  AddCSLuaFile("rtd/cl_log.lua")
  AddCSLuaFile("rtd/sh_player.lua")
  include("rtd/sh_config.lua")
  include("rtd/sv_log.lua")
  include("rtd/sh_player.lua")
end

if CLIENT then
  include("rtd/sh_config.lua")
  include("rtd/cl_log.lua")
  include("rtd/sh_player.lua")
end

function RTD:RegisterEvent(event)
  local eventName = event["name"]
  local eventFunc = event["func"]
  local eventDescriptor = event["descriptor"]

  if not (RTD.Events[eventName] == nil) then return end

  RTD.Events[eventName] = {
    func = eventFunc,
    name = eventName,
    descriptor = eventDescriptor,
  }

  print(RTD.LogPrefix .. " Initialized " .. eventName .. " event.")
end

function RTD:Initialize()

  -- Include required modules for events
  local _, dirs = file.Find("rtd/events/*", "LUA")
  for _, eventDir in pairs(dirs) do
    local event, _ = file.Find("rtd/events/" .. eventDir .. "/*.lua", "LUA")

    for _, currFile in pairs(event) do

      if #currFile <= 0 then
        return
      end

      local indexOfRealm = string.find(currFile, "_")

      local realm = string.sub(currFile, 1, indexOfRealm)

      local fullFilePath = "rtd/events/" .. eventDir .. "/" .. currFile

      if realm == "sv_" and SERVER then
        include(fullFilePath)
      elseif realm == "sh_" then
        AddCSLuaFile(fullFilePath)
        include(fullFilePath)
      elseif realm == "cl_" and CLIENT then
        include(fullFilePath)
      elseif realm == "cl_" and SERVER then
        AddCSLuaFile(fullFilePath)
      end

    end
  end

  print(RTD.LogPrefix .. " Finished initializing.")
end


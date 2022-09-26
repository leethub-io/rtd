local function Burn(calling_ply)
  local pl = calling_ply

  pl:Ignite(10, 0)
  return "Help! I'm on fire!"
end

RTD = {}
RTD.Prefix = "!"
RTD.Command = "rtd"
RTD.Events = {}
-- RTD.Events = {
--   {
--     name = "rtd_burn",
--     func = Burn
--   },
--   {
--     name = "rtd_fast",
--     func = Burn
--   }
-- }

function RTD:RegisterEvent(event, eventName)
  if not (istable(event)) then return end  
  if not (RTD.Events[eventName] == nil) then return end

  table.insert(RTD.Events, event)
  print ("[RTD] Event Registered")
end

function RTD:Initialize()
  local _, dirs = file.Find("rtd/events/*", "LUA")
  for _, eventDir in pairs(dirs) do
      local event, _ = file.Find("rtd/events/" .. eventDir .. "/*.lua", "LUA")

      for _, currFile in pairs (event) do
        
        if #currFile <= 0 then return end

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
end



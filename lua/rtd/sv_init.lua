local function RTDCommand(ply, msg)
  local prefix = msg[1]
  local content = string.sub(msg, 2)
  
  if not (prefix == RTD.Prefix and content == RTD.Command) then return end
  if not (ply:Alive()) then return end
  local rtdSelector = math.random(1)

  local eventName = "rtd_burn"
  PrintTable(RTD.Events)
  return "Hello"
  --return RTD.Events[rtdSelector]["func"](ply)
end

hook.Add("PlayerSay", "RTDCommand", RTDCommand)
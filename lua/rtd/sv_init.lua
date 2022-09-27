local function RTDCommand(ply, msg)
  local prefix = msg[1]
  local content = string.sub(msg, 2)

  if not (prefix == RTD.Prefix and content == RTD.Command) then
    return
  end
  if not (ply:Alive()) then
    return
  end
  local rtdSelector = math.random(#RTD.Events)
  local eventKeys = table.GetKeys(RTD.Events)
  local event = eventKeys[rtdSelector]

  RTD.Events[event](ply)
  RTD:ChatLog(ply, event)

  return false
end

hook.Add("PlayerSay", "RTDCommand", RTDCommand)

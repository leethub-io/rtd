util.AddNetworkString("RTDCooldownNotify")

local function RTDCommand(ply, msg)
  local prefix = msg[1]
  local content = string.sub(msg, 2)

  if not (prefix == RTD.Prefix and content == RTD.Command) then return end
  if not (ply:Alive()) then return end
  if (ply.RTDCooldownActive) then 
    net.Start("RTDCooldownNotify")
      net.WriteInt(timer.TimeLeft("StopRTDCooldown"), 8)
    net.Send(ply)
    return false
  end

  ply:StartRTDCooldown()
  local numEvents = #table.GetKeys(RTD.Events)
  local rtdSelector = math.random(numEvents)
  local eventKeys = table.GetKeys(RTD.Events)
  local event = eventKeys[rtdSelector]
  event = RTD.Events[event]

  event["func"](ply)
  RTD:ChatLog(ply, event)

  return false
end

hook.Add("PlayerSay", "RTDCommand", RTDCommand)

util.AddNetworkString("ChatLog")

function RTD:ChatLog(calling_ply, event)
  net.Start("ChatLog")
  net.WriteEntity(calling_ply)
  net.WriteString(event["descriptor"])
  net.Broadcast()
  
  print(RTD.LogPrefix .. " " .. calling_ply:Nick() .. " ran command " .. event["name"])
end

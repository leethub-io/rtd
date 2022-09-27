util.AddNetworkString("ChatLog")

function RTD:ChatLog(calling_ply, cmd)
  net.Start("ChatLog")
    net.WriteEntity(calling_ply)
    net.WriteString(cmd)
  net.Broadcast()
  
  print(RTD.LogPrefix .. " " .. calling_ply:Nick() .. " ran command " .. cmd)
end
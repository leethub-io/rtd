net.Receive("ChatLog", function(len)
  local calling_ply = net.ReadEntity()
  local lp = LocalPlayer()
  local cmd = net.ReadString()

  if (lp == nil) then
    return
  end

  chat.AddText(RTD.LogPrefixColor, RTD.LogPrefix, RTD.LogChatColor,
      " " .. calling_ply:Nick() .. " rolled the dice and got ", RTD.LogCmdColor, cmd)
end)

net.Receive("RTDCooldownNotify", function()
  local timeLeft = net.ReadInt(8)
  chat.AddText(RTD.LogPrefixColor, RTD.LogPrefix, RTD.LogChatColor, " You cannot do that for another " .. timeLeft .. " seconds!")
end )
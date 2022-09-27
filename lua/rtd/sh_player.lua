local pl = FindMetaTable("Player")

function pl:StartRTDCooldown()
  self.RTDCooldownActive = true

  timer.Create("StopRTDCooldown", RTD.CooldownTime, 1, function()
    self.RTDCooldownActive = false
  end )
end

function pl:CooldownActive()
  print (self.RTDCooldownActive)
end
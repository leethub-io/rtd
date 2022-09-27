local pl = FindMetaTable("Player")

function pl:StartRTDCooldown()
  self.RTDCooldownActive = true

  timer.Create("StopRTDCooldown", 5, 1, function()
    self.RTDCooldownActive = false
  end )
end

function pl:CooldownActive()
  print (self.RTDCooldownActive)
end
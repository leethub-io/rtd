-- Event function
local function burnEventFunc(calling_ply)
  calling_ply:Ignite(5)

  hook.Add("EntityTakeDamage", "VoidIgniteDamage", function(entity, damage)
    return entity:IsPlayer() and damage:IsDamageType(DMG_BURN)
  end )
  
  timer.Simple(5, function()
    hook.Remove("EntityTakeDamage", "VoidIgniteDamage")
  end )
end

local burnEvent = {
  eventFunc=burnEventFunc,
  eventName="rtd_burn"
}

RTD:RegisterEvent(burnEvent)
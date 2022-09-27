-- Event function
local function burnEventFunc(calling_ply)
  calling_ply:Ignite(5)

  hook.Add("EntityTakeDamage", "VoidIgniteDamage", function(entity, damage)
    if not (entity:IsPlayer() and damage:IsDamageType(DMG_BURN)) then return false end
    
    return true
  end )
  
  timer.Simple(5, function()
  
    hook.Remove("EntityTakeDamage", "VoidIgniteDamage")

  end )
end

RTD:RegisterEvent(burnEventFunc, "rtd_burn")
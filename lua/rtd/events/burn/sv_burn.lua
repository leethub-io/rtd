-- Event function
local function burnEventFunc()
  return "Burn"
end

-- Event config
local burnEvent = {
  rtd_burn = burnEventFunc
}

RTD:RegisterEvent(burnEvent, "rtd_burn")
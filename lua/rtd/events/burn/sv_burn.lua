-- Event function
local function burnEventFunc(calling_ply)
  calling_ply:Say("Gee, I'm feeling pretty hot.")
end

RTD:RegisterEvent(burnEventFunc, "rtd_burn")
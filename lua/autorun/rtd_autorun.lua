if SERVER then
  AddCSLuaFile("rtd/sh_init.lua")
  include("rtd/sv_init.lua")
  include("rtd/sh_init.lua")
end

if CLIENT then
  include("rtd/sh_init.lua")
end

RTD:Initialize()

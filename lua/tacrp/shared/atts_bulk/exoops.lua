-- exoops.lua

local ATT = {}

-- ACR 6.5 Grendel conversion
ATT = {}

ATT.PrintName = "GRENDEL"
ATT.FullName = "6.5 Grendel Mod Kit"
ATT.Icon = Material("entities/tacrp_att_ammo_star15_50beo.png", "mips smooth")
ATT.Description = "Modification to load a high power round with better stopping power."
ATT.Pros = {"rating.range", "rating.control"}
ATT.Cons = {"rating.lethality", "att.procon.armor"}

ATT.Category = "ammo_masada"
ATT.SortOrder = 0.5

ATT.InstalledElements = {"50beo"}

ATT.Mult_Damage_Max = 0.85
ATT.Mult_Damage_Min = 1
ATT.Mult_Range_Min = 1.5
ATT.Mult_Range_Max = 1.25

ATT.Mult_Penetration = 0.5
ATT.Add_ArmorPenetration = -0.1
ATT.Mult_ArmorBonus = 0.75

ATT.Mult_RPM = 1
ATT.Mult_ClipSize = 1 * 0.75

ATT.Add_RecoilKick = -1
ATT.Mult_RecoilSpreadPenalty = 0.85
ATT.Mult_MuzzleVelocity = 1.2

ATT.Mult_ShootTimeMult = 1.5

ATT.Override_Sound_Shoot = "^tacint_shark/weapons/masada/65_unsil.wav"
ATT.Override_Sound_Shoot_Silenced = "^tacint_shark/weapons/masada/65_sil.wav"

TacRP.LoadAtt(ATT, "ammo_modular_65gren")

--SPAS-15 pump-action mode
ATT = {}

ATT.PrintName = "Pump"
ATT.FullName = "Pump-Action"
ATT.Icon = Material("entities/tacrp_att_bolt_light.png", "mips smooth")
ATT.Description = "Switch to pump-action operation, sacrificing fire-rate for improved control."
ATT.Pros = {"stat.spread", "stat.muzzlevelocity"}
ATT.Cons = {"stat.rpm"}
ATT.Ignore = false

ATT.Category = "bolt_pump"

ATT.SortOrder = 0

ATT.Mult_RPM = 0.35
ATT.Mult_ShootTimeMult = 1

ATT.Mult_MuzzleVelocity = 1.1
ATT.Mult_Spread = 0.8

ATT.Override_EjectDelay = 0.5
ATT.Override_Sound_Shoot = "^tacint_shark/weapons/spas15/fire_pump.wav"

ATT.Override_LastShot = false

ATT.Hook_TranslateSequence = function(self, seq)
    if seq == "fire1" then
        return {"fire_pump"}
    elseif seq == "blind_fire1" then
        return {"fire_pump"}
    elseif seq == "fire_iron" then
        return {"fire_pump"}
    end
end

ATT.Free = true

TacRP.LoadAtt(ATT, "bolt_spas15_pump")

--Mk 22 Slide Lock
ATT = {}

ATT.PrintName = "Slide Lock"
ATT.FullName = "Mk 22 Slide Lock"
ATT.Icon = Material("entities/tacrp_att_bolt_light.png", "mips smooth")
ATT.Description = "Locks the slide in place when firing to further reduce noise."
ATT.Pros = {"stat.damage", "rating.precision", "stat.muzzlevelocity", "stat.range"}
ATT.Cons = {"stat.rpm"}
ATT.Ignore = false

ATT.Category = "trigger_mk22"

ATT.SortOrder = 0

ATT.Add_Damage_Max = 5
ATT.Add_Damage_Min = 5

ATT.Mult_Spread = 0.5
ATT.Mult_HipFireSpreadPenalty = 0.75
ATT.Mult_MoveSpreadPenalty = 0.25
ATT.Override_RPM = 80
ATT.Override_RPMMultSemi = 1
ATT.Override_ShootTimeMult = 0.55

ATT.Add_Range_Min = 500
ATT.Add_Range_Max = 500

ATT.Mult_MuzzleVelocity = 1.15

ATT.Override_EjectDelay = 0.6

ATT.Override_TracerNum = 0
ATT.Mult_Vol_Shoot = 0.75

ATT.Override_ProceduralIronFire = false

ATT.Hook_TranslateSequence = function(self, seq)
    if seq == "fire" then
        return {"shoot_locked"}
    elseif seq == "lastshot" then
        return {"shoot_locked_lastshot"}
    elseif seq == "blind_fire" then
        return {"blind_shoot_locked"}
    elseif seq == "blind_lastshot" then
        return {"blind_shoot_locked_last"}
    end
end

ATT.Free = true

TacRP.LoadAtt(ATT, "trigger_mk22_locked")

-- Howa Scope
ATT = {}

ATT.PrintName = "Scope"
ATT.FullName = "Howa 2.2x DMR Scope"
ATT.Icon = Material("entities/tacrp_att_optic_howa.png", "mips smooth")
ATT.Description = "Proprietary marksman scope for the Type 64."
ATT.Pros = {"2.2x Zoom"}

ATT.Category = "optic_howa"

ATT.SortOrder = 0

ATT.Override_Scope = true
ATT.Override_ScopeHideWeapon = true
ATT.Override_ScopeOverlay = Material("tacrp/scopes/shortdot.png", "mips smooth")
ATT.Override_ScopeFOV = 90 / 2.2

ATT.Add_AimDownSightsTime = 0

ATT.InstalledElements = {"scope"}

if engine.ActiveGamemode() == "terrortown" then
    ATT.Free = true
end

TacRP.LoadAtt(ATT, "optic_howa_scope")

-- L85 refurbished bolt
-- sorry i secretly like the l85 and want to run it with no jams

ATT = {}
ATT.PrintName = "att.bolt_refurbished.name"
ATT.FullName = "att.bolt_refurbished.name.full"
ATT.Icon = Material("entities/tacrp_att_bolt_refurbished.png", "mips smooth")
ATT.Description = "att.bolt_refurbished.desc"
ATT.Pros = {"att.procon.reliability"}
ATT.Cons = {"stat.rpm", "stat.spread"}

ATT.Category = "bolt_l85"

ATT.SortOrder = 10

ATT.Mult_RPM = 700 / 750
ATT.Add_Spread = 0.004
ATT.Override_JamFactor = 0

TacRP.LoadAtt(ATT, "bolt_l85")

-- G36C Scope

ATT = {}
ATT.PrintName = "Int. Scope"
ATT.FullName = "G36C Integrated Scope"
ATT.Icon = Material("entities/tacrp_att_optic_g36c_scope.png", "mips smooth")
ATT.Description = "Low power integrated scope and carry handle for the G36C."
ATT.Pros = {"att.zoom.2"}

ATT.Category = "optic_g36c"

ATT.SortOrder = 2

ATT.Override_ScopeOverlay = Material("tacrp/scopes/g36.png", "mips smooth")
ATT.Override_ScopeFOV = 90 / 2
ATT.Override_ScopeHideWeapon = true

ATT.InstalledElements = {"scope"}


TacRP.LoadAtt(ATT, "optic_g36c_scope")

-- Scout .376 Steyr Ammo
ATT = {}

ATT.PrintName = ".376 Steyr"
ATT.FullName = "Scout .376 Steyr Mod Kit"
ATT.Icon = Material("entities/tacrp_att_ammo_376steyr.png", "mips smooth")
ATT.Description = "Modification to load a unique high-power hunting cartridge."
ATT.Pros = {"rating.lethality", "stat.muzzlevelocity"}
ATT.Cons = {"stat.clipsize", "stat.rpm", "stat.recoilkick"}

ATT.Category = "ammo_scout"
ATT.SortOrder = 0.5

ATT.InstalledElements = {"50beo"}

ATT.Add_ClipSize = -4

ATT.Mult_Damage_Max = 1.5
ATT.Mult_Damage_Min = 1.5

ATT.Mult_RPM = 1 / 1.6
ATT.Mult_ShootTimeMult = 1.6

ATT.Add_RecoilKick = 15
ATT.Mult_MuzzleVelocity = 1.1

ATT.Override_Ammo = "357"

ATT.Override_Sound_Shoot = "tacint_extras/scout/scout_fire-1-magnum.wav"
ATT.Add_Pitch_Shoot = 10

TacRP.LoadAtt(ATT, "ammo_scout_376")

ATT = {}

ATT.PrintName = "att.muzz_pistol_comp.name"
ATT.Icon = Material("entities/tacrp_att_muzz_pistol_comp.png", "mips smooth")
ATT.Description = "att.muzz_pistol_comp.desc"
ATT.Pros = {"stat.recoil", "stat.spread", "stat.range_min"}
ATT.Cons = {"stat.rpm"}

ATT.Model = "models/weapons/tacint/addons/pistol_comp.mdl"
ATT.Scale = 2
ATT.ModelOffset = Vector(-18, 0, -3.8)

ATT.Category = "muzzle_megastar"
ATT.InvAtt = "muzz_pistol_comp"

ATT.SortOrder = 1

ATT.Mult_RecoilKick = 0.5
ATT.Mult_RPM = 0.9
ATT.Mult_Spread = 0.75
ATT.Mult_Range_Min = 1.5

TacRP.LoadAtt(ATT, "muzz_megastar_comp")
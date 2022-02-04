local Chassis = GetSetting('part1') or 0 -- Part that changes your character's size
local CustomPart = GetSetting('tires') or 0	-- Part that changes the speed of your car
local WheelType = GetSetting('wheels') or 0
local Engine = GetSetting('engine') or 0
local Armor = GetSetting('armor') or 0

local file = ReadFile('/GameData/scripts/cars/'..Config.Car..'.con')
local optW = [[

	SetCharacterScale(%s);
	SetTireGrip(%s);
	SetSlipSteering(%s);
	SetEBrakeEffect(%s);
	SetBrakeScale(%s);
	SetMass(%s);
	SetGasScale(%s);
	SetSlipGasScale(%s);
	SetMaxWheelTurnAngle(%s);
	SetHighSpeedSteeringDrop(%s);
	SetMaxSpeedBurstTime(%s);
	SetTopSpeedKmh(%s);
	SetBurnoutRange(%s);
	SetSuspensionYOffset(%s);
	SetSuspensionLimit(%s);
	SetHitPoints(%s);
]]

local function Setup(n, m, p, q, r)
-- TIRES: 0 - High Grip, 1 - Medium Grip, 2 - Low Grip (drifty)
	local function splr(m)
		local t = {
			high = 0,
			ts = 0,
			br = 0
		}
		if m > 0 then
			t = car_settings.SpoilerPowers[m]
		end
		return t
	end
	local function engi(p)
		local t = {
			ms = 0,
			ak = 0,
			ts = 0,
			br = 0,
		}
		if p > 0 then
			t = car_settings.Engines[p]
		end
		return t
	end
	local function armr(q)
		local t = {
			ms = 0,
			ts = 1,
			hp = 1
		}
		if q > 0 then
			t = car_settings.Armor[q]
		end
		return t
	end
	local function chss(r)
		local t = {
			cs = 1,
		}
		if r > 0 then
			t = car_settings.Chassis[r]
		end
		return t
	end
	local function whls(n)
		local wheel = {}
		local function ts(s)
				return tostring(s)
			end
		if n ~= 0 then
			wheel = car_settings.WheelSettings[n]
		else 
			wheel = {
				grip = 3.16,
				ss = 60,
				ebe = .35,
				brk = 10,
				ms = 0,
				ak = 8,
				aks = 9,
				ang = 30,
				high = .3,
				bur = 2.5,
				ts = 150,
				br = .22,
				sus = 0,
				sl = .6,
			}
		end
		optW = string.format(optW,
			ts(chss(r).cs),
			ts(wheel.grip),
			ts(wheel.ss),
			ts(wheel.ebe),
			ts(wheel.brk),
			ts(1300+engi(p).ms+wheel.ms+armr(q).ms),
			ts(wheel.ak+engi(p).ak),
			ts(wheel.aks),
			ts(wheel.ang),
			ts(wheel.high+splr(m).high),
			ts(wheel.bur),
			ts(((wheel.ts+engi(p).ts)+splr(m).ts)+armr(q).ts),
			ts((wheel.br+engi(p).br)+splr(m).br),
			ts(wheel.sus),
			ts(wheel.sl),
			ts(3*armr(q).hp)
		)
		return optW
	end
	whls(n)
	return optW
end

file = file..Setup(WheelType, CustomPart, Engine, Armor, Chassis)
print(file)
Output(file)
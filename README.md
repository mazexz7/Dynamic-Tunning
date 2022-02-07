# Dynamic-Tunning
Donut Team thread link https://forum.donutteam.com/forum/topic/4633

## Description
**We can do great things in this game!**  
_Eg. dynamic tuning for Homer's car!_  
**_Disclaimer:_ This mod is just a concept, therefore I will release it as a "beta". I am planning to continue this as time goes on, so keep an eye on this page!**  

This mod allows for over 2,000,000,000 possible combinations of tuning with 80 parts (including stock)! I plan on adding more of them as time goes on, of course.  
Tune up Homer's car to fit your liking.  
This mod features a small variety of front & rear bumpers, sideskirts, horns & more!  
The engine sound changes when you change the engine, depending on how strong your choice is.  

## How to use:
1) Select the mod  
2) Go to settings  
3) Change the settings as desired  
4) Click "OK" to save your settings.  

### Disclaimer!
The main download (https://mega.nz/file/w0sXna6a#N7Uwj1XdxRueClcmt9TkBQ_03x37PaR0KSiJ4ymmH7Q) is mainly a framework for the addons & custom vehicles to work.
It is recommended that you do not modify this file!

# Custom Vehicle Template
The custom vehicle template is now available, check dt_mattress (https://github.com/mazexz7/Dynamic-Tunning/tree/main/dt_mattress)

Assuming you know how to make a custom vehicle already, to set it up for dynamic tuning you will need the following files edited; (see dt_mattress for template files)  
- Meta.ini
- CustomFiles.ini

### Disclaimer: This is a very basic explanation, you will find a more powerful use of the following, in the dt_mattress template.
## Meta.ini
### Require dynamic tuning
```ini
  [Miscellaneous]
  RequiredMod=m_dynaTune
```
### Set up your tuning/settings
```ini
  [Setting]  
  Page=Appearance  
  Name=part1  
  Title=Part 1  
  Type=MultipleChoice  
  Option=Option 0	;Repeat this line for more  
  Option=Option 1  
  Option=Option 2  
  ;Option=Option 3  
  Default=0  
```
## CustomFiles
### CustomFiles.ini
```ini
  [PathHandlers]
  art\\cars\\{carname}.p3d=Resources\\scripts\\{carname}P3D.lua
  scripts\\cars\\{carname}.con=Resources\\scripts\\{carname}CON.lua
```
### CustomFiles.lua
```lua
local files = {
	'modules/game',
	'modules/P3D',
	'modules/shortcuts',
	'modules/car_settings',
	'modules/sptutil',
	'Configurations',
	'carsounds'
}

for _, file in pairs(files) do
	dofile(string.format('%s/Resources/scripts/%s.lua', GetModPath(), file))
end
```
## Scripts and other resources
The **most** important part will happen here.  
Assuming you have `/Resources/scripts/modules` set up properly, this step will consist of making the scripts that will create your car.  
Inside `/Resources/scripts/`, create the following files:  
-carsound.lua  
-Configurations.lua  
-{carname}CON.lua  
-{carname}P3D.lua  
({carname} should be replaced with your car's name, `eg. famil_vCON.lua and famil_vP3D.lua`)  

### carsounds.lua
```lua  
-- This is only needed for vehicles the game already has.  
local skids = {  
	[1] = 'carsound/common/skid',  
	[2] = 'carsound/blank'  
}  

local carsounds = GetShared()  

carsounds[GetModName()] = {  
		Engine = 'honor',  
		Horn = 'blank',  
		Skid = skids[1],  
		IsHornLooped = true,  
		Startup = 'gti_starter',  
		Data1 = 'honor',  
		Data2 = 'blank',  
		Data3 = 'blank',  
		Data4 = 'blank'  
}  

carsounds['Config_'..GetModName()] = Config	-- Change Config to 'radical' if you're editing vehicles already in the game  

return carsounds
```

### Configurations.lua
```lua
Config = {}

	-- Set your car's name
	Config.Car = 'mattress'

	-- Set up how many options for each part you have.
	Config.Parts = {
								-- Important note: P3D Index starts at 0, LUA Index starts at 1.
								-- If your part is index '0' in p3d, it will be index '1' in here.
		--[[
		['example'] = {			
			Setting = 'part',	-- Name of the setting that this part refers to
			Name = 'shape',		-- Name that this part will set to a Mesh/Prop
			Number = 3,			-- How many of these parts are in your settings
			Index = 1,			-- Index of the First Composite Drawable Prop this part will modify 
			IndexEnd = 3		-- Index of the Last Composite Drawable Prop this part will modify
								-- Only include if you want multiple props to be affected
		},
		--]]
		[1] = {
			Setting = 'part1',
			Name = 'mattress',
			Number = 3,
			Index = 1
		},
		[2] = {
			Setting = 'part2',
			Name = 'sticks',
			Number = 3,
			Index = 2
		},
		[3] = {
			Setting = 'part3',
			Name = 'flashlight',
			Number = 3,
			Index = 3
		},
		[4] = {
			Setting = 'tires',
			Name = 'wheel',
			Number = 3,
			Index = 4,
			IndexEnd = 7
		},
	}

	-- Set up path for presets 2 & 3
	Config.preset1_path = '/GameData/art/cars/preset/option1/'
	Config.preset2_path = '/GameData/art/cars/preset/option2/'

	-- Car sound parameters
	Config.SoundParameters = {
		Name = 'mattress',
		EngineClipName = 'honor',
		EngineIdleClipName = 'honor',
		IdleEnginePitch = '0.620000',
		HornClipName = 'krust_horn',
		DamagedEngineClipName = 'fire',
		ReversePitchCapKmh = '50.000000',
		ReversePitchRange = {'0.560000', '1.110000'},
		ShiftPoint = {
			[1] = '0.010000',
			[2] = '1.000000',
			[3] = '1.000000',
			[4] = '1.000000',
			[5] = '1.000000'
		},
		GearPitchRange = {
			[1] = {'0.550000', '1.520000'},
			[2] = {'0.890000', '1.560000'},
			[3] = {'1.220000', '1.450000'},
			[4] = {'1.260000', '1.350000'},
			[5] = {'1.320000', '1.520000'}
		},
		GearShiftPitchDrop = {
			[1] = '0.810000',
			[2] = '0.800000',
			[3] = '0.800000',
			[4] = '0.800000',
			[5] = '0.800000'
		},
		AttackTimeMsecs = '244.000000',
		DelayTimeMsecs = '52',
		DecayTimeMsecs = '222.000000',
		DecayFinishTrim = '0.780000',
		DownshiftDamperSize = '0.100000',
		CarDoorOpenClipName = 'blank',  
		CarDoorCloseClipName = 'blank',  
		RoadSkidClipName = 'blank',  
		DirtSkidClipName = 'blank',  
		SetOverlayClipName = 'blank'  
	}  

return Config
```

### {carname}CON.lua
```lua
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
```

### {carname}P3D.lua
```lua
local IsPreset = GetSetting('preset')
local function CreatePart(t)
	local newPart = {
		Setting = '',
		Name = '',
		Number = 0,
		Index = 0,
		IndexEnd = nil
	}
	newPart.Setting = t.Setting or ''
	newPart.Name = t.Name or ''
	newPart.Number = t.Number or 0 
	newPart.Index = t.Index or 0 
	newPart.IndexEnd = t.IndexEnd or nil
	return newPart
end

if IsPreset == 1 then
-- ============================ OPTION1 PRESET ============================
	local presetFile = ReadFile(Config.preset1_path..Config.Car..'.p3d')
	local preset = P3D.P3DChunk:new{Raw = presetFile} 
	Output(preset:Output())
elseif IsPreset == 2 then
-- ============================ OPTION2 PRESET ============================
	local presetFile = ReadFile(Config.preset2_path..Config.Car..'.p3d')
	local preset = P3D.P3DChunk:new{Raw = presetFile} 
	Output(preset:Output())
elseif IsPreset == 3 then
-- ============================ RANDOM PRESET ============================
	local parts = {}
	for _, part in pairs(Config.Parts) do
		local new = CreatePart(part)
		parts[_] = new
	end
	for _, part in pairs(parts) do
		part.Name = part.Name..'_'..math.random(1, part.Number) - 1
	end
	local file = ReadFile('/GameData/art/cars/'..Config.Car..'.p3d')
	Car = P3D.P3DChunk:new{Raw = file}
	local i = Car:GetChunkIndex(P3D.Identifiers.Composite_Drawable)
	local Composite = P3D.CompositeDrawableP3DChunk:new{Raw = Car:GetChunkAtIndex(i)}
	local Props = P3D.CompositeDrawablePropListP3DChunk:new{Raw = Composite:GetChunkAtIndex(2)}
	local chunks = {}
	for _, part in pairs(parts) do
		table.insert(chunks, part.Index, part.Name)
		if part.IndexEnd then
			for i = part.Index + 1, part.IndexEnd do
				table.insert(chunks, i, part.Name)
			end
		end
	end

	for index, name in pairs(chunks) do
		print(index..' '..name)	
	end

	for index, name in pairs(chunks) do
		shortcuts.SetPRChunk(tonumber(index), name, Props)	
	end
	Composite:SetChunkAtIndex(2, Props:Output())
	Car:SetChunkAtIndex(i, Composite:Output())
	Output(Car:Output())
else
-- ============================ CUSTOM PRESET ============================
	local parts = {}
	local position = 1
	for _, part in pairs(Config.Parts) do
		local new = CreatePart(part)
		parts[_] = new
	end
	for _, part in pairs(parts) do
		part.Name = part.Name..'_'..GetSetting(part.Setting)
	end
	local file = ReadFile('/GameData/art/cars/'..Config.Car..'.p3d')
	Car = P3D.P3DChunk:new{Raw = file}
	local i = Car:GetChunkIndex(P3D.Identifiers.Composite_Drawable)
	local Composite = P3D.CompositeDrawableP3DChunk:new{Raw = Car:GetChunkAtIndex(i)}
	local Props = P3D.CompositeDrawablePropListP3DChunk:new{Raw = Composite:GetChunkAtIndex(2)}
	local chunks = {}
	for _, part in pairs(parts) do
		table.insert(chunks, part.Index, part.Name)
		if part.IndexEnd then
			for i = part.Index + 1, part.IndexEnd do
				table.insert(chunks, i, part.Name)
			end
		end
	end

	for index, name in pairs(chunks) do
		print(index..' '..name)	
	end

	for index, name in pairs(chunks) do
		shortcuts.SetPRChunk(tonumber(index), name, Props)	
	end
	Composite:SetChunkAtIndex(2, Props:Output())
	Car:SetChunkAtIndex(i, Composite:Output())
	Output(Car:Output())
end
```

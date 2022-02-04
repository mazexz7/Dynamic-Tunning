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
car_settings = {}		-- These settings will add or multiply to original values, but will not replace them

car_settings.Chassis = {	-- "Chassis"
	[1] = {
		cs = 1			--Character Size
	},
	[2] = {
		cs = 1
	},
}
car_settings.Engines = {	-- "Engine"
	-- Level 1:
	[1] = {
		ms = 50,		-- Mass
		ak = .5,		-- Acceleration (Gas Scale)
		ts = 5,			-- Top Speed
		br = -.5		-- Burnout Range
	},
	[2] = {
		ms = 25,
		ak = .75,
		ts = 10,
		br = -1,
	},
	-- Level 2:
	[3] = {
		ms = 75,
		ak = .75,
		ts = 7,
		br = -.75
	},
	[4] = {
		ms = 50,
		ak = .9,
		ts = 7,
		br = -.9,
	},
	[5] = {
		ms = 70,
		ak = 1,
		ts = 14,
		br = -1.5
	},
	-- Level 3:
	[6] = {
		ms = 100,
		ak = 1.25,
		ts = 9,
		br = -1
	},
	[7] = {
		ms = 100,
		ak = 1.25,
		ts = 9,
		br = -.9,
	},
	[8] = {
		ms = 100,
		ak = 2,
		ts = 9,
		br = -1.7
	},
	[9] = {
		ms = -200,
		ak = 7.5,
		ts = 20,
		br = -1.7
	},
	[10] = {
		ms = -300,
		ak = 10,
		ts = 45,
		br = -.7
	},
}
car_settings.SpoilerPowers = {	-- "CustomPart"
	[1] = {
		high = 0,		-- High Speed Steering Drop
		ts = 0,			-- Top Speed (KMH)
		br = 0			-- Burnout Range
	},
	[2] = {
		high = .1,
		ts = 5,
		br = 0
	},
	[3] = {
		high = .1,
		ts = 5,
		br = .05
	},
	[4] = {
		high = .1,
		ts = 10,
		br = .06
	},
	[5] = {
		high = 1,
		ts = 10,
		br = .07
	},
}
car_settings.WheelSettings = {	-- "WheelType"
	[1] = {
		grip = 3.4,		-- Tire Grip
		ss = 60,		-- Slip Steering
		ebe = .4,		-- E-Brake Effect
		brk = 15,		-- Brake Scale
		ms = 0,			-- Mass
		ak = 11,		-- Acceleration (Gas Scale)
		aks = 13,		-- Slip Acceleration (Slip Gas Scale)
		ang = 31,		-- Max Wheel Turn Angle
		high = .3,		-- High Speed Steering Drop
		bur = 1,		-- Max Speed Burst Time
		ts = 155,		-- Top Speed (KMH)
		br = .21,		-- Burnout Range
		sus = -.1,		-- Suspension Y Offset
		sl = .7			-- Suspension Limit
	},
	[2] = {
		grip = .07,
		ss = 71,
		ebe = .9,
		brk = 23,
		ms = 0,
		ak = 3,
		aks = 5,
		ang = 25,
		high = .35,
		bur = 1.1,
		ts = 145,
		br = .3,
		sus = .02,
		sl = .2
	},
}

car_settings.Armor = {
	[1] = {
		ms = 250,		-- Mass
		ts = .75,		-- Top Speed (KMH)
		hp = 2			-- Hit Points
	},
	[2] = {
		ms = 350,
		ts = .25,
		hp = 4
	}
}

return car_settings
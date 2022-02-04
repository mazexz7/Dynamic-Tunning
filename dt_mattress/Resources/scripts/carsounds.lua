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

carsounds['Config_'..GetModName()] = Config

return carsounds
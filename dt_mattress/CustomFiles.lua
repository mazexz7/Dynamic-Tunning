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
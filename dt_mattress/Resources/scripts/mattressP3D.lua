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
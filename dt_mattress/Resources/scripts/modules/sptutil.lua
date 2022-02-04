local SoundResourceCount = 0

local NewLine = "\r\n"
local Tab = "	"

SPTUtil = {}

function SPTUtil.LoadSoundScript(Path, RemovedDefaults)
	if RemovedDefaults == nil then
		RemovedDefaults = {}
	end

	local OriginalSoundScript = ReadFile(Path)

	-- Loop through each SoundData in the loaded SPT
	for SoundResourceData in OriginalSoundScript:gmatch("[^}]+") do
		-- Parse the name of the sound resource
		local Name = SoundResourceData:match("named ([^\r\n]+)")

		-- If it matched and its not in the RemovedDefaults table, then output it.
		if Name and not RemovedDefaults[Name] then
			Output(SoundResourceData)
			Output("}")

			SoundResourceCount = SoundResourceCount + 1
		end
	end
end

function SPTUtil.CreateSoundResourceData(Name, Filenames, Streaming, Looping, Trim)
	if SoundResourceCount <= 5000 then
	
		if type(Filenames) == "string" then
			Filenames = { Filenames }
		end
			
		Output("create daSoundResourceData named " .. Name .. NewLine)
		Output("{ " .. NewLine)
			
		for k, Filename in ipairs(Filenames) do
			Output(Tab .. "AddFilename ( \"" .. Filename .. "\" 1.000000 ) " .. NewLine)
		end
		
		if Streaming ~= nil and Streaming == true then
			Output(Tab .. "SetStreaming ( " .. tostring(Streaming) .. " ) " .. NewLine)
		end
		
		if Looping ~= nil and Looping == true then
			Output(Tab .. "SetLooping ( " .. tostring(Looping) .. " ) " .. NewLine)
		end
		
		if Trim ~= nil then
			if type(Trim) == "string" then	
				Trim = { Trim }
			end
				
			for k, v in pairs(Trim) do
				Output(Tab .. "SetTrim ( " .. tostring(v) .. " ) option " .. Trim[k] .. " " .. NewLine)
			end
		end
		
		Output("} " .. NewLine)

		SoundResourceCount = SoundResourceCount + 1
	else
		Alert("SPTUtil:\nToo many sound resources registered.")
	end
end

function SPTUtil.LoadSoundResourceFolder(Path)
	if Exists(Path, true, true) then
		DirectoryGetEntries(Path, function(Name, Directory)
			local FullName = Path .. "/" .. Name

			if Directory then 
				SPTUtil.LoadSoundResourceFolder(FullName)
			else
				local Extension = GetFileExtension(Name)

				if Extension == ".lua" then
					dofile(FullName)
				elseif Extension then
					-- TODO: Load SPT files here
				end
			end
			
			return true
		end)
	else
		console.log("[SPTUtil] Tried to load a non-existent sound resource folder.")
	end
end

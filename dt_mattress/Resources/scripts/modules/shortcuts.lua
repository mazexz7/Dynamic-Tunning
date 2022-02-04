shortcuts = {}

function shortcuts.SetPRChunk(index, name, props)
	chunk = P3D.CompositeDrawablePropP3DChunk:new{Raw = props:GetChunkAtIndex(index)}
	chunk:SetName(name)
	props:SetChunkAtIndex(index, chunk:Output())
end

function shortcuts.GetShader(name)
	local si = Car:GetChunkIndex(P3D.Identifiers.Shader)
	local shader = P3D.CompositeDrawableP3DChunk:new{Raw = Car:GetChunkAtIndex(si)}
	if shader:GetName() ~= P3D.MakeP3DString(name) then
		repeat
			si = si - 1
			shader = P3D.CompositeDrawableP3DChunk:new{Raw = Car:GetChunkAtIndex(si)}
		until shader:GetName() == P3D.MakeP3DString(name)
	end
	return shader
end

return shortcuts
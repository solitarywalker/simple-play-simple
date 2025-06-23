local parts = {}

-- @param t geometry
local function load(t)
	
	parts.destination = {
		{id = -110, loop = 500, timer = 2, dst = {{time = 0, x = 0, y = 0, w = t.resolution.w, h = t.resolution.h, a = 0},{time = 500, a = 255}}}
	}	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
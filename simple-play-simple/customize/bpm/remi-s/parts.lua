local parts = {}

-- @param t geometry
local function load(t)	

	parts.source = {
		{id = "src-bpm", path = "../customize/bpm/remi-s/bpm.png"}
	}
	
	parts.image = {
		{id = "bpm-s", src = "src-bpm", x = 0, y = 50, w = 44, h = 14}
	}
	
	parts.value = {
		{id = "nowbpm", src = "src-bpm", x = 0, y = 0, w = 300, h = 26, divx = 10, digit = 3, align = 2, ref = 160},
		{id = "minbpm", src = "src-bpm", x = 0, y = 26, w = 160, h = 24, divx = 10, digit = 3, align = 2, ref = 91},
		{id = "maxbpm", src = "src-bpm", x = 0, y = 26, w = 160, h = 24, divx = 10, digit = 3, align = 2, ref = 90}
	}
	
	parts.destination = {
		{id = "bpm-s",	dst = {{x = t.frame.bpm.x + 87,		y = t.frame.bpm.y + 32,	w = 44, h = 14}}},
		{id = "nowbpm",	dst = {{x = t.frame.bpm.x + 64,		y = t.frame.bpm.y,		w = 30, h = 26}}},
		{id = "minbpm",	dst = {{x = t.frame.bpm.x,			y = t.frame.bpm.y,		w = 16, h = 24}}},
		{id = "maxbpm",	dst = {{x = t.frame.bpm.x + 170,	y = t.frame.bpm.y,		w = 16, h = 24}}}
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}
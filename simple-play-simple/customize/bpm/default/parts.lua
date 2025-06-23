local parts = {}

-- @param t geometry
local function load(t)	

	parts.source = {
		{id = "src-bpm", path = "../customize/bpm/default/bpm.png"}
	}
	
	parts.image = {
		{id = "bpm-s", src = "src-bpm", x = 0, y = 39, w = 45, h = 15}
	}
	
	parts.value = {
		{id = "nowbpm", src = "src-bpm", x = 0, y = 0, w = 240, h = 24, divx = 10, digit = 4, align = 2, ref = 160},
		{id = "minbpm", src = "src-bpm", x = 0, y = 24, w = 130, h = 15, divx = 10, digit = 4, align = 2, ref = 91},
		{id = "maxbpm", src = "src-bpm", x = 0, y = 24, w = 130, h = 15, divx = 10, digit = 4, align = 2, ref = 90}
	}
	
	parts.destination = {
		{id = "bpm-s",	dst = {{x = t.frame.bpm.x + 78,		y = t.frame.bpm.y + 30,	w = 45, h = 15}}},
		{id = "nowbpm",	dst = {{x = t.frame.bpm.x + 52,		y = t.frame.bpm.y,		w = 24, h = 24}}},
		{id = "minbpm",	dst = {{x = t.frame.bpm.x,			y = t.frame.bpm.y,		w = 13, h = 15}}},
		{id = "maxbpm",	dst = {{x = t.frame.bpm.x + 148,	y = t.frame.bpm.y,		w = 13, h = 15}}}
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}
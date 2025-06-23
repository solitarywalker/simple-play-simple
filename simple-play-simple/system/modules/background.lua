local parts = {}

local function load(g)
	
	parts.source = {
		{id = "src-background",	path = "../customize/background/*"}
	}
	
	parts.image = {
		{id = "background", src = "src-background", x = 0, y = 0, w = -1, h = -1}
	}
		
	parts.destination = {
		{id = "background", filter = 1, stretch = 3, dst = {
			{x = 0, y = 0, w = g.resolution.w, h = g.resolution.h, a = g.frame.background.a}
		}}
	}
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
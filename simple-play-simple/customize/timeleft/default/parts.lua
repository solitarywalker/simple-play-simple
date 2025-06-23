local parts = {}

local function load(g)

	parts.source = {{id = "src-timeleft", path = "../customize/timeleft/*".. "/parts.png"}}
	
	parts.image = {
		{id = "timeleft-s", src = "src-timeleft", x = 0, y = 0, w = 65, h = 17},
		{id = "timeleft-colon", src = "src-timeleft", x = 52, y = 0, w = 13, h = 17}
	}
	
	parts.value = {
		{id = "timeleft-mm", src = "src-timeleft", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 2, ref = 163},
		{id = "timeleft-ss", src = "src-timeleft", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 2, ref = 164}
	}
	parts.destination = {
		{id = "timeleft-s",		dst = {{x = g.frame.timeleft.x,			y = g.frame.timeleft.y, w = 65, h = 17}}},
		{id = "timeleft-colon",	dst = {{x = g.frame.timeleft.x + 91,	y = g.frame.timeleft.y, w = 13, h = 17}}},
		{id = "timeleft-mm",	dst = {{x = g.frame.timeleft.x + 65,	y = g.frame.timeleft.y, w = 13, h = 17}}},
		{id = "timeleft-ss",	dst = {{x = g.frame.timeleft.x + 104,	y = g.frame.timeleft.y, w = 13, h = 17}}}
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(g)

	parts.source = {{id = "src-scorerate", path = "../customize/scorerate/*".. "/parts.png"}}
	
	parts.image = {
		{id = "scorerate-s", src = "src-scorerate", x = 0, y = 0, w = 65, h = 17},
		{id = "scorerate-dot", src = "src-scorerate", x = 65, y = 0, w = 13, h = 17}
	}
	
	parts.value = {
		{id = "scorerate-n",		src = "src-scorerate", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 3, ref = 102},
		{id = "scorerate-ad-n",		src = "src-scorerate", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 2, align = 1, ref = 103}
	}
	parts.destination = {
		{id = "scorerate-s",		dst = {{x = g.frame.scorerate.x,		y = g.frame.scorerate.y, w = 65, h = 17}}},
		{id = "scorerate-dot",		dst = {{x = g.frame.scorerate.x + 104,	y = g.frame.scorerate.y, w = 13, h = 17}}},
		{id = "scorerate-n",		dst = {{x = g.frame.scorerate.x + 65,	y = g.frame.scorerate.y, w = 13, h = 17}}},
		{id = "scorerate-ad-n",		dst = {{x = g.frame.scorerate.x + 117,	y = g.frame.scorerate.y, w = 13, h = 17}}}
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
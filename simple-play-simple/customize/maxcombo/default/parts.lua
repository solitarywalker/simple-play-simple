local parts = {}

local function load(g)

	parts.source = {{id = "src-maxcombo", path = "../customize/maxcombo/*".. "/parts.png"}}
	
	parts.image = {{id = "maxcombo-s", src = "src-maxcombo", x = 0, y = 0, w = 78, h = 17}}
	parts.value = {{id = "maxcombo-n", src = "src-maxcombo", x = 0, y = 17, w = 130, h = 17, divx = 10, digit = 5, align = 1, ref = 105}}
	parts.destination = {
		{id = "maxcombo-s",	dst = {{x = g.frame.maxcombo.x,			y = g.frame.maxcombo.y, w = 78, h = 17}}},
		{id = "maxcombo-n",	dst = {{x = g.frame.maxcombo.x + 78,	y = g.frame.maxcombo.y, w = 13, h = 17}}}
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
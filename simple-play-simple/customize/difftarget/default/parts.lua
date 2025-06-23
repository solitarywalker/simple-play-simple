local parts = {}

local function load(g)

	parts.source = {{id = "src-difftarget", path = "../customize/difftarget/*".. "/parts.png"}}
	
	parts.image = {{id = "difftarget-s", src = "src-difftarget", x = 0, y = 0, w = 65, h = 17}}
	
	parts.value = {{id = "difftarget-n", src = "src-difftarget", x = 0, y = 17, w = 156, h = 34, divx = 12, divy = 2, digit = 5, align = 1, ref = 153}}
	parts.destination = {
		{id = "difftarget-s", dst = {{x = g.frame.difftarget.x,			y = g.frame.difftarget.y, w = 65, h = 17}}},
		{id = "difftarget-n", dst = {{x = g.frame.difftarget.x + 65,	y = g.frame.difftarget.y, w = 13, h = 17}}},
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
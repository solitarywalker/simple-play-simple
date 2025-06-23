local parts = {}

local function load(g)

	parts.source = {{id = "src-diffbest", path = "../customize/diffbest/*".. "/parts.png"}}
	
	parts.image = {{id = "diffbest-s", src = "src-diffbest", x = 0, y = 0, w = 65, h = 17}}
	
	parts.value = {{id = "diffbest-n", src = "src-diffbest", x = 0, y = 17, w = 156, h = 34, divx = 12, divy = 2, digit = 5, align = 1, ref = 152}}
	parts.destination = {
		{id = "diffbest-s", dst = {{x = g.frame.diffbest.x,			y = g.frame.diffbest.y, w = 65, h = 17}}},
		{id = "diffbest-n", dst = {{x = g.frame.diffbest.x + 65,	y = g.frame.diffbest.y, w = 13, h = 17}}},
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
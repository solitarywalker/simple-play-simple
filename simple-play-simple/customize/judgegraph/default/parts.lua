local parts = {}

local function load(g)
	parts.judgegraph	= {{id = "judgegraph", type = 1}}
	parts.destination	= {{id = "judgegraph", dst = {{x = g.frame.judgegraph.x, y = g.frame.judgegraph.y, w = g.frame.judgegraph.w, h = g.frame.judgegraph.h, a = g.frame.judgegraph.a}}}}
	return parts
end

return {
	parts = parts,
	load = load
}
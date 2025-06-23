local parts = {}

local function load(g)
	parts.hiterrorvisualizer	= {{id = "hiterrorvisualizer"}}
	parts.destination		= {{id = "hiterrorvisualizer", dst = {{x = g.frame.hiterrorvisualizer.x, y = g.frame.hiterrorvisualizer.y, w = g.frame.hiterrorvisualizer.w, h = g.frame.hiterrorvisualizer.h, a = g.frame.hiterrorvisualizer.a}}}}
	return parts
end

return {
	parts = parts,
	load = load
}
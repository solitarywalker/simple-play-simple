local parts = {}

local function load(g)
	parts.timingvisualizer	= {{id = "timingvisualizer"}}
	parts.destination		= {{id = "timingvisualizer", dst = {{x = g.frame.timingvisualizer.x, y = g.frame.timingvisualizer.y, w = g.frame.timingvisualizer.w, h = g.frame.timingvisualizer.h, a = g.frame.timingvisualizer.a}}}}
	return parts
end

return {
	parts = parts,
	load = load
}
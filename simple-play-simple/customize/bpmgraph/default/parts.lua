local parts = {}

local function load(g)
	parts.bpmgraph		= {{id = "bpmgraph"}}
	parts.destination	= {{id = "bpmgraph", dst = {{x = g.frame.bpmgraph.x, y = g.frame.bpmgraph.y, w = g.frame.bpmgraph.w, h = g.frame.bpmgraph.h, a = g.frame.bpmgraph.a}}}}
	return parts
end

return {
	parts = parts,
	load = load
}
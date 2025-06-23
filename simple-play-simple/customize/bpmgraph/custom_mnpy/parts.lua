local parts = {}

local function load(g)
	parts.bpmgraph = {
		{id = "bpmgraph", lineWidth = 10}
	}
	parts.destination = {
		{id = "bpmgraph", dst = {{
			x = g.frame.songprogress.x - (g.frame.songprogress.range / 2) + 20,
			y = g.frame.songprogress.y - (g.frame.songprogress.range / 2),
			w = g.frame.songprogress.range,
			h = 50,
			--a = g.frame.bpmgraph.a,
			angle = -90
		}}}
	}
	return parts
end

return {
	parts = parts,
	load = load
}
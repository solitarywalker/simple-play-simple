local parts = {}

local function load(g)
	
	parts.source = {
		{id = "src-lanebackground",	path = "../customize/lanebackground/*"}
	}
	
	parts.image = {
		{id = "lanebackground", src = "src-lanebackground", x = 0, y = 0, w = -1, h = -1}
	}
		
	parts.destination = {}
	for i = 1, #g.lanes.x do
		table.insert(parts.destination, {id = "lanebackground", filter = 1, stretch = 3, dst = {
			{x = g.lanes.inside.x[i], y = g.lanes.inside.y[i], w = g.lanes.inside.w[i], h = g.lanes.inside.h[i], a = g.lanes.background.a}
		}})
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
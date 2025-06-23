local parts = {}

local function load(g)
	
	parts.source = {
		{id = "src-glow", path = "../customize/glow/*" .. "/parts.png"}
	}
	parts.image = {
		{id = "glow", src = "src-glow", x = 0, y = 0, w = -1, h = -1}
	}
	parts.destination = {}
	table.insert(parts.destination, {id = "glow", timer = 40, offset = 3, blend = 2, dst = {
		{x = g.lanes.inside.x[1], y = g.lanes.inside.y[1], w = g.lanes.inside.w[1], h = g.lanes.glow.h, a = g.lanes.glow.a / 4}
	}})
	table.insert(parts.destination, {id = "glow", timer = 140, offset = 3, blend = 2, dst = {
		{time = 0, x = g.lanes.inside.x[1], y = g.lanes.inside.y[1], w = g.lanes.inside.w[1], h = g.lanes.glow.h, a = g.lanes.glow.a},
		{time = 1000, a = 0}
	}})

	if g.type == 2 or g.type == 3 then
		table.insert(parts.destination, {id = "glow", timer = 40, offset = 3, blend = 2, dst = {
			{x = g.lanes.inside.x[2], y = g.lanes.inside.y[2], w = g.lanes.inside.w[2], h = g.lanes.glow.h, a = g.lanes.glow.a / 4}
		}})
		table.insert(parts.destination, {id = "glow", timer = 140, offset = 3, blend = 2, dst = {
			{time = 0, x = g.lanes.inside.x[2], y = g.lanes.inside.y[2], w = g.lanes.inside.w[2], h = g.lanes.glow.h, a = g.lanes.glow.a},
			{time = 1000, a = 0}
		}})
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
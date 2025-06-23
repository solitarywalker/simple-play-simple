local parts = {}

local function load(g)
	
	parts.source = {
		{id = "src-judgeline", path = "../customize/judgeline/*" .. "/parts.png"}
	}
	parts.image = {
		{id = "judgeline", src = "src-judgeline", x = 0, y = 0, w = 1, h = 1}
	}
	parts.graph = {
		{id = "load-progress",	src = "src-judgeline", x = 0, y = 0, w = -1, h = -1, angle = 0, type = 102}
	}
	parts.destination = {}
	table.insert(parts.destination, {id = "judgeline", timer = 40, offset = 3, dst = {
		{x = g.lanes.inside.x[1], y = g.lanes.inside.y[1], w = g.lanes.inside.w[1], h = g.lanes.judgeline.h, a = g.lanes.judgeline.a}
	}})
	table.insert(parts.destination, {id = "load-progress", offset = 3, op = {80}, dst = {
		{x = g.lanes.inside.x[1], y = g.lanes.inside.y[1], w = g.lanes.inside.w[1], h = g.lanes.judgeline.h, a = g.lanes.judgeline.a}
	}})
	if g.type == 2 or g.type == 3 then
		table.insert(parts.destination, {id = "judgeline", timer = 40, offset = 3, dst = {
			{x = g.lanes.inside.x[2], y = g.lanes.inside.y[2], w = g.lanes.inside.w[2], h = g.lanes.judgeline.h, a = g.lanes.judgeline.a}
		}})
		table.insert(parts.destination, {id = "load-progress", offset = 3, op = {80}, dst = {
			{x = g.lanes.inside.x[2], y = g.lanes.inside.y[2], w = g.lanes.inside.w[2], h = g.lanes.judgeline.h, a = g.lanes.judgeline.a}
		}})
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
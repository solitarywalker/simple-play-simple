local parts = {}

local function load(g)
	
	local lane_types = {}
	if		g.type == 1 or g.type == 3	then lane_types = {1, 2, 3, 4, 5, "s"}
	elseif	g.type == 0 or g.type == 2	then lane_types = {1, 2, 3, 4, 5, 6, 7, "s"}
	elseif	g.type == 4					then lane_types = {1, 2, 3, 4, 5, 6, 7, 8, 9}
	end
	
	local function is_dp() return g.type == 2 or g.type == 3 end
	
	parts.source = {
		{id = "src-line",		path = "../customize/lane/*" .. "/line.png"},
		{id = "src-outline",	path = "../customize/lane/*" .. "/outline.png"},
		{id = "src-lane-s",		path = "../customize/lane/*" .. "/0.png"},
		{id = "src-lane-1",		path = "../customize/lane/*" .. "/1.png"},
		{id = "src-lane-2",		path = "../customize/lane/*" .. "/2.png"},
		{id = "src-lane-3",		path = "../customize/lane/*" .. "/3.png"},
		{id = "src-lane-4",		path = "../customize/lane/*" .. "/4.png"},
		{id = "src-lane-5",		path = "../customize/lane/*" .. "/5.png"},
		{id = "src-lane-6",		path = "../customize/lane/*" .. "/6.png"},
		{id = "src-lane-7",		path = "../customize/lane/*" .. "/7.png"},
		{id = "src-lane-8",		path = "../customize/lane/*" .. "/8.png"},
		{id = "src-lane-9",		path = "../customize/lane/*" .. "/9.png"}
	}
	parts.image = {
		{id = "lane-line",		src = "src-line",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-outline",	src = "src-outline",	x = 0, y = 0, w = -1, h = -1},
		{id = "lane-s",			src = "src-lane-s",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-1",			src = "src-lane-1",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-2",			src = "src-lane-2",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-3",			src = "src-lane-3",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-4",			src = "src-lane-4",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-5",			src = "src-lane-5",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-6",			src = "src-lane-6",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-7",			src = "src-lane-7",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-8",			src = "src-lane-8",		x = 0, y = 0, w = -1, h = -1},
		{id = "lane-9",			src = "src-lane-9",		x = 0, y = 0, w = -1, h = -1}
	}
	parts.destination = {}
	
	table.insert(parts.destination, {id = "lane-outline", loop = 500, dst = {
		{time = 200, x = g.lane.outline.x[1][1], y = g.lanes.y[1] + g.lane.outline.px, w = g.lane.outline.px, h = 0, a = g.lane.outline.a, acc = 2},
		{time = 500, h = g.lanes.h[1] - g.lane.outline.px}
	}})
	table.insert(parts.destination, {id = "lane-outline", loop = 500, dst = {
		{time = 200, x = g.lane.outline.x[1][2], y = g.lanes.y[1] + g.lane.outline.px, w = g.lane.outline.px, h = 0, a = g.lane.outline.a, acc = 2},
		{time = 500, h = g.lanes.h[1] - g.lane.outline.px}
	}})
	table.insert(parts.destination, {id = "lane-outline", loop = 200, dst = {
		{time = 0, x = g.lane.outline.x[1][1], y = g.lanes.y[1], w = g.lanes.w[1], h = g.lane.outline.px, a = 0},
		{time = 200, a = g.lane.outline.a}
	}})
	if is_dp() then
		table.insert(parts.destination, {id = "lane-outline", loop = 500, dst = {
			{time = 200, x = g.lane.outline.x[2][1], y = g.lanes.y[2] + g.lane.outline.px, w = g.lane.outline.px, h = 0, a = g.lane.outline.a, acc = 2},
			{time = 500, h = g.lanes.h[1] - g.lane.outline.px}
		}})
		table.insert(parts.destination, {id = "lane-outline", loop = 500, dst = {
			{time = 200, x = g.lane.outline.x[2][2], y = g.lanes.y[2] + g.lane.outline.px, w = g.lane.outline.px, h = 0, a = g.lane.outline.a, acc = 2},
			{time = 500, h = g.lanes.h[1] - g.lane.outline.px}
		}})
		table.insert(parts.destination, {id = "lane-outline", loop = 200, dst = {
			{time = 0, x = g.lane.outline.x[2][1], y = g.lanes.y[2], w = g.lanes.w[2], h = g.lane.outline.px, a = 0},
			{time = 200, a = g.lane.outline.a}
		}})
	end
	
	for i, v in ipairs(lane_types) do
		if v == "s" then
			table.insert(parts.destination, {id = "lane-s", loop = 1000,		dst = {
				{time = 600, x = g.lane.lane.x[1][i], y = g.lanes.y[1] + g.lane.outline.px, w = g.lane.lane.w[1][i], h = g.lanes.h[1], a = 0, acc = 2},
				{time = 1000, a = g.lane.lane.a}
			}})
			if is_dp() then
				table.insert(parts.destination, {id = "lane-s", loop = 1000,		dst = {
					{time = 600, x = g.lane.lane.x[2][i], y = g.lanes.y[2] + g.lane.outline.px, w = g.lane.lane.w[2][i], h = g.lanes.h[2], a = 0, acc = 2},
					{time = 1000, a = g.lane.lane.a}
				}})
			end
		else
			table.insert(parts.destination, {id = "lane-" .. i, loop = 1000,	dst = {
				{time = 600, x = g.lane.lane.x[1][i], y = g.lanes.y[1] + g.lane.outline.px, w = g.lane.lane.w[1][i], h = g.lanes.h[1], a = 0, acc = 2},
				{time = 1000, a = g.lane.lane.a}
			}})
			if is_dp() then
				table.insert(parts.destination, {id = "lane-" .. i, loop = 1000,	dst = {
					{time = 600, x = g.lane.lane.x[2][i], y = g.lanes.y[2] + g.lane.outline.px, w = g.lane.lane.w[2][i], h = g.lanes.h[2], a = 0, acc = 2},
					{time = 1000, a = g.lane.lane.a}
				}})
			end
		end
		if i ~= 1 then
			table.insert(parts.destination, {id = "lane-line", loop = 1000, dst = {
				{time = 400, x = g.lane.line.x[1][i], y = g.lanes.y[1] + g.lane.outline.px, w = g.lane.line.px, h = 0, a = g.lane.line.a, acc = 2},
				{time = 1000, h = g.lanes.h[1] - g.lane.outline.px}
			}})
			if is_dp() then
				table.insert(parts.destination, {id = "lane-line", loop = 1000, dst = {
					{time = 400, x = g.lane.line.x[2][i], y = g.lanes.y[2] + g.lane.outline.px, w = g.lane.line.px, h = 0, a = g.lane.line.a, acc = 2},
					{time = 1000, h = g.lanes.h[2] - g.lane.outline.px}
				}})
			end
		end
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
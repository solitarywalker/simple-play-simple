local parts = {}

local function load(g)
		
	local key = {
		h		= 100,
		y		= {},
		w		= {{}, {}},
		x		= {{}, {}}
	}
	local sc = {
	 x = {},
	 y = {},
	 w = {}
	}
	local lane_x = {{}, {}}
	
	for i1, v1 in ipairs(g.lane.lane.order) do
		for i2, v2 in ipairs(v1) do
			if (v2 % 2) == 1 then
				key.w[i1][v2] = g.lane.lane.w[i1][v2] + (g.lane.line.px * 2)
				key.x[i1][v2] = g.lane.lane.x[i1][v2] - g.lane.line.px
			else
				key.w[i1][v2] = g.lane.lane.w[i1][v2]
				key.x[i1][v2] = g.lane.lane.x[i1][v2]
			end
			lane_x[i1][v2] = g.lane.lane.x[i1][v2]
		end
		key.y[i1] = g.lanes.y[i1] - key.h
		sc.x[i1] = lane_x[i1][#lane_x[i1]]
		sc.w[i1] = g.lane.lane.w[i1][#lane_x[i1]]
		sc.y[i1] = key.y[i1]
		-----------------------------------------------------------
		--if g.lane.lane.order[i1][1] == #lane_x[i1] then
			--sc.x[i1] = sc.x[i1] - (g.lane.lane.w[i1][#lane_x[i1]] / 2)
			--sc.w[i1] = sc.w[i1] + (g.lane.lane.w[i1][#lane_x[i1]] / 2)
		--elseif g.lane.lane.order[i1][#lane_x[i1]] == #lane_x[i1] then
			--sc.w[i1] = sc.w[i1] + (g.lane.lane.w[i1][#lane_x[i1]] / 2)
		--end
		
	end
	
	parts.source = {
		{id = "src-key-w",		path = "../customize/device/*" .. "/W.png"},
		{id = "src-key-b",		path = "../customize/device/*" .. "/B.png"},
		{id = "src-key-wf",		path = "../customize/device/*" .. "/WF.png"},
		{id = "src-key-bf",		path = "../customize/device/*" .. "/BF.png"},
		{id = "src-sc-base",	path = "../customize/device/*" .. "/TABLE_BASE.png"},
		{id = "src-sc-table",	path = "../customize/device/*" .. "/TABLE.png"},
		{id = "src-sc-record",	path = "../customize/device/*" .. "/RECORD.png"}
	}
	
	parts.image = {
		{id = "key-w",		src = "src-key-w",		x = 0, y = 0, w = -1, h = -1},
		{id = "key-b",		src = "src-key-b",		x = 0, y = 0, w = -1, h = -1},
		{id = "key-wf",		src = "src-key-wf",		x = 0, y = 0, w = -1, h = -1},
		{id = "key-bf",		src = "src-key-bf",		x = 0, y = 0, w = -1, h = -1},
		{id = "sc-base",	src = "src-sc-base",	x = 0, y = 0, w = -1, h = -1},
		{id = "sc-table",	src = "src-sc-table",	x = 0, y = 0, w = -1, h = -1},
		{id = "sc-record",	src = "src-sc-record",	x = 0, y = 0, w = -1, h = -1}
	}
	
	local key_types = {}
	local key_timer = {100, 110}
	if		g.type == 0 or g.type == 2	then key_types = {"w", "b", "w", "b", "w", "b", "w", "s"}
	elseif	g.type == 1 or g.type == 3	then key_types = {"w", "b", "w", "b", "w", "s"}
	elseif	g.type == 4					then key_types = {"w", "b", "w", "b", "w", "b", "w", "b", "w"}
	end
	parts.destination = {}
	for i1, v1 in ipairs(g.lane.lane.order) do
		for i2, v2 in ipairs(key_types) do
			if v2 ~= "s" then
				if (i2 % 2) == 1 then
					table.insert(parts.destination, {id = "key-w", filter = 1, loop = 200, dst = {
						{time = 0, x = key.x[i1][i2], y = key.y[i1] - 10, w = key.w[i1][i2], h = key.h},
						{time = 100},
						{time = 200, y = key.y[i1]}
					}})
					table.insert(parts.destination, {id = "key-wf", filter = 1, timer = key_timer[i1] + i2, dst = {
						{x = key.x[i1][i2], y = key.y[i1], w = key.w[i1][i2], h = key.h}
					}})
				else
					table.insert(parts.destination, {id = "key-b", filter = 1, loop = 200, dst = {
						{time = 0, x = key.x[i1][i2], y = key.y[i1] - 10, w = key.w[i1][i2], h = key.h},
						{time = 100},
						{time = 200, y = key.y[i1]}
					}})
					table.insert(parts.destination, {id = "key-bf", filter = 1, timer = key_timer[i1] + i2, dst = {
						{x = key.x[i1][i2], y = key.y[i1], w = key.w[i1][i2], h = key.h}
					}})
				end
			end
		end
		if g.type ~= 4 then
			table.insert(parts.destination, {id = "sc-base", filter = 1, stretch = 4, dst = {
				{x = lane_x[i1][#lane_x[i1]], y = key.y[i1], w = g.lane.lane.w[i1][#g.lane.lane.w[i1]], h = key.h}
			}})
			table.insert(parts.destination, {id = "sc-table", filter = 1, stretch = 4, dst = {
				{x = sc.x[i1], y = sc.y[i1], w = sc.w[i1], h = key.h}
			}})
			table.insert(parts.destination, {id = "sc-record", filter = 1, stretch = 4, offset = i1, dst = {
				{x = sc.x[i1], y = sc.y[i1], w = sc.w[i1], h = key.h}
			}})
		end
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
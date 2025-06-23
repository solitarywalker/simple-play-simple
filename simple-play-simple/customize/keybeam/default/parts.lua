local parts = {}

local function load(g)

	local function draw_def() return false end
	local function draw_mom() return true end
	
	local laser_types = {}
	if		g.type == 0	then laser_types = {1,2,3,4,5,6,7,"s"}
	elseif	g.type == 1	then laser_types = {1,2,3,4,5,"s"}
	elseif	g.type == 4	then laser_types = {1,2,3,4,5,6,7,8,9}
	elseif	g.type == 3	then laser_types = {1,2,3,4,5,"s",5,4,3,2,1,"s"}
	elseif	g.type == 2	then laser_types = {1,2,3,4,5,6,7,"s",7,6,5,4,3,2,1,"s"}
	end
	
	local keybeam_key_on_width	= {{}, {}}
	local keybeam_key_off_width	= {{}, {}}
	for i1, v1 in ipairs(g.lane.lane.w) do
		for i2, v2 in ipairs(v1) do
			keybeam_key_on_width[i1][i2]	= v2 - (g.lane.keybeam.variable_key_on	* 2)
			keybeam_key_off_width[i1][i2]	= v2 - (g.lane.keybeam.variable_key_off	* 2)
		end
	end

	local keybeam_x			= {{}, {}}
	local keybeam_key_on_x	= {{}, {}}
	local keybeam_key_off_x	= {{}, {}}
	do
		for i1, v1 in ipairs(g.lane.lane.order) do
			local x = g.lanes.x[i1] + g.lane.outline.px
			for i2, v2 in ipairs(v1) do
				keybeam_x[i1][v2]			= x
				keybeam_key_on_x[i1][v2]	= x + g.lane.keybeam.variable_key_on
				keybeam_key_off_x[i1][v2]	= x + g.lane.keybeam.variable_key_off
				x							= x + g.lane.lane.w[i1][v2] + g.lane.line.px					
			end
		end
	end
	
	parts.source = {
		{id = "src-laser-w",	path = "../customize/keybeam/*" .. "/w.png"},
		{id = "src-laser-b",	path = "../customize/keybeam/*" .. "/b.png"},
		{id = "src-laser-s",	path = "../customize/keybeam/*" .. "/s.png"}
	}
	
	parts.image = {
		{id = "keybeam-s",		src = "src-laser-s", x = 0, y = 0, w = 16, h = 255},
		{id = "keybeam-s-pg",	src = "src-laser-s", x = 16, y = 0, w = 16, h = 255},
		{id = "keybeam-w",		src = "src-laser-w", x = 0, y = 0, w = 16, h = 255},
		{id = "keybeam-w-pg",	src = "src-laser-w", x = 16, y = 0, w = 16, h = 255},
		{id = "keybeam-b",		src = "src-laser-b", x = 0, y = 0, w = 16, h = 255},
		{id = "keybeam-b-pg",	src = "src-laser-b", x = 16, y = 0, w = 16, h = 255}
	}
	
	parts.imageset = {
		{id = "keybeams1", ref = 500, images = {"keybeam-s","keybeam-s-pg"}},
		{id = "keybeam11", ref = 501, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam21", ref = 502, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam31", ref = 503, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam41", ref = 504, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam51", ref = 505, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam61", ref = 506, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam71", ref = 507, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam81", ref = 508, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam91", ref = 509, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeams2", ref = 510, images = {"keybeam-s","keybeam-s-pg"}},
		{id = "keybeam12", ref = 511, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam22", ref = 512, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam32", ref = 513, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam42", ref = 514, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam52", ref = 515, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam62", ref = 516, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam72", ref = 517, images = {"keybeam-w","keybeam-w-pg"}},
		{id = "keybeam82", ref = 518, images = {"keybeam-b","keybeam-b-pg"}},
		{id = "keybeam92", ref = 519, images = {"keybeam-w","keybeam-w-pg"}}
	}
	
	parts.destination = {}
	for i1 = 1, #g.lanes.x do
		local laser = {
			time1 = 0,
			time2 = g.lane.keybeam.time_key_on,
			time3 = g.lane.keybeam.time_key_off,
			time4 = g.lane.keybeam.time_key_on + g.lane.keybeam.time_key_off,
			y = g.lanes.inside.y[i1]
		}
	
		for i2, v2 in ipairs(laser_types) do
			if i1 == 1 then
				if v2 == "s" then
					table.insert(parts.destination, {id = "keybeams" .. i1, timer = 100, loop = g.lane.keybeam.time_key_on, offset = 3, draw = function() return draw_def() end, dst = {
						{time = laser.time1, x = keybeam_key_on_x[i1][i2],	y = laser.y,				w = keybeam_key_on_width[i1][i2], h = g.lane.keybeam.h, a = 0},
						{time = laser.time2, x = keybeam_x[i1][i2],			w = g.lane.lane.w[i1][i2],	a = g.lane.keybeam.a}
					}})
					table.insert(parts.destination, {id = "keybeams" .. i1, timer = 120, loop = -1, offset = 3, draw = function() return draw_def() end, dst = {
						{time = laser.time1, x = keybeam_x[i1][i2],			y = laser.y,						w = g.lane.lane.w[i1][i2], h = g.lane.keybeam.h, a = g.lane.keybeam.a},
						{time = laser.time3, x = keybeam_key_off_x[i1][i2],	w = keybeam_key_off_width[i1][i2],	a = 0}
					}})
					table.insert(parts.destination, {id = "keybeams" .. i1, timer = 100, loop = -1, offset = 3, draw = function() return draw_mom() end, dst = {
						{time = laser.time1, x = keybeam_key_on_x[i1][i2],	y = laser.y,						w = keybeam_key_on_width[i1][i2], h = g.lane.keybeam.h, a = 0},
						{time = laser.time2, x = keybeam_x[i1][i2],			w = g.lane.lane.w[i1][i2],			a = g.lane.keybeam.a},
						{time = laser.time4, x = keybeam_key_off_x[i1][i2],	w = keybeam_key_off_width[i1][i2],	a = 0}
					}})
				else
					table.insert(parts.destination, {id = "keybeam" .. i2 .. i1, timer = 100 + i2, loop = g.lane.keybeam.time_key_on, offset = 3, dst = {
						{time = laser.time1, x = keybeam_key_on_x[i1][i2],	y = laser.y,				w = keybeam_key_on_width[i1][i2],	h = g.lane.keybeam.h, a = 0},
						{time = laser.time2, x = keybeam_x[i1][i2],			w = g.lane.lane.w[i1][i2],	a = g.lane.keybeam.a}
					}})
					table.insert(parts.destination, {id = "keybeam" .. i2 .. i1, timer = 120 + i2, loop = -1, offset = 3, dst = {
						{time = laser.time1, x = keybeam_x[i1][i2],			y = laser.y,						w = g.lane.lane.w[i1][i2], h = g.lane.keybeam.h, a = g.lane.keybeam.a},
						{time = laser.time3, x = keybeam_key_off_x[i1][i2],	w = keybeam_key_off_width[i1][i2],	a = 0}}
					})
				end
			elseif i1 == 2 then
				if v2 == "s" then
					table.insert(parts.destination, {id = "keybeams" .. i1, timer = 110, loop = g.lane.keybeam.time_key_on, offset = 3, draw = function() return draw_def() end, dst = {
						{time = laser.time1, x = keybeam_key_on_x[i1][i2],	y = laser.y,				w = keybeam_key_on_width[i1][i2], h = g.lane.keybeam.h, a = 0},
						{time = laser.time2, x = keybeam_x[i1][i2],			w = g.lane.lane.w[i1][i2],	a = g.lane.keybeam.a}
					}})
					table.insert(parts.destination, {id = "keybeams" .. i1, timer = 130, loop = -1, offset = 3, draw = function() return draw_def() end, dst = {
						{time = laser.time1, x = keybeam_x[i1][i2],			y = laser.y,						w = g.lane.lane.w[i1][i2], h = g.lane.keybeam.h, a = g.lane.keybeam.a},
						{time = laser.time3, x = keybeam_key_off_x[i1][i2],	w = keybeam_key_off_width[i1][i2],	a = 0}
					}})
					table.insert(parts.destination, {id = "keybeams" .. i1, timer = 110, loop = -1, offset = 3, draw = function() return draw_mom() end, dst = {
						{time = laser.time1, x = keybeam_key_on_x[i1][i2],	y = laser.y,						w = keybeam_key_on_width[i1][i2], h = g.lane.keybeam.h, a = 0},
						{time = laser.time2, x = keybeam_x[i1][i2],			w = g.lane.lane.w[i1][i2],			a = g.lane.keybeam.a},
						{time = laser.time4, x = keybeam_key_off_x[i1][i2],	w = keybeam_key_off_width[i1][i2],	a = 0}
					}})
				else
					table.insert(parts.destination, {id = "keybeam" .. i2 .. i1, timer = 110 + i2, loop = g.lane.keybeam.time_key_on, offset = 3, dst = {
						{time = laser.time1, x = keybeam_key_on_x[i1][i2],	y = laser.y,				w = keybeam_key_on_width[i1][i2],	h = g.lane.keybeam.h, a = 0},
						{time = laser.time2, x = keybeam_x[i1][i2],			w = g.lane.lane.w[i1][i2],	a = g.lane.keybeam.a}
					}})
					table.insert(parts.destination, {id = "keybeam" .. i2 .. i1, timer = 130 + i2, loop = -1, offset = 3, dst = {
						{time = laser.time1, x = keybeam_x[i1][i2],			y = laser.y,						w = g.lane.lane.w[i1][i2], h = g.lane.keybeam.h, a = g.lane.keybeam.a},
						{time = laser.time3, x = keybeam_key_off_x[i1][i2],	w = keybeam_key_off_width[i1][i2],	a = 0}}
					})
				end
			else
				-- 無し
			end
		end
	end
			
	return parts	
	
end

return {
	parts = parts,
	load = load
}
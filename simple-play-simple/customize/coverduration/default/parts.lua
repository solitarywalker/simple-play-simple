local parts = {}

local function load(g)

	local duration			= dofile(skin_config.get_path("../customize/coverduration/*") .. "/duration.lua")

	local duration_width	= duration.DURATION_WIDTH * 10
	local duration_height	= duration.DURATION_HEIGHT

	local cover_white_x		= {}
	local cover_white_y		= {}
	local cover_green_x		= {}
	local cover_yellow_x    = {}
	local lift_num_y		= {}

	parts.source = {
		{id = "src-duration", path = "../customize/coverduration/*" .. "/DURATION.png"},
	}

	parts.value = {
		{id = "lanecover-white",	src = "src-duration", x = 0, y = 0, w = duration_width, h = duration_height, divx = 10, digit = 4, align = 2, ref = 14},
		{id = "liftcover-white",	src = "src-duration", x = 0, y = 0, w = duration_width, h = duration_height, divx = 10, digit = 4, align = 2, ref = 314},
		{id = "duration-green",		src = "src-duration", x = 0, y = duration_height, w = duration_width, h = duration_height, divx = 10, digit = 4, align = 2, ref = 313},
		{id = "duration-yellow",	src = "src-duration", x = 0, y = duration_height, w = duration_width, h = duration_height, divx = 10, digit = 4, align = 2, ref = 312}
	}

	parts.destination = {}

	for i = 1, #g.lanes.x do
		cover_white_x[i]	= g.lanes.center_x[i] - (duration.DURATION_WIDTH * 7)
		cover_white_y[i]	= g.resolution.h + 6
		cover_green_x[i]	= g.lanes.center_x[i] + (duration.DURATION_WIDTH * 3)
		cover_yellow_x[i]	= g.lanes.center_x[i] - (duration.DURATION_WIDTH * 2)
		lift_num_y[i]		= g.lanes.y[i] - duration.DURATION_HEIGHT - 6
		table.insert(parts.destination, {id = "lanecover-white", offset = 4, op = {270}, dst = {
			{x = cover_white_x[i], y = cover_white_y[i], w = duration.DURATION_WIDTH, h = duration.DURATION_HEIGHT}
		}})
		table.insert(parts.destination, {id = "liftcover-white", offset = 3, op = {270,272}, dst = {
			{x = cover_white_x[i], y = lift_num_y[i], w = duration.DURATION_WIDTH, h = duration.DURATION_HEIGHT}
		}})
		table.insert(parts.destination, {id = "duration-green", offset = 4, op = {270}, dst = {
			{x = cover_green_x[i], y = cover_white_y[i], w = duration.DURATION_WIDTH, h = duration.DURATION_HEIGHT}
		}})
		table.insert(parts.destination, {id = "duration-green", offset = 3, op = {270,272}, dst = {
			{x = cover_green_x[i], y = lift_num_y[i], w = duration.DURATION_WIDTH, h = duration.DURATION_HEIGHT}
		}})
		table.insert(parts.destination, {id = "duration-yellow", offset = 4, op = {270}, dst = {
			{x = cover_yellow_x[i], y = cover_white_y[i], w = duration.DURATION_WIDTH, h = duration.DURATION_HEIGHT}
		}})
		table.insert(parts.destination, {id = "duration-yellow", offset = 3, op = {270,272}, dst = {
			{x = cover_yellow_x[i], y = lift_num_y[i], w = duration.DURATION_WIDTH, h = duration.DURATION_HEIGHT}
		}})
	end

	return parts

end

return {
	parts = parts,
	load = load
}

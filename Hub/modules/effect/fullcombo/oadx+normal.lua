local parts = {}

local function load(path, lanes)

	local arrow_y = lanes.y + ((1080 - lanes.y) * 0.083) - (44 * 3)
	local string_y = lanes.y + ((1080 - lanes.y) * 0.458)- (22 * 3)

	parts.source = {{id = "hub-src-oadx+fc", path = path}}
	
	parts.image = {
		{id = "hub-oadx+fc1", src = "hub-src-oadx+fc", x = 5, y = 103, w = 233, h = 321},
		{id = "hub-oadx+fc2", src = "hub-src-oadx+fc", x = 240, y = 401, w = 112, h = 44},
		{id = "hub-oadx+fc3", src = "hub-src-oadx+fc", x = 363, y = 409, w = 136, h = 22},
		{id = "hub-oadx+fc4", src = "hub-src-oadx+fc", x = 363, y = 433, w = 1, h = 1}
	}
	
	parts.destination = {
		{id = "hub-oadx+fc1", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x, y = lanes.y, w = lanes.w, h = 0, a = 255},
			{time = 1000,	h = 315 * 3},
			{time = 1500,	h = 615 * 3, a = 0}
		}},
		{id = "hub-oadx+fc1", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x, y = lanes.y, w = lanes.w, h = 0, a = 255},
			{time = 1000,	h = 115 * 3},
			{time = 1500,	h = 215 * 3, a = 0}
		}},
		{id = "hub-oadx+fc1", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x, y = lanes.y, w = lanes.w, h = 0, a = 255},
			{time = 500,	h = 915 * 3, a = 0}
		}},
		
		{id = "hub-oadx+fc2", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x_center - ((lanes.x_center - lanes.x) * 0.211), y = arrow_y, w = 112 * 3, h = 44 * 3, a = 255},
			{time = 600,	y = 1080 + (44 * 3), a = 0}
		}},
		{id = "hub-oadx+fc2", blend = 2, timer = 48, loop = -1, dst = {
			{time = 150,	x = lanes.x_center - ((lanes.x_center - lanes.x) * 0.703), y = arrow_y, w = 47 * 3, h = 18 * 3, a = 255},
			{time = 750,	y = 1080 + (44 * 3), a = 0}
		}},
		
		{id = "hub-oadx+fc3", blend = 1, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x_center - (136 * 3 / 2), y = string_y, w = 136 * 3, h = 0, a = 255},
			{time = 200,	h = 22 * 3},
			{time = 1200,	h = 22 * 3},
			{time = 1300,	h = 0, a = 0}
		}},
		
		{id = "hub-oadx+fc4", blend = 2, timer = 48, loop = -1, dst = {
			{time = 1200,	x = lanes.x_center - (134 * 3 / 2), y = string_y - 3, w = 134 * 3, h = 17 * 3, a = 255},
			{time = 1300,	h = 1 * 3, y = string_y - 9},
			{time = 1400,	x = lanes.x_center - (194 * 3 / 2), w = 194 * 3},
			{time = 2000,	h = 0, a = 0}
		}}
	}
	
	if is_play_10keys() or is_play_14keys() then
		table.insert(parts.destination, {id = "hub-oadx+fc1", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x2, y = lanes.y, w = lanes.w2, h = 0, a = 255},
			{time = 1000,	h = 315 * 3},
			{time = 1500,	h = 615 * 3, a = 0}
		}})
		table.insert(parts.destination, {id = "hub-oadx+fc1", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x2, y = lanes.y, w = lanes.w2, h = 0, a = 255},
			{time = 1000,	h = 115 * 3},
			{time = 1500,	h = 215 * 3, a = 0}
		}})
		table.insert(parts.destination, {id = "hub-oadx+fc1", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x2, y = lanes.y, w = lanes.w2, h = 0, a = 255},
			{time = 500,	h = 915 * 3, a = 0}
		}})
			
		table.insert(parts.destination, {id = "hub-oadx+fc2", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x_center2 - ((lanes.x_center2 - lanes.x2) * 0.211), y = arrow_y, w = 112 * 3, h = 44 * 3, a = 255},
			{time = 600,	y = 1080 + (44 * 3), a = 0}
		}})
		table.insert(parts.destination, {id = "hub-oadx+fc2", blend = 2, timer = 48, loop = -1, dst = {
			{time = 150,	x = lanes.x_center2 - ((lanes.x_center2 - lanes.x2) * 0.703), y = arrow_y, w = 47 * 3, h = 18 * 3, a = 255},
			{time = 750,	y = 1080 + (44 * 3), a = 0}
		}})
			
		table.insert(parts.destination, {id = "hub-oadx+fc3", blend = 2, timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x_center2 - (136 * 3 / 2), y = string_y, w = 136 * 3, h = 0, a = 255},
			{time = 200,	h = 22 * 3},
			{time = 1200,	h = 22 * 3},
			{time = 1300,	h = 0, a = 0}
		}})
			
		table.insert(parts.destination, {id = "hub-oadx+fc4", blend = 2, timer = 48, loop = -1, dst = {
			{time = 1200,	x = lanes.x_center2 - (134 * 3 / 2), y = string_y - 3, w = 134 * 3, h = 17 * 3, a = 255},
			{time = 1300,	h = 1 * 3, y = string_y - 9},
			{time = 1400,	x = lanes.x_center2 - (194 * 3 / 2), w = 194 * 3},
			{time = 2000,	h = 0, a = 0}
		}})
	end
	
	return parts
end

return {
	parts = parts,
	load = load
}
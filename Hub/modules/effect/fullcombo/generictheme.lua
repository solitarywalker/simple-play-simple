local parts = {}

local function load(path, lanes)
	
	local effect = {
		y = lanes.y,
		w = (lanes.x_center - lanes.x) * 2,
		w2 = (lanes.x_center2 - lanes.x2) * 2,
		h = 1080 - lanes.y,
	}
	effect.circle_size = effect.w * 1.2
	effect.ring_size = 2500
	effect.text_base_x = lanes.x_center - 200
	effect.text_base_x2 = lanes.x_center2 - 200
	effect.text_y = effect.y + 350
	effect.move_x = 300
	effect.color = {
		r = 255,
		g = 255,
		b = 255
	}
	
	parts.source = {
		{id = "hub_src_fullcombo_glow",		path = path[1]},
		{id = "hub_src_fullcombo_circle",	path = path[2]},
		{id = "hub_src_fullcombo_ring",		path = path[3]},
		{id = "hub_src_fullcombo_text",		path = path[4]}
	}
	
	parts.image = {
		{id = "hub_fullcombo_glow",			src = "hub_src_fullcombo_glow",		x = 0, y = 0,	w = -1,		h = -1},
		{id = "hub_fullcombo_circle",		src = "hub_src_fullcombo_circle",	x = 0, y = 0,	w = -1,		h = -1},
		{id = "hub_fullcombo_ring",			src = "hub_src_fullcombo_ring",		x = 0, y = 0,	w = -1,		h = -1},
		{id = "hub_fullcombo_text_full",	src = "hub_src_fullcombo_text",		x = 0, y = 0,	w = 400,	h = 60},
		{id = "hub_fullcombo_text_combo",	src = "hub_src_fullcombo_text",		x = 0, y = 60,	w = 400,	h = 60}
	}
	
	parts.destination = {
		{id = "hub_fullcombo_glow", timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x, y = effect.y, w = effect.w, h = 0, r = effect.color.r, g = effect.color.g, b = effect.color.b},
			{time = 100,	h = effect.h, acc = 2},
			{time = 1000,	x = lanes.x + effect.w / 2 - 10, w = 20, a = 230},
			{time = 1400,	x = lanes.x + effect.w / 2, w = 0, a = 0}
		}},
		{id = "hub_fullcombo_circle", timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x_center, y = effect.y, w = 0, h = 0, acc = 2, r = effect.color.r, g = effect.color.g, b = effect.color.b},
			{time = 250,	x = lanes.x_center - effect.circle_size / 2, y = effect.y - effect.circle_size / 2, w = effect.circle_size, h = effect.circle_size},
			{time = 500,	x = lanes.x_center - effect.circle_size * 1.2 / 2, y = effect.y - effect.circle_size * 1.2 / 2, w = effect.circle_size * 1.2, h = effect.circle_size * 1.2, a = 0}
		}},
		{id = "hub_fullcombo_ring", timer = 48, loop = -1, dst = {
			{time = 0,		x = lanes.x_center, y = effect.y, w = 0, h = 0, acc = 2, r = effect.color.r, g = effect.color.g, b = effect.color.b},
			{time = 600,	x = lanes.x_center - effect.ring_size / 2, y = effect.y - effect.ring_size / 2, w = effect.ring_size, h = effect.ring_size, a = 0}
		}},
		{id = "hub_fullcombo_text_full", timer = 48, loop = -1, filter = 1, dst = {
			{time = 0,		x = effect.text_base_x - effect.move_x, y = effect.text_y + 60, w = 400, h = 60, a = 0},
			{time = 500},
			{time = 800,	x = effect.text_base_x - 10, a = 255},
			{time = 1800,	x = effect.text_base_x + 10},
			{time = 2100,	x = effect.text_base_x + effect.move_x, a = 0}
		}},
		{id = "hub_fullcombo_text_combo", timer = 48, loop = -1, filter = 1, dst = {
			{time = 0,		x = effect.text_base_x + effect.move_x, y = effect.text_y, w = 400, h = 60, a = 0},
			{time = 500},
			{time = 800,	x = effect.text_base_x + 10, a = 255},
			{time = 1800,	x = effect.text_base_x - 10},
			{time = 2100,	x = effect.text_base_x - effect.move_x, a = 0}
		}},
	}
	
	if is_play_10keys() or is_play_14keys() then
	
		table.insert(parts.destination,
			{id = "hub_fullcombo_glow", timer = 48, loop = -1, dst = {
				{time = 0,		x = lanes.x2, y = effect.y, w = effect.w, h = 0, r = effect.color.r, g = effect.color.g, b = effect.color.b},
				{time = 100,	h = effect.h, acc = 2},
				{time = 1000,	x = lanes.x2 + effect.w / 2 - 10, w = 20, a = 230},
				{time = 1400,	x = lanes.x2 + effect.w / 2, w = 0, a = 0}
			}}
		)
		table.insert(parts.destination,
			{id = "hub_fullcombo_circle", timer = 48, loop = -1, dst = {
				{time = 0,		x = lanes.x_center2, y = effect.y, w = 0, h = 0, acc = 2, r = effect.color.r, g = effect.color.g, b = effect.color.b},
				{time = 250,	x = lanes.x_center2 - effect.circle_size / 2, y = effect.y - effect.circle_size / 2, w = effect.circle_size, h = effect.circle_size},
				{time = 500,	x = lanes.x_center2 - effect.circle_size * 1.2 / 2, y = effect.y - effect.circle_size * 1.2 / 2, w = effect.circle_size * 1.2, h = effect.circle_size * 1.2, a = 0}
			}}
		)
		table.insert(parts.destination,
			{id = "hub_fullcombo_ring", timer = 48, loop = -1, dst = {
				{time = 0,		x = lanes.x_center2, y = effect.y, w = 0, h = 0, acc = 2, r = effect.color.r, g = effect.color.g, b = effect.color.b},
				{time = 600,	x = lanes.x_center2 - effect.ring_size / 2, y = effect.y - effect.ring_size / 2, w = effect.ring_size, h = effect.ring_size, a = 0}
			}}
		)
		table.insert(parts.destination,
			{id = "hub_fullcombo_text_full", timer = 48, loop = -1, filter = 1, dst = {
				{time = 0,		x = effect.text_base_x2 - effect.move_x, y = effect.text_y + 60, w = 400, h = 60, a = 0},
				{time = 500},
				{time = 800,	x = effect.text_base_x2 - 10, a = 255},
				{time = 1800,	x = effect.text_base_x2 + 10},
				{time = 2100,	x = effect.text_base_x2 + effect.move_x, a = 0}
			}}
		)
		table.insert(parts.destination,
			{id = "hub_fullcombo_text_combo", timer = 48, loop = -1, filter = 1, dst = {
				{time = 0,		x = effect.text_base_x2 + effect.move_x, y = effect.text_y, w = 400, h = 60, a = 0},
				{time = 500},
				{time = 800,	x = effect.text_base_x2 + 10, a = 255},
				{time = 1800,	x = effect.text_base_x2 - 10},
				{time = 2100,	x = effect.text_base_x2 - effect.move_x, a = 0}
			}}
		)
	
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
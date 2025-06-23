local parts = {}

local function load(path, lanes)

	parts.source = {
		{id = "hub-mcfullcombo", path = path[1]},
		{id = "hub-mcsystem-sp", path = path[2]},
		{id = "hub-mcsystem-dp", path = path[3]}
	}
	
	parts.image = {
		-- フルコン
		{id = "hub-mc-fc", src = "hub-mcfullcombo", x = 0, y = 0, w = 5190, h = 2571, divx = 10, divy = 3, cycle = 1500, timer = 48},
		-- FULL
		{id = "hub-mc-wd_full1", src = "hub-mcsystem-sp", x = 1200, y = 1050, w = 400, h = 90},
		{id = "hub-mc-wd_full2", src = "hub-mcsystem-dp", x = 1100, y = 460, w = 400, h = 90},
		-- COMBO
		{id = "hub-mc-wd_combo1", src = "hub-mcsystem-sp", x = 1200, y = 1140, w = 400, h = 90},
		{id = "hub-mc-wd_combo2", src = "hub-mcsystem-dp", x = 1100, y = 550, w = 400, h = 90}
	}
	local dst_x = {
		fc	= lanes.x_center - (519 / 2),
		st1	= lanes.x_center + (519 / 2) + 519,
		st2	= lanes.x_center - 160,
		st3	= lanes.x_center - (519 / 2) - 519
	}
	local dst_x2 = {
		fc	= lanes.x_center2 - (519 / 2),
		st1	= lanes.x_center2 + (519 / 2) + 519,
		st2	= lanes.x_center2 - 160,
		st3	= lanes.x_center2 - (519 / 2) - 519
	}

	if is_play_5keys() or is_play_7keys() then
		parts.destination = {
			-- フルコン演出
			{id = "hub-mc-fc", loop = -1, timer = 48, blend = 2, dst = {
				{time = 0, x = dst_x.fc, y = lanes.y, w = 519, h = 857},
				{time = 1000},
				{time = 1500, a = 0}
			}},
			{id = "hub-mc-wd_full1", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500, x = dst_x.st1, y = lanes.y + 230, w = 400, h = 90, a = 0},
				{time = 600, x = dst_x.st2, a = 255},
				{time = 1900, x = dst_x.fc},
				{time = 2000, x = dst_x.st3, a = 0}
			}},
			{id = "hub-mc-wd_combo1", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500, x = dst_x.st3, y = lanes.y + 150, w = 400, h = 90, a = 0},
				{time = 600, x = dst_x.fc, a = 255},
				{time = 1900, x = dst_x.st2},
				{time = 2000, x = dst_x.st1, a = 0}
			}}
		}
	elseif is_play_10keys() or is_play_14keys() then
		parts.destination = {
			-- フルコン演出
			{id = "hub-mc-fc", loop = -1, timer = 48, blend = 2, dst = {
				{time = 0, x = dst_x.fc, y = lanes.y, w = 519, h = 857},
				{time = 1000},
				{time = 1500, a = 0}
			}},
			{id = "hub-mc-fc", loop = -1, timer = 48, blend = 2, dst = {
				{time = 0, x = dst_x2.fc, y = lanes.y, w = 519, h = 857},
				{time = 1000},
				{time = 1500, a = 0}
			}},
			
			{id = "hub-mc-wd_full2", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500, x = dst_x.st1, y = lanes.y + 230, w = 400, h = 90, a = 0},
				{time = 600, x = dst_x.st2, a = 255},
				{time = 1900, x = dst_x.fc},
				{time = 2000, x = dst_x.st3, a = 0}
			}},
			{id = "hub-mc-wd_full2", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500, x = dst_x2.st1, y = lanes.y + 230, w = 400, h = 90, a = 0},
				{time = 600, x = dst_x2.st2, a = 255},
				{time = 1900, x = dst_x2.fc},
				{time = 2000, x = dst_x2.st3, a = 0}
			}},
			
			{id = "hub-mc-wd_combo2", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500, x = dst_x.st3, y = lanes.y + 150, w = 400, h = 90, a = 0},
				{time = 600, x = dst_x.fc, a = 255},
				{time = 1900, x = dst_x.st2},
				{time = 2000, x = dst_x.st1, a = 0}
			}},
			{id = "hub-mc-wd_combo2", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500, x = dst_x2.st3, y = lanes.y + 150, w = 400, h = 90, a = 0},
				{time = 600, x = dst_x2.fc, a = 255},
				{time = 1900, x = dst_x2.st2},
				{time = 2000, x = dst_x2.st1, a = 0}
			}},
		}
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
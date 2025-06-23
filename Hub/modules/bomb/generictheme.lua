local main_state = require("main_state")
local parts = {}

local function load(file_path, lane, lanes, offset, bomb_offset)
	
	local bomb = {
		w = 300 + (3 * bomb_offset.x),
		h = 300 + (3 * bomb_offset.x),
		x = {},
		y = {},
		divx = 4,
		divy = 4
	}
	
	local img_path = skin_config.get_path(file_path)
	local lua_path = string.sub(img_path, 1, (string.len(img_path) - 4)) .. ".lua"
	
	local status, settings = pcall(function() return dofile(lua_path) end)
	if status and settings then
		bomb.w_src = settings.w
		bomb.h_src = settings.h
		bomb.w = (settings.w / 2) + (((settings.w / 2) / 100) * bomb_offset.x)
		bomb.h = (settings.h / 2) + (((settings.h / 2) / 100) * bomb_offset.x)
		bomb.divx = settings.divx
		bomb.divy = settings.divy
	end
	
	
	for i, v in pairs(lane.x_center) do
		bomb.x[i] = v - (bomb.w / 2)
	end
	
	for i = 1, #lane.y do
		bomb.y[i] = lanes.y - (bomb.h / 2) + offset
	end
	
	parts.source = {
		{id = "hub-src-bomb", path = file_path}
	}
	parts.image = {
		{id = "hub-bomb", src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1}
	}
	parts.imageset = {}
	parts.destination = {
		{id = "hub-bomb", dst = {{x = 0, y = 0, w = 1, h = 1}}}
	}
	
	local flg = true
	local function draw_flg()
		if		main_state.timer(2) ~= main_state.timer_off_value
		or		main_state.timer(3) ~= main_state.timer_off_value
		then	flg = false
		end
		return flg
	end
	
	do
		local init = {}
		if		is_play_5keys() or is_play_10keys()	then init = {"w", "b", "w", "b", "w", "s"}
		elseif	is_play_7keys() or is_play_14keys() then init = {"w", "b", "w", "b", "w", "b", "w", "s"}
		elseif	is_play_9keys() then init = {"w", "b", "w", "b", "w", "b", "w", "b", "w"}
		end
		local c = #init
		if bomb.divx == 16 and bomb.divy >= 3 then
			for i, v in ipairs(init) do
				if v == "s" then
					table.insert(parts.image, {id = "hub-bomb" .. v,		src = "hub-src-bomb", x = 0, y = 0,					w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 50, cycle = 251})
					table.insert(parts.image, {id = "hub-fastbomb" .. v,	src = "hub-src-bomb", x = 0, y = bomb.h_src * 2,	w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 50, cycle = 251})
					table.insert(parts.image, {id = "hub-slowbomb" .. v,	src = "hub-src-bomb", x = 0, y = bomb.h_src,		w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 50, cycle = 251})
					table.insert(parts.image, {id = "hub-hold" .. v,		src = "hub-src-bomb", x = 0, y = 0,					w = bomb.w_src * 8,	h = bomb.h_src, divx = 8,			timer = 70, cycle = 160})
					table.insert(parts.imageset, {id = "hub-bombset" .. v,	ref = 500, images = {"hub-bomb" .. v,	"hub-bomb" .. v,  "hub-fastbomb" .. v,  "hub-slowbomb" .. v}})
					table.insert(parts.destination, {id = "hub-bombset" .. v,	timer = 50, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold" .. v,		timer = 70, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
				else
					table.insert(parts.image, {id = "hub-bomb" .. i,		src = "hub-src-bomb", x = 0, y = 0,					w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 50 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-fastbomb" .. i,	src = "hub-src-bomb", x = 0, y = bomb.h_src * 2,	w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 50 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-slowbomb" .. i,	src = "hub-src-bomb", x = 0, y = bomb.h_src,		w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 50 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-hold" .. i,		src = "hub-src-bomb", x = 0, y = 0,					w = bomb.w_src * 8,	h = bomb.h_src, divx = 8,			timer = 70 + i, cycle = 160})
					table.insert(parts.imageset, {id = "hub-bombset" .. i,	ref = 500 + i, images = {"hub-bomb" .. i,  "hub-bomb" .. i,  "hub-fastbomb" .. i,  "hub-slowbomb" .. i}})
					table.insert(parts.destination, {id = "hub-bombset" .. i,	timer = 50 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold" .. i,		timer = 70 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
				end
			end
			for i, v in ipairs(init) do
				if v == "s" then
					table.insert(parts.image, {id = "hub-bomb2" .. v,		src = "hub-src-bomb", x = 0, y = 0,					w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 60, cycle = 251})
					table.insert(parts.image, {id = "hub-fastbomb2" .. v,	src = "hub-src-bomb", x = 0, y = bomb.h_src * 2,	w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 60, cycle = 251})
					table.insert(parts.image, {id = "hub-slowbomb2" .. v,	src = "hub-src-bomb", x = 0, y = bomb.h_src,		w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 60, cycle = 251})
					table.insert(parts.image, {id = "hub-hold2" .. v,		src = "hub-src-bomb", x = 0, y = 0,					w = bomb.w_src * 8,	h = bomb.h_src, divx = 8,			timer = 80, cycle = 160})
					table.insert(parts.imageset, {id = "hub-bombset2" .. v,	ref = 510, images = {"hub-bomb2" .. v,	"hub-bomb2" .. v, "hub-fastbomb2" .. v, "hub-slowbomb2" .. v}})
					table.insert(parts.destination, {id = "hub-bombset2" .. v,	timer = 60, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold2" .. v,		timer = 80, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
				else
					table.insert(parts.image, {id = "hub-bomb2" .. i,		src = "hub-src-bomb", x = 0, y = 0,					w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 60 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-fastbomb2" .. i,	src = "hub-src-bomb", x = 0, y = bomb.h_src * 2,	w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 60 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-slowbomb2" .. i,	src = "hub-src-bomb", x = 0, y = bomb.h_src,		w = -1,				h = bomb.h_src, divx = bomb.divx,	timer = 60 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-hold2" .. i,		src = "hub-src-bomb", x = 0, y = 0,					w = bomb.w_src * 8,	h = bomb.h_src, divx = 8,			timer = 80 + i, cycle = 160})
					table.insert(parts.imageset, {id = "hub-bombset2" .. i,	ref = 510 + i, images = {"hub-bomb2" .. i, "hub-bomb2" .. i, "hub-fastbomb2" .. i, "hub-slowbomb2" .. i}})
					table.insert(parts.destination, {id = "hub-bombset2" .. i,	timer = 60 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold2" .. i,		timer = 80 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
				end
			end
		else
			for i, v in ipairs(init) do
				if v == "s" then
					table.insert(parts.image, {id = "hub-bombset" .. v,		src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 50, cycle = 251})
					table.insert(parts.image, {id = "hub-hold" .. v,		src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 70, cycle = 160})
					table.insert(parts.destination, {id = "hub-bombset" .. v,	timer = 50, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold" .. v,		timer = 70, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
				else
					table.insert(parts.image, {id = "hub-bombset" .. i,		src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 50 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-hold" .. i,		src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 70 + i, cycle = 160})
					table.insert(parts.destination, {id = "hub-bombset" .. i,	timer = 50 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold" .. i,		timer = 70 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
				end
			end
			for i, v in ipairs(init) do
				if v == "s" then
					table.insert(parts.image, {id = "hub-bombset2" .. v,	src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 60, cycle = 251})
					table.insert(parts.image, {id = "hub-hold2" .. v,		src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 80, cycle = 160})
					table.insert(parts.destination, {id = "hub-bombset2" .. v,	timer = 60, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold2" .. v,		timer = 80, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
				else
					table.insert(parts.image, {id = "hub-bombset2" .. i,	src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 60 + i, cycle = 251})
					table.insert(parts.image, {id = "hub-hold2" .. i,		src = "hub-src-bomb", x = 0, y = 0, w = -1, h = -1, divx = bomb.divx, divy = bomb.divy, timer = 80 + i, cycle = 160})
					table.insert(parts.destination, {id = "hub-bombset2" .. i,	timer = 60 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hub-hold2" .. i,		timer = 80 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
				end
			end
		end
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
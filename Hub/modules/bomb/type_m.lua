local main_state = require("main_state")
local parts = {}

local function load(file_path, lane, lanes, offset, bomb_offset)

	local bomb = {
		w = 300 + (3 * bomb_offset.x),
		h = 300 + (3 * bomb_offset.x),
		x = {},
		y = {}
	}
	
	for i, v in pairs(lane.x_center) do
		bomb.x[i] = v - (bomb.w / 2)
	end
	
	for i = 1, #lane.y do
		bomb.y[i] = lanes.y - (bomb.h / 2) + offset
	end
	
	parts.source = {
		{id = "hub-src-tmbomb", path = file_path}
	}
	parts.image = {
		{id = "hub-bomb", src = "hub-src-tmbomb", x = 0, y = 0, w = -1, h = -1}
	}
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
	
	local init = {}
	if		is_play_5keys() or is_play_10keys()	then init = {"w", "b", "w", "b", "w", "s"}
	elseif	is_play_7keys() or is_play_14keys() then init = {"w", "b", "w", "b", "w", "b", "w", "s"}
	elseif	is_play_9keys() then init = {"w", "b", "w", "b", "w", "b", "w", "b", "w"}
	end
	local c = #init
	for i, v in ipairs(init) do
		if v == "s" then
			table.insert(parts.image, {id = "hub-bombset" .. v,		src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 50, cycle = 301})
			table.insert(parts.image, {id = "hub-hold" .. v,		src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 70, cycle = 200})
			table.insert(parts.destination, {id = "hub-bombset" .. v,	timer = 50, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 300}}})
			table.insert(parts.destination, {id = "hub-hold" .. v,		timer = 70, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
		else
			table.insert(parts.image, {id = "hub-bombset" .. i,		src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 50 + i, cycle = 301})
			table.insert(parts.image, {id = "hub-hold" .. i,		src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 70 + i, cycle = 200})
			table.insert(parts.destination, {id = "hub-bombset" .. i,	timer = 50 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 300}}})
			table.insert(parts.destination, {id = "hub-hold" .. i,		timer = 70 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
		end
	end
	for i, v in ipairs(init) do
		if v == "s" then
			table.insert(parts.image, {id = "hub-bombset2" .. v,	src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 60, cycle = 301})
			table.insert(parts.image, {id = "hub-hold2" .. v,		src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 80, cycle = 200})
			table.insert(parts.destination, {id = "hub-bombset2" .. v,	timer = 60, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 300}}})
			table.insert(parts.destination, {id = "hub-hold2" .. v,		timer = 80, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
		else
			table.insert(parts.image, {id = "hub-bombset2" .. i,	src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 60 + i, cycle = 301})
			table.insert(parts.image, {id = "hub-hold2" .. i,		src = "hub-src-tmbomb", x = 0, y = 0, w = 6000, h = 300, divx = 20, timer = 80 + i, cycle = 200})
			table.insert(parts.destination, {id = "hub-bombset2" .. i,	timer = 60 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 300}}})
			table.insert(parts.destination, {id = "hub-hold2" .. i,		timer = 80 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
		end
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
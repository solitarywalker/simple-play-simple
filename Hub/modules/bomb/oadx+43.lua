local main_state = require("main_state")
local parts = {}

local function load(file_path, lane, lanes, offset, bomb_offset)

	local bomb = {
		w = (181 * 3) + (((181 * 3) / 100) * bomb_offset.x),
		h = (192 * 3) + (((192 * 3) / 100) * bomb_offset.x),
		x = {},
		y = {}
	}
	
	for i, v in pairs(lane.x_center) do
		bomb.x[i] = v - (bomb.w / 2) + (bomb.w / 100 * 6.35359116022099)
	end
	
	for i = 1, #lane.y do
		bomb.y[i] = lanes.y - (bomb.h / 2) -  (bomb.h / 100 * 7.29166666666667) + offset
	end
	
	parts.source = {
		{id = "hub-src-oadx+169bomb", path = file_path}
	}
	parts.image = {
		{id = "hub-bomb", src = "hub-src-oadx+169bomb", x = 0, y = 0, w = -1, h = -1}
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
	
	local init = {}
	if		is_play_5keys() or is_play_10keys()	then init = {"w", "b", "w", "b", "w", "s"}
	elseif	is_play_7keys() or is_play_14keys() then init = {"w", "b", "w", "b", "w", "b", "w", "s"}
	elseif	is_play_9keys() then init = {"w", "b", "w", "b", "w", "b", "w", "b", "w"}
	end
	local c = #init
	for i, v in ipairs(init) do
		if v == "s" then
			table.insert(parts.image,		{id = "hub-bomb" .. v,	src = "hub-src-oadx+169bomb", x = 0, y = 0,		w = 2896, h = 192, divx = 16, timer = 50, cycle = 251})
			table.insert(parts.image,		{id = "hub-hold" .. v,	src = "hub-src-oadx+169bomb", x = 0, y = 576,	w = 1448, h = 192, divx = 8,  timer = 70, cycle = 160})
			table.insert(parts.destination,	{id = "hub-bomb" .. v,	timer = 50, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
			table.insert(parts.destination,	{id = "hub-hold" .. v,	timer = 70, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
		elseif v == "w" then
			table.insert(parts.image,		{id = "hub-bomb" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 0,		w = 2896, h = 192, divx = 16, timer = 50 + i, cycle = 251})
			table.insert(parts.image,		{id = "hub-hold" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 192,	w = 1448, h = 192, divx = 8,  timer = 70 + i, cycle = 160})
			table.insert(parts.destination,	{id = "hub-bomb" .. i,	timer = 50 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
			table.insert(parts.destination,	{id = "hub-hold" .. i,	timer = 70 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
		elseif v == "b" then
			table.insert(parts.image,		{id = "hub-bomb" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 0,		w = 2896, h = 192, divx = 16, timer = 50 + i, cycle = 251})
			table.insert(parts.image,		{id = "hub-hold" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 384,	w = 1448, h = 192, divx = 8,  timer = 70 + i, cycle = 160})
			table.insert(parts.destination,	{id = "hub-bomb" .. i,	timer = 50 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h},{time = 250}}})
			table.insert(parts.destination,	{id = "hub-hold" .. i,	timer = 70 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i], y = bomb.y[i], w = bomb.w, h = bomb.h}}})
		end
	end
	if is_play_10keys() or is_play_14keys()	then
		for i, v in ipairs(init) do
			if v == "s" then
				table.insert(parts.image,		{id = "hub-bomb2" .. v,	src = "hub-src-oadx+169bomb", x = 0, y = 0,		w = 2896, h = 192, divx = 16, timer = 60, cycle = 251})
				table.insert(parts.image,		{id = "hub-hold2" .. v,	src = "hub-src-oadx+169bomb", x = 0, y = 576,	w = 1448, h = 192, divx = 8,  timer = 80, cycle = 160})
				table.insert(parts.destination,	{id = "hub-bomb2" .. v,	timer = 60, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination,	{id = "hub-hold2" .. v,	timer = 80, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
			elseif v == "w" then
				table.insert(parts.image,		{id = "hub-bomb2" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 0,		w = 2896, h = 192, divx = 16, timer = 60 + i, cycle = 251})
				table.insert(parts.image,		{id = "hub-hold2" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 192,	w = 1448, h = 192, divx = 8,  timer = 80 + i, cycle = 160})
				table.insert(parts.destination,	{id = "hub-bomb2" .. i,	timer = 60 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination,	{id = "hub-hold2" .. i,	timer = 80 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
			elseif v == "b" then
				table.insert(parts.image,		{id = "hub-bomb2" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 0,		w = 2896, h = 192, divx = 16, timer = 60 + i, cycle = 251})
				table.insert(parts.image,		{id = "hub-hold2" .. i,	src = "hub-src-oadx+169bomb", x = 0, y = 384,	w = 1448, h = 192, divx = 8,  timer = 80 + i, cycle = 160})
				table.insert(parts.destination,	{id = "hub-bomb2" .. i,	timer = 60 + i, draw = function() return draw_flg() end, filter = 1, loop = -1,	blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination,	{id = "hub-hold2" .. i,	timer = 80 + i, draw = function() return draw_flg() end, filter = 1,			blend = 2, offset = 3, dst = {{time = 0, x = bomb.x[i + c], y = bomb.y[i + c], w = bomb.w, h = bomb.h}}})
			end
		end
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
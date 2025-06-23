local parts = {}
local main_state = require("main_state")

local function load(g)

	local settings = dofile(skin_config.get_path("../customize/judgedetail/*") .. "/judgedetail.lua")
	
	local function flag_fs(num)
		if main_state.timer(70 + num) == main_state.timer_off_value then
			return true
		else
			return false
		end
	end
	
	local judgedetail = {
		x = {},
		y = {},
		w = settings.JUDGE_DETAIL_WIDTH * 4,
		nw = settings.JUDGE_DETAIL_WIDTH * 12,
		h = settings.JUDGE_DETAIL_HEIGHT
	}
	
	for i = 1, #g.lanes.x do
		judgedetail.x[i] = g.lanes.judgedetail.x[i] - (judgedetail.w / 2)
		judgedetail.y[i] = g.lanes.judgedetail.y[i]
	end
	
	parts.source = {
		{id = "src-judgedetail",	path = "../customize/judgedetail/*" .. "/JUDGEDETAIL.png"},
	}
	
	parts.image = {
		{id = "judge-fast", src = "src-judgedetail", x = 0, y = judgedetail.h * 2, w = judgedetail.w, h = judgedetail.h},
		{id = "judge-slow", src = "src-judgedetail", x = 0, y = judgedetail.h * 3, w = judgedetail.w, h = judgedetail.h},
		{id = "judge-dummy", src = "src-judgedetail", x = judgedetail.w, y = judgedetail.h * 3, w = 1, h = 1}
	}
	parts.imageset = {}
	
	
	parts.destination = {}
	
	if g.type == 4 then 
		for i = 1, 9 do
			local fsx = g.lane.center_x[1][i] - (judgedetail.w / 2)
			local fsy = judgedetail.y[1] + 48
			local fsw = judgedetail.w
			local fsh = judgedetail.h
			table.insert(parts.imageset,	{id = "fs" .. i, ref = 500 + i, images = {"judge-dummy", "judge-dummy", "judge-fast", "judge-slow", "judge-fast", "judge-slow", "judge-fast", "judge-slow", "judge-fast", "judge-slow", "judge-fast", "judge-slow"}})
			table.insert(parts.destination, {id = "fs" .. i, timer = 100 + i, loop = 10, offset = 3, draw = function() return flag_fs(i) end, dst = {{time = 0, x = fsx, y = fsy, w = fsw, h = fsh, acc = 2},{time = 10}}})
			table.insert(parts.destination, {id = "fs" .. i, timer = 120 + i, loop = -1, offset = 3, draw = function() return flag_fs(i) end, dst = {{time = 0, x = fsx, y = fsy, w = fsw, h = fsh, a = 255, acc = 2},{time = 100},{time = 110, a = 0}}})
		end
	elseif g.type == 2 or g.type == 3 then
		parts.destination = {
			{id = "judge-fast", loop = -1, timer = 46, op = {1242}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1], y = judgedetail.y[1], w = judgedetail.w, h = judgedetail.h},{time = 500}}},
			{id = "judge-fast", loop = -1, timer = 47, op = {1262}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[2], y = judgedetail.y[2], w = judgedetail.w, h = judgedetail.h},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 46, op = {1243}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1], y = judgedetail.y[1], w = judgedetail.w, h = judgedetail.h},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 47, op = {1263}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[2], y = judgedetail.y[2], w = judgedetail.w, h = judgedetail.h},{time = 500}}},
		}
	else
		parts.destination = {
			{id = "judge-fast", loop = -1, timer = 46, op = {1242}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1], y = judgedetail.y[1], w = judgedetail.w, h = judgedetail.h},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 46, op = {1243}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1], y = judgedetail.y[1], w = judgedetail.w, h = judgedetail.h},{time = 500}}},
		}
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
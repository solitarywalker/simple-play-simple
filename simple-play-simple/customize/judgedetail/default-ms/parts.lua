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
	
	---[[
	parts.value = {
		{id = "judgedetail-ms1", src = "src-judgedetail", x = 0, y = 0, w = judgedetail.nw, h = judgedetail.h * 2, divx = 12, divy = 2, digit = 4, align = 2, ref = 525},
		{id = "judgedetail-ms2", src = "src-judgedetail", x = 0, y = 0, w = judgedetail.nw, h = judgedetail.h * 2, divx = 12, divy = 2, digit = 4, align = 2, ref = 526},
		{id = "judgedetail-ms3", src = "src-judgedetail", x = 0, y = 0, w = judgedetail.nw, h = judgedetail.h * 2, divx = 12, divy = 2, digit = 4, align = 2, ref = 527}
	}
	--]]
	
	parts.destination = {}
	
	if g.type == 4 then 
		local offset = g.lanes.inside.w[1] / 3
		table.insert(parts.destination, {id = "judgedetail-ms1", loop = -1, timer = 46,  offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1] - offset,	y = judgedetail.y[1], w = settings.JUDGE_DETAIL_WIDTH, h = settings.JUDGE_DETAIL_HEIGHT},{time = 500}}})
		table.insert(parts.destination, {id = "judgedetail-ms2", loop = -1, timer = 47,  offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1],			y = judgedetail.y[1], w = settings.JUDGE_DETAIL_WIDTH, h = settings.JUDGE_DETAIL_HEIGHT},{time = 500}}})
		table.insert(parts.destination, {id = "judgedetail-ms3", loop = -1, timer = 247, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1] + offset,	y = judgedetail.y[1], w = settings.JUDGE_DETAIL_WIDTH, h = settings.JUDGE_DETAIL_HEIGHT},{time = 500}}})
	elseif g.type == 2 or g.type == 3 then
		parts.destination = {
			{id = "judgedetail-ms1", loop = -1, timer = 46, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[1], y = judgedetail.y[1], w = settings.JUDGE_DETAIL_WIDTH, h = settings.JUDGE_DETAIL_HEIGHT},{time = 500}}},
			{id = "judgedetail-ms2", loop = -1, timer = 47, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail.x[2], y = judgedetail.y[2], w = settings.JUDGE_DETAIL_WIDTH, h = settings.JUDGE_DETAIL_HEIGHT},{time = 500}}},
		}
	else
		parts.destination = {
			{id = "judgedetail-ms1", loop = -1, timer = 46, offsets = {3,32,33},	dst = {{time = 0, x = judgedetail.x[1], y = judgedetail.y[1], w = settings.JUDGE_DETAIL_WIDTH, h = settings.JUDGE_DETAIL_HEIGHT},{time = 500}}},
		}
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
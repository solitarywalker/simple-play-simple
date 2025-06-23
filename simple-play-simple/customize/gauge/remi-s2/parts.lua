local parts = {}
local main_state = require("main_state")

local function load(t)

	local gauge_num = main_state.number(107)
	local v = 0

	parts.source = {
		{id = "src-gauge",			path = "../customize/gauge/remi-s2/gauge.png"},
		{id = "src-number-gauge",	path = "../customize/gauge/remi-s2/num.png"}
	}
	
	parts.image = {
		{id = "gauge-r1",	src = "src-gauge",			x = 0,   y = 0,  w = 11, h = 34},
		{id = "gauge-r2",	src = "src-gauge",			x = 24,  y = 0,  w = 11, h = 34},
		{id = "gauge-b1",	src = "src-gauge",			x = 12,  y = 0,  w = 11, h = 34},
		{id = "gauge-b2",	src = "src-gauge",			x = 36,  y = 0,  w = 11, h = 34},
		{id = "gauge-y1",	src = "src-gauge",			x = 0,   y = 34, w = 11, h = 34},
		{id = "gauge-y2",	src = "src-gauge",			x = 24,  y = 34, w = 11, h = 34},
		{id = "gauge-p1",	src = "src-gauge",			x = 12,  y = 34, w = 11, h = 34},
		{id = "gauge-p2",	src = "src-gauge",			x = 36,  y = 34, w = 11, h = 34},
		{id = "gauge-w1",	src = "src-gauge",			x = 0,   y = 68, w = 11, h = 34},
		{id = "gauge-w2",	src = "src-gauge",			x = 24,  y = 68, w = 11, h = 34},
		{id = "gauge-g1",	src = "src-gauge",			x = 12,  y = 68, w = 11, h = 34},
		{id = "gauge-g2",	src = "src-gauge",			x = 36,  y = 68, w = 11, h = 34},
		{id = "par-gauge",	src = "src-number-gauge",	x = 260, y = 0,  w = 16, h = 38}
	}
	
	parts.value = {{id = "groovegauge", src = "src-number-gauge", x = 0, y = 0, w = 260, h = 38, divx = 10, digit = 3, value = function()
		v = main_state.number(107)
		if v % 2 == 0 then
			gauge_num = v
		elseif v == 1 then
			gauge_num = 2
		else
			gauge_num = v - 1
		end
		return gauge_num
	end
	}}
	
	parts.gauge = {
		id = "gauge",
		nodes = {
			"gauge-r1", "gauge-p1", "gauge-r2", "gauge-p2", "gauge-r1", "gauge-p1",	-- アシストイージー
			"gauge-r1", "gauge-g1", "gauge-r2", "gauge-g2", "gauge-r1", "gauge-g1",	-- イージー
			"gauge-r1", "gauge-b1", "gauge-r2", "gauge-b2", "gauge-r1", "gauge-b1",	-- ノーマル
			"gauge-r1", "gauge-r1", "gauge-r2", "gauge-r2", "gauge-r1", "gauge-p1",	-- ハード
			"gauge-y1", "gauge-y1", "gauge-y2", "gauge-y2", "gauge-y1", "gauge-y1",	-- EXハード
			"gauge-w1", "gauge-w1", "gauge-w2", "gauge-w2", "gauge-w1", "gauge-w1"	-- ハザード
		},
		parts = t.frame.gauge.scale
	}
	
	parts.destination = {
		{id = "gauge",			dst = {{x = t.frame.gauge.x,			y = t.frame.gauge.y,		w = t.frame.gauge.w, h = t.frame.gauge.h}}},
		{id = "par-gauge",		dst = {{x = t.frame.gauge.num_x + 78,	y = t.frame.gauge.num_y,	w = 16, h = 38}}},
		{id = "groovegauge",	dst = {{x = t.frame.gauge.num_x,		y = t.frame.gauge.num_y,	w = 26, h = 38}}}
	}	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
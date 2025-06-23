local parts = {}

local function load(g)	

	parts.source = {
		{id = "src-gauge",				path = "../customize/gauge/*" .. "/gauge.png"},
		{id = "src-number-gauge",		path = "../customize/gauge/*" .. "/num.png"}
	}
	
	parts.image = {
		{id = "gauge-n1",		src = "src-gauge",			x = 0, y = 0, w = 12, h = 35},
		{id = "gauge-n2",		src = "src-gauge",			x = 12, y = 0, w = 12, h = 35},
		{id = "gauge-n3",		src = "src-gauge",			x = 24, y = 0, w = 12, h = 35},
		{id = "gauge-n4",		src = "src-gauge",			x = 36, y = 0, w = 12, h = 35},
		{id = "gauge-e1",		src = "src-gauge",			x = 0, y = 35, w = 12, h = 35},
		{id = "gauge-e2",		src = "src-gauge",			x = 12, y = 35, w = 12, h = 35},
		{id = "gauge-e3",		src = "src-gauge",			x = 24, y = 35, w = 12, h = 35},
		{id = "gauge-e4",		src = "src-gauge",			x = 36, y = 35, w = 12, h = 35},
		{id = "dot-gauge",		src = "src-number-gauge",	x = 286, y = 0, w = 8, h = 28}
	}
	
	parts.value = {
		{id = "groovegauge",			src = "src-number-gauge", x = 0, y = 0, w = 260, h = 28, divx = 10, digit = 3, ref = 107},
		{id = "groovegauge-afterdot",	src = "src-number-gauge", x = 0, y = 0, w = 286, h = 28, divx = 11, digit = 1, ref = 407}
	}
	
	parts.gauge = {
		id = "gauge",
		nodes = {"gauge-n1","gauge-n2","gauge-n3","gauge-n4","gauge-e1","gauge-e2","gauge-e3","gauge-e4"},
		parts = g.frame.gauge.scale
	}
	
	parts.destination = {
		{id = "gauge",					dst = {{x = g.frame.gauge.x,			y = g.frame.gauge.y,		w = g.frame.gauge.w, h = g.frame.gauge.h}}},
		{id = "dot-gauge",				dst = {{x = g.frame.gauge.num_x + 78,	y = g.frame.gauge.num_y,	w = 8, h = 28}}},
		{id = "groovegauge",			dst = {{x = g.frame.gauge.num_x,		y = g.frame.gauge.num_y,	w = 26, h = 28}}},
		{id = "groovegauge-afterdot",	dst = {{x = g.frame.gauge.num_x + 86,	y = g.frame.gauge.num_y,	w = 26, h = 28}}}
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}
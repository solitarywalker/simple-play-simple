local parts = {}
local main_state = require("main_state")
-- @param t geometry
local function load(t)

	parts.source = {{id = "src-gauge", path = "../customize/gauge/default2/gauge.png"}}
	
	parts.image = {
		{id = "gauge-n1",		src = "src-gauge",			x = 0, y = 0, w = 12, h = 35},
		{id = "gauge-n2",		src = "src-gauge",			x = 12, y = 0, w = 12, h = 35},
		{id = "gauge-n3",		src = "src-gauge",			x = 24, y = 0, w = 12, h = 35},
		{id = "gauge-n4",		src = "src-gauge",			x = 36, y = 0, w = 12, h = 35},
		{id = "gauge-e1",		src = "src-gauge",			x = 0, y = 35, w = 12, h = 35},
		{id = "gauge-e2",		src = "src-gauge",			x = 12, y = 35, w = 12, h = 35},
		{id = "gauge-e3",		src = "src-gauge",			x = 24, y = 35, w = 12, h = 35},
		{id = "gauge-e4",		src = "src-gauge",			x = 36, y = 35, w = 12, h = 35}
	}
	
	parts.graph = {{id = "gauge-overlay", src = "src-gauge", x = 48, y = 0, w = 1, h = 35, angle = 0, value = function() return (main_state.number(107) * 0.01) end}}
	
	parts.gauge = {
		id = "gauge",
		nodes = {"gauge-n1","gauge-n2","gauge-n3","gauge-n4","gauge-e1","gauge-e2","gauge-e3","gauge-e4"},
		parts = 100
	}
	
	parts.destination = {
		{id = "gauge",						dst = {{x = t.frame.gauge.x, y = t.frame.gauge.y, w = t.frame.gauge.w, h = t.frame.gauge.h}}},
		{id = "gauge-overlay", blend = 2,	dst = {{x = t.frame.gauge.x, y = t.frame.gauge.y, w = t.frame.gauge.w, h = t.frame.gauge.h}}}
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}
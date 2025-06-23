local parts = {}
local main_state = require("main_state")

-- param g : geometry
local function load(g)

	local flag = false
	local function draw_flag()
		if flag == false and main_state.number(102) > 0 then
			flag = true
		end
		return flag
	end
	
	parts.source = {{id = "src-ex-rate", path = "../customize/extension/判定下レート表示/parts.png"}}
	
	parts.image = {
		{id = "ex-rate-dot", src = "src-ex-rate", x = 65, y = 0, w = 13, h = 17}
	}
	
	parts.value = {
		{id = "ex-rate-n",		src = "src-ex-rate", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 3, ref = 102},
		{id = "ex-rate-ad-n",	src = "src-ex-rate", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 2, align = 1, ref = 103}
	}
	
	parts.destination = {
	}
	
	for i = 1, #g.lanes.x do
		table.insert(parts.destination, {id = "ex-rate-dot",	timer = 41, draw = function() return draw_flag() end, dst = {{x = g.lanes.center_x[i],		y = g.lanes.judge.y[i] - 90, w = 13, h = 17}}})
		table.insert(parts.destination, {id = "ex-rate-n",		timer = 41, draw = function() return draw_flag() end, dst = {{x = g.lanes.center_x[i] - 39,	y = g.lanes.judge.y[i] - 90, w = 13, h = 17}}})
		table.insert(parts.destination, {id = "ex-rate-ad-n",	timer = 41, draw = function() return draw_flag() end, dst = {{x = g.lanes.center_x[i] + 13,	y = g.lanes.judge.y[i] - 90, w = 13, h = 17}}})
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
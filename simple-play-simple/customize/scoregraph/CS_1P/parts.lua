local parts = {}
local main_state = require("main_state")

local function load(g)

	local pos = {}
	pos.x = g.frame.bga[1].x + (g.frame.bga[1].w / 2) - 295
	pos.y = g.frame.bga[1].y + (g.frame.bga[1].h / 2) - 318
	
	local total_exscore = main_state.number(74) * 2
	
	parts.source = {
		{id = "src-scoregraph", path = "../customize/scoregraph/CS_1P/parts.png"},
	}
	
	parts.image = {
		{id = "scoregraph-frame",	src = "src-scoregraph", x = 0, y = 0, w = 590, h = 636},
		{id = "scoregraph-line",	src = "src-scoregraph", x = 586, y = 122, w = 2, h = 2}
	}
	
	parts.value = {
		{id = "now_score",		src = "src-scoregraph", x = 590, y = 0, w = 200, h = 21, divx = 10, digit = 5, align = 0, value = function() return main_state.exscore() end},
		{id = "target_score",	src = "src-scoregraph", x = 590, y = 0, w = 200, h = 21, divx = 10, digit = 5, align = 0, value = function() return math.floor(main_state.float_number(114) * total_exscore + 0.5) end}
	}

	parts.graph = {
		{id = "graph-now",		src = "src-scoregraph", x = 590, y = 126, w = 68, h = 504, type = 110},
		{id = "graph-best-f",	src = "src-scoregraph", x = 896, y = 126, w = 68, h = 504, type = 113},
		{id = "graph-best",		src = "src-scoregraph", x = 692, y = 126, w = 68, h = 504, type = 112},
		{id = "graph-target-f",	src = "src-scoregraph", x = 896, y = 126, w = 68, h = 504, type = 115},
		{id = "graph-target",	src = "src-scoregraph", x = 794, y = 126, w = 68, h = 504, type = 114}
	}
	
	parts.destination = {
		{id = "scoregraph-frame", loop = 200,	dst = {{time = 0, x = pos.x, y = pos.y, w = 590, h = 636, a = 64},{time = 200, a = 255}}},
		{id = "now_score",						dst = {{x = pos.x + 484, y = pos.y + 565, w = 20, h = 21}}},
		{id = "target_score",					dst = {{x = pos.x + 484, y = pos.y + 530, w = 20, h = 21}}},
		{id = "graph-now",						dst = {{x = pos.x + 286, y = pos.y + 6, w = 68, h = 504}}},
		{id = "graph-best-f",					dst = {{x = pos.x + 388, y = pos.y + 6, w = 68, h = 504}}},
		{id = "graph-best",						dst = {{x = pos.x + 388, y = pos.y + 6, w = 68, h = 504}}},
		{id = "graph-target-f",					dst = {{x = pos.x + 490, y = pos.y + 6, w = 68, h = 504}}},
		{id = "graph-target",					dst = {{x = pos.x + 490, y = pos.y + 6, w = 68, h = 504}}},
		{id = "scoregraph-line", op = {222},	dst = {{x = pos.x + 4, y = pos.y + 341, w = 582, h = 2}}},
		{id = "scoregraph-line", op = {221},	dst = {{x = pos.x + 4, y = pos.y + 397, w = 582, h = 2}}},
		{id = "scoregraph-line", op = {220},	dst = {{x = pos.x + 4, y = pos.y + 453, w = 582, h = 2}}}
	}			
	return parts	
end

return {
	parts = parts,
	load = load
}
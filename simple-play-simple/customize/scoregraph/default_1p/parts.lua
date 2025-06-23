local parts = {}

-- @param t geometry
local function load(t)	
	parts.source = {
		{id = "src-scoregraph",			path = "../customize/scoregraph/default_1p/scoregraph.png"},
		{id = "src-scoregraph-frame",	path = "../customize/scoregraph/default_1p/scoregraph_frame.png"},
		{id = "src-scoregraph-line",	path = "../customize/scoregraph/default_1p/scoregraph_line.png"}
	}
	parts.image = {
		{id = "scoregraph-frame",	src = "src-scoregraph-frame", x = 0, y = 0, w = -1, h = -1},
		{id = "scoregraph-line",	src = "src-scoregraph-line", x = 0, y = 0, w = 1, h = 1}
	}

	parts.graph = {
		{id = "graph-now-p",	src = "src-scoregraph", x = 8, y = 8, w = 1, h = 1, type = 111},
		{id = "graph-now",		src = "src-scoregraph", x = 0, y = 0, w = 1, h = 1, type = 110},
		{id = "graph-best-f",	src = "src-scoregraph", x = 8, y = 8, w = 1, h = 1, type = 113},
		{id = "graph-best",		src = "src-scoregraph", x = 8, y = 0, w = 1, h = 1, type = 112},
		{id = "graph-target-f",	src = "src-scoregraph", x = 8, y = 8, w = 1, h = 1, type = 115},
		{id = "graph-target",	src = "src-scoregraph", x = 0, y = 8, w = 1, h = 1, type = 114}
	}
	parts.destination = {
		{id = "scoregraph-frame", loop = 200,	dst = {{time = 0, x = t.frame.graph.x, y = t.frame.graph.y, w = 221, h = 708, a = 64},{time = 200, a = 255}}},
		{id = "graph-now-p",					dst = {{x = t.frame.graph.x + 45, y = t.frame.graph.y + 3, w = 40, h = 702}}},
		{id = "graph-now",						dst = {{x = t.frame.graph.x + 45, y = t.frame.graph.y + 3, w = 40, h = 702}}},
		{id = "graph-best-f", loop = 600,		dst = {{time = 330, x = t.frame.graph.x + 110, y = t.frame.graph.y + 3, w = 40, h = 0, acc = 2},{time = 600, h = 702}}},
		{id = "graph-best",						dst = {{x = t.frame.graph.x + 110, y = t.frame.graph.y + 3, w = 40, h = 702}}},
		{id = "graph-target-f", loop = 600,		dst = {{time = 330, x = t.frame.graph.x + 175, y = t.frame.graph.y + 3, w = 40, h = 0, acc = 2},{time = 600, h = 702}}},
		{id = "graph-target",					dst = {{x = t.frame.graph.x + 175, y = t.frame.graph.y + 3, w = 40, h = 702}}},
		{id = "scoregraph-line", op = {222},	dst = {{x = t.frame.graph.x + 11, y = t.frame.graph.y + 470, w = 209, h = 1}}},
		{id = "scoregraph-line", op = {221},	dst = {{x = t.frame.graph.x + 21, y = t.frame.graph.y + 548, w = 199, h = 1}}},
		{id = "scoregraph-line", op = {220},	dst = {{x = t.frame.graph.x + 31, y = t.frame.graph.y + 626, w = 189, h = 1}}}
	}			
	return parts	
end

return {
	parts = parts,
	load = load
}
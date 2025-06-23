local parts = {}

-- param g : geometry
local function load(g)
	
	local line_x = {}
	local line_y = {}
	local corner_x = {}
	local corner_y = {}
	
	line_x[1] = g.frame.bga[1].x
	line_x[2] = g.frame.bga[1].x + g.frame.bga[1].w
	line_x[3] = g.frame.bga[1].x
	line_x[4] = g.frame.bga[1].x - 3
	line_y[1] = g.frame.bga[1].y + g.frame.bga[1].h
	line_y[2] = g.frame.bga[1].y
	line_y[3] = g.frame.bga[1].y - 3
	line_y[4] = g.frame.bga[1].y
	corner_x[1] = g.frame.bga[1].x - 3
	corner_x[2] = g.frame.bga[1].x + g.frame.bga[1].w
	corner_x[3] = g.frame.bga[1].x + g.frame.bga[1].w
	corner_x[4] = g.frame.bga[1].x - 3
	corner_y[1] = g.frame.bga[1].y + g.frame.bga[1].h
	corner_y[2] = g.frame.bga[1].y + g.frame.bga[1].h
	corner_y[3] = g.frame.bga[1].y - 3
	corner_y[4] = g.frame.bga[1].y - 3
	
	parts.source = {
		{id = "src-ex-bgaframe", path = "../customize/extension/BGA枠表示/parts.png"}
	}
	
	parts.image = {
		{id = "line1", src = "src-ex-bgaframe", x = 3, y = 0, w = 3, h = 3},
		{id = "line2", src = "src-ex-bgaframe", x = 13, y = 3, w = 3, h = 3},
		{id = "line3", src = "src-ex-bgaframe", x = 3, y = 13, w = 3, h = 3},
		{id = "line4", src = "src-ex-bgaframe", x = 0, y = 3, w = 3, h = 3},
		{id = "corner1", src = "src-ex-bgaframe", x = 0, y = 0, w = 3, h = 3},
		{id = "corner2", src = "src-ex-bgaframe", x = 13, y = 0, w = 3, h = 3},
		{id = "corner3", src = "src-ex-bgaframe", x = 13, y = 13, w = 3, h = 3},
		{id = "corner4", src = "src-ex-bgaframe", x = 0, y = 13, w = 3, h = 3}
	}
	
	parts.destination = {
		{id = "line1", dst = {{x = line_x[1], y = line_y[1], w = g.frame.bga[1].w, h = 3}}},
		{id = "line2", dst = {{x = line_x[2], y = line_y[2], w = 3, h = g.frame.bga[1].h}}},
		{id = "line3", dst = {{x = line_x[3], y = line_y[3], w = g.frame.bga[1].w, h = 3}}},
		{id = "line4", dst = {{x = line_x[4], y = line_y[4], w = 3, h = g.frame.bga[1].h}}},
		{id = "corner1", dst = {{x = corner_x[1], y = corner_y[1], w = 3, h = 3}}},
		{id = "corner2", dst = {{x = corner_x[2], y = corner_y[2], w = 3, h = 3}}},
		{id = "corner3", dst = {{x = corner_x[3], y = corner_y[3], w = 3, h = 3}}},
		{id = "corner4", dst = {{x = corner_x[4], y = corner_y[4], w = 3, h = 3}}}
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
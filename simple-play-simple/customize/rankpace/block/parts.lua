local parts = {}

local function load(g)

	parts.source = {
		{id = "src-rank", path = "../customize/rankpace/*" .. "/parts.png"}
	}
	
	parts.image = {
		{id = "f",		src = "src-rank", x = 0, y = 0, w = 120, h = 48},
		{id = "e",		src = "src-rank", x = 0, y = 48, w = 120, h = 48},
		{id = "d",		src = "src-rank", x = 0, y = 96, w = 120, h = 48},
		{id = "c",		src = "src-rank", x = 0, y = 144, w = 120, h = 48},
		{id = "b",		src = "src-rank", x = 0, y = 192, w = 120, h = 48},
		{id = "a",		src = "src-rank", x = 0, y = 240, w = 120, h = 48},
		{id = "aa",		src = "src-rank", x = 0, y = 288, w = 120, h = 48},
		{id = "aaa",	src = "src-rank", x = 0, y = 336, w = 120, h = 48}
	}
	
	parts.destination = {
		{id = "f",		op = {207}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "e",		op = {206}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "d",		op = {205}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "c",		op = {204}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "b",		op = {203}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "a",		op = {202}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "aa",		op = {201}, dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}},
		{id = "aaa",	op = {200},	dst = {{x = g.frame.rankpace.x, y = g.frame.rankpace.y, w = 120, h = 48}}}
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
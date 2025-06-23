local parts = {}

local function load(g)

	parts.source = {{id = "src-score", path = "../customize/score/*".. "/parts.png"}}
	
	parts.image = {{id = "score-s", src = "src-score", x = 0, y = 0, w = 78, h = 17}}
	
	parts.value = {{id = "score-n", src = "src-score", x = 0, y = 17, w = 130, h = 17, divx = 10, divy = 1, digit = 5, align = 1, ref = 101}}
	
	parts.destination = {
		{id = "score-s", dst = {{x = g.frame.score.x,		y = g.frame.score.y, w = 78, h = 17}}},
		{id = "score-n", dst = {{x = g.frame.score.x + 78,	y = g.frame.score.y, w = 13, h = 17}}},
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
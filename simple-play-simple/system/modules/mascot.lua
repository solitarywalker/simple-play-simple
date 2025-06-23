local parts = {}

local function load(g)
	
	local pmchara = {
		w = 167 * g.frame.pmchara.magnification,
		h = 271 * g.frame.pmchara.magnification
	}
	
	parts.source = {
		{id = "src-mascot",			path = "../customize/mascot/*"},
		{id = "src-movingmascot",	path = "../customize/movingmascot/*"},
		{id = "src-pomyu1p",		path = "../customize/pmchara/*"}
	}
	
	parts.image = {
		{id = "mascot", src = "src-mascot", x = 0, y = 0, w = -1, h = -1},
		{id = "movingmascot", src = "src-movingmascot", x = 0, y = 0, w = 1344, h = 271, divx = 8, cycle = 1000}
	}
	
	parts.pmchara = {
		{id = "pmchara",		src = "src-pomyu1p", color = 1, type = 0, side = 1},
		--[[
		{id = "pmchara-bg",		src = "src-pomyu1p", color = 1, type = 1},
		{id = "pmchara-name",	src = "src-pomyu1p", color = 1, type = 2, side = 1}
		--]]
	}
	
	parts.destination = {
		{id = "mascot", loop = 2000, stretch = 9, dst = {
			{time = 0, x = g.frame.mascot.x, y = g.frame.mascot.y, w = 168, h = 271},
			{time = 2000}
		}},
		{id = "movingmascot", loop = 2000, dst = {
			{time = 0, x = g.frame.movingmascot.x, y = g.frame.movingmascot.y, w = 168, h = 271},
			{time = 2000}
		}},
		{id = "pmchara", dst = {
			{x = g.frame.pmchara.x, y = g.frame.pmchara.y, w = pmchara.w, h = pmchara.h}
		}}
	}

	return parts	
	
end

return {
	parts = parts,
	load = load
}
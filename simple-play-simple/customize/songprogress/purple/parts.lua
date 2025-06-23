local parts = {}

local function load(g)

		parts.source = {
			{id = "src-progress", path = "../customize/songprogress/*" .. "/parts.png"}
		}
		
		parts.slider = {
			{id = "song-progress", src = "src-progress", x = 0, y = 0, w = -1, h = -1, angle = 2, range = g.frame.songprogress.range, type = 6}
		}
		
		parts.destination = {
			{id = "song-progress", loop = 1200, blend = 2, dst = {
				{time = 0, x = g.frame.songprogress.x, y = g.frame.songprogress.y - g.frame.songprogress.range, w = 64, h = 64, a = 0, acc = 2},
				{time = 500, a = 255},
				{time = 1200, y = g.frame.songprogress.y}
			}},
			{id = "song-progress", timer = 140, loop = 0, blend = 2, dst = {
				{time = 0, x = g.frame.songprogress.x, y = g.frame.songprogress.y, w = 64, h = 64, a = 255},
				{time = 1000, a = 0}
			}}
		}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(t)
	parts.text = {
		{id = "music-title",	font = "system-font", size = t.frame.songinfo.h, align = 1, ref = 12, overflow = 1},
		{id = "music-genre",	font = "system-font", size = t.frame.songinfo.h, align = 1, ref = 13, overflow = 1},
		{id = "music-artist",	font = "system-font", size = t.frame.songinfo.h, align = 1, ref = 16, overflow = 1},
		{id = "table",			font = "system-font", size = t.frame.songinfo.h, align = 1, ref = 1003, overflow = 1}
	}
	parts.destination = {
		{id = "music-title",	filter = 1, loop = 0, dst = {{time = 0, x = t.frame.songinfo.x, y = t.frame.songinfo.y, w = t.frame.songinfo.w, h = t.frame.songinfo.h, a = 0},{time = 100, a = 255},				{time = 1900},{time = 2000, a = 0},{time = 8000}}},
		{id = "music-genre",	filter = 1, loop = 0, dst = {{time = 0, x = t.frame.songinfo.x, y = t.frame.songinfo.y, w = t.frame.songinfo.w, h = t.frame.songinfo.h, a = 0},{time = 2000},{time = 2100, a = 255},	{time = 3900},{time = 4000, a = 0},{time = 8000}}},
		{id = "music-artist",	filter = 1, loop = 0, dst = {{time = 0, x = t.frame.songinfo.x, y = t.frame.songinfo.y, w = t.frame.songinfo.w, h = t.frame.songinfo.h, a = 0},{time = 4000},{time = 4100, a = 255},	{time = 5900},{time = 6000, a = 0},{time = 8000}}},
		{id = "table",			filter = 1, loop = 0, dst = {{time = 0, x = t.frame.songinfo.x, y = t.frame.songinfo.y, w = t.frame.songinfo.w, h = t.frame.songinfo.h, a = 0},{time = 6000},{time = 6100, a = 255},	{time = 7900},{time = 8000, a = 0}}}
	}			
	return parts	
end

return {
	parts = parts,
	load = load
}
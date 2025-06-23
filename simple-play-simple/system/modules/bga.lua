-- BGAを表示します
local parts = {}

local function load(g)

	parts.source = {
		{id = "src-nobgaimage",	path = "../customize/bga/*"}
	}
	
	parts.image = {
		{id = "no-bga-image", src = "src-nobgaimage", x = 0, y = 0, w = -1, h = -1}
	}
	
	parts.text = {
		{id = "backbmp-music-title",	font = "system-font", size = 60, align = 1, ref = 12, overflow = 1},
		{id = "backbmp-music-genre",	font = "system-font", size = 24, align = 1, ref = 13, overflow = 1},
		{id = "backbmp-music-artist",	font = "system-font", size = 30, align = 1, ref = 16, overflow = 1},
	}
	
	parts.bga = {id = "bga"}
	
	parts.destination = {}
	
	for i, v in pairs(g.frame.bga) do
		
		table.insert(parts.destination, {id = -110, dst = {
			{x = v.x, y = v.y, w = v.w, h = v.h}
		}})
		
		table.insert(parts.destination, {id = "bga", filter = 1, stretch = v.stretch, dst = {
			{x = v.x, y = v.y, w = v.w, h = v.h, a = v.a}
		}})
		
		table.insert(parts.destination, {id = "no-bga-image", filter = 1, timer = 41, op = {170}, stretch = v.stretch, dst = {
			{x = v.x, y = v.y, w = v.w, h = v.h, a = v.a}
		}})
		
		table.insert(parts.destination, {id = -110, dst = {
			{x = v.x, y = v.y, w = v.w, h = v.h, a = 255 - v.brightness}
		}})
		
		-- 拡張機能から移植
		if g.type ~= 2
		and g.type ~= 3
		then
			local text_x = (v.w / 2) + v.x
			local text_w = (v.w / 10) * 9
			local title_y = ((v.h / 10) * 5.5) + v.y
			local genre_y = ((v.h / 10) * 8) + v.y
			local artist_y = ((v.h / 10) * 2) + v.y
			table.insert(parts.destination, {id = -110, stretch = 1, filter = 1, op = {80},									dst = {{			x = v.x, y = v.y, w = v.w, h = v.h, a = 255}}})
			table.insert(parts.destination, {id = -110, stretch = 1, filter = 1, timer = 40, loop = -1, op = {81},			dst = {{time = 0,	x = v.x, y = v.y, w = v.w, h = v.h, a = 255},{time = 500, a = 0}}})
			table.insert(parts.destination, {id = -101, stretch = 1, filter = 1, op = {80,195},								dst = {{			x = v.x, y = v.y, w = v.w, h = v.h, a = 255}}})
			table.insert(parts.destination, {id = -101, stretch = 1, filter = 1, timer = 40, loop = -1, op = {81,195},		dst = {{time = 0,	x = v.x, y = v.y, w = v.w, h = v.h, a = 255},{time = 500, a = 0}}})
			table.insert(parts.destination, {id = -100, stretch = 1, filter = 1, op = {80,191,194},							dst = {{			x = v.x, y = v.y, w = v.w, h = v.h, a = 255}}})
			table.insert(parts.destination, {id = -100, stretch = 1, filter = 1, timer = 40, loop = -1, op = {81,191,194},	dst = {{time = 0,	x = v.x, y = v.y, w = v.w, h = v.h, a = 255},{time = 500, a = 0}}})
			table.insert(parts.destination, {id = "backbmp-music-title", filter = 1, op = {80,190,194},								dst = {{			x = text_x, y = title_y, w = text_w, h = 60}}})
			table.insert(parts.destination, {id = "backbmp-music-title", filter = 1, timer = 40, loop = -1,  op = {81,190,194},		dst = {{time = 0,	x = text_x, y = title_y, w = text_w, h = 60, a = 255},{time = 500, a = 0}}})
			table.insert(parts.destination, {id = "backbmp-music-genre", filter = 1, op = {80,190,194},								dst = {{			x = text_x, y = genre_y, w = text_w, h = 24}}})
			table.insert(parts.destination, {id = "backbmp-music-genre", filter = 1, timer = 40, loop = -1,  op = {81,190,194},		dst = {{time = 0,	x = text_x, y = genre_y, w = text_w, h = 24, a = 255},{time = 500, a = 0}}})
			table.insert(parts.destination, {id = "backbmp-music-artist", filter = 1, op = {80,190,194},							dst = {{			x = text_x, y = artist_y, w = text_w, h = 30}}})
			table.insert(parts.destination, {id = "backbmp-music-artist", filter = 1, timer = 40, loop = -1,  op = {81,190,194},	dst = {{time = 0,	x = text_x, y = artist_y, w = text_w, h = 30, a = 255},{time = 500, a = 0}}})	
		end
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
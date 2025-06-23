local parts = {}

-- @param t geometry
local function load(g)
	
		local load_title_y	= g.lanes.inside.y[1] + g.lanes.judgeline.h + 6 + 20
		local load_genre_y	= load_title_y + 44 + 20
		local load_artist_y	= load_title_y + 68 + 20
		local load_table_y	= load_title_y + 92 + 20
		local judgerank_x	= g.lanes.right_x[1] - g.lane.outline.px - 208
		local judgerank_y	= g.lanes.inside.y[1] + g.lanes.judgeline.h + 4
	
		parts.source = {{id = "src-judgerank",	path = "../customize/effect/loading/default/judgerank.png"}}
		parts.image = {
			{id = "judge-veryeasy",	src = "src-judgerank", x = 0, y = 0, w = 204, h = 24},
			{id = "judge-easy",		src = "src-judgerank", x = 0, y = 24, w = 204, h = 24},
			{id = "judge-normal",	src = "src-judgerank", x = 0, y = 48, w = 204, h = 24},
			{id = "judge-hard",		src = "src-judgerank", x = 0, y = 72, w = 204, h = 24},
			{id = "judge-veryhard",	src = "src-judgerank", x = 0, y = 96, w = 204, h = 24}
		}
		parts.text = {
			{id = "load-music-title",	font = "system-font", size = 36, ref = 10, overflow = 1},
			{id = "load-music-genre",	font = "system-font", size = 16, ref = 13, overflow = 1},
			{id = "load-music-artist",	font = "system-font", size = 16, ref = 16, overflow = 1},
			{id = "load-table",			font = "system-font", size = 16, ref = 1003, overflow = 1}
		}
		parts.destination = {
			{id = -111, loop = 950, dst = {{time = 600, x = g.lanes.inside.x[1], y = g.lanes.inside.y[1], w = g.lanes.inside.w[1], h = g.lanes.inside.h[1], a = 0, acc = 1},{time = 650, a = 32, acc = 2},{time = 950, a = 0}}},
			
			{id = "load-music-title",	loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_title_y,  w = g.lanes.inside.w[1] - 12, h = 36, a = 0},{time = 800, a = 128}}},
			{id = "load-music-genre",	loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_genre_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
			{id = "load-music-artist",	loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_artist_y, w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
			{id = "load-table",			loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_table_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
			
			{id = "load-music-title",	loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_title_y,  w = g.lanes.inside.w[1] - 12, h = 36, a = 0},{time = 800, a = 128}}},
			{id = "load-music-genre",	loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_genre_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
			{id = "load-music-artist",	loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_artist_y, w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
			{id = "load-table",			loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_table_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
			
			{id = "load-music-title",	loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_title_y,  w = g.lanes.inside.w[1] - 12, h = 36, a = 128, acc = 2},{time = 800, a = 0}}},
			{id = "load-music-genre",	loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_genre_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 128, acc = 2},{time = 800, a = 0}}},
			{id = "load-music-artist",	loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_artist_y, w = g.lanes.inside.w[1] - 12, h = 16, a = 128, acc = 2},{time = 800, a = 0}}},
			{id = "load-table",			loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_table_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 128, acc = 2},{time = 800, a = 0}}},
			
			{id = "judge-veryeasy",	loop = 200, offsets = {3}, op = {80,184},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-easy",		loop = 200, offsets = {3}, op = {80,183},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-normal",	loop = 200, offsets = {3}, op = {80,182},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-hard",		loop = 200, offsets = {3}, op = {80,181},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-veryhard",	loop = 200, offsets = {3}, op = {80,180},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			
			{id = "judge-veryeasy",	loop = 200, offsets = {3}, op = {184,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-easy",		loop = 200, offsets = {3}, op = {183,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-normal",	loop = 200, offsets = {3}, op = {182,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-hard",		loop = 200, offsets = {3}, op = {181,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			{id = "judge-veryhard",	loop = 200, offsets = {3}, op = {180,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
			
			{id = "judge-veryeasy",	loop = -1, timer = 40, offsets = {3}, op = {184},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
			{id = "judge-easy",		loop = -1, timer = 40, offsets = {3}, op = {183},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
			{id = "judge-normal",	loop = -1, timer = 40, offsets = {3}, op = {182},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
			{id = "judge-hard",		loop = -1, timer = 40, offsets = {3}, op = {181},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
			{id = "judge-veryhard",	loop = -1, timer = 40, offsets = {3}, op = {180},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
		}
		
		if g.type == 2 or g.type == 3 then
			local judgerank_x2		= g.lanes.right_x[2] - g.lane.outline.px - 208
			local stagefile_x		= g.lanes.inside.x[2] + (g.lanes.inside.w[2] / 8)
			local stagefile_y		= g.lanes.inside.y[2] + g.lanes.judgeline.h + 30
			local stagefile_size	= g.lanes.inside.w[2] - (g.lanes.inside.w[2] / 4)
			
			parts.destination = {
				{id = -111, loop = 950, dst = {{time = 600, x = g.lanes.inside.x[1], y = g.lanes.inside.y[1], w = g.lanes.inside.w[1], h = g.lanes.inside.h[1], a = 0, acc = 1},{time = 650, a = 32, acc = 2},{time = 950, a = 0}}},
				
				{id = "load-music-title",	loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_title_y,  w = g.lanes.inside.w[1] - 12, h = 36, a = 0},{time = 800, a = 128}}},
				{id = "load-music-genre",	loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_genre_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
				{id = "load-music-artist",	loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_artist_y, w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
				{id = "load-table",			loop = 800, filter = 1, offsets = {3}, op = {80},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_table_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
				
				{id = "load-music-title",	loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_title_y,  w = g.lanes.inside.w[1] - 12, h = 36, a = 0},{time = 800, a = 128}}},
				{id = "load-music-genre",	loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_genre_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
				{id = "load-music-artist",	loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_artist_y, w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
				{id = "load-table",			loop = 800, filter = 1, offsets = {3}, op = {1080},	dst = {{time = 650, x = g.lanes.inside.x[1] + 6, y = load_table_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 0},{time = 800, a = 128}}},
				
				{id = "load-music-title",	loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_title_y,  w = g.lanes.inside.w[1] - 12, h = 36, a = 128, acc = 2},{time = 800, a = 0}}},
				{id = "load-music-genre",	loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_genre_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 128, acc = 2},{time = 800, a = 0}}},
				{id = "load-music-artist",	loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_artist_y, w = g.lanes.inside.w[1] - 12, h = 16, a = 128, acc = 2},{time = 800, a = 0}}},
				{id = "load-table",			loop = -1, filter = 1, timer = 40, offsets = {3},	dst = {{time = 0, x = g.lanes.inside.x[1] + 6, y = load_table_y,  w = g.lanes.inside.w[1] - 12, h = 16, a = 128, acc = 2},{time = 800, a = 0}}},
				
				{id = "judge-veryeasy",	loop = 200, offsets = {3}, op = {80,184},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-easy",		loop = 200, offsets = {3}, op = {80,183},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-normal",	loop = 200, offsets = {3}, op = {80,182},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-hard",		loop = 200, offsets = {3}, op = {80,181},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-veryhard",	loop = 200, offsets = {3}, op = {80,180},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				
				{id = "judge-veryeasy",	loop = 200, offsets = {3}, op = {184,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-easy",		loop = 200, offsets = {3}, op = {183,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-normal",	loop = 200, offsets = {3}, op = {182,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-hard",		loop = 200, offsets = {3}, op = {181,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-veryhard",	loop = 200, offsets = {3}, op = {180,1080},				dst = {{time = 0, x = judgerank_x, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				
				{id = "judge-veryeasy",	loop = -1, timer = 40, offsets = {3}, op = {184},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-easy",		loop = -1, timer = 40, offsets = {3}, op = {183},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-normal",	loop = -1, timer = 40, offsets = {3}, op = {182},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-hard",		loop = -1, timer = 40, offsets = {3}, op = {181},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-veryhard",	loop = -1, timer = 40, offsets = {3}, op = {180},		dst = {{time = 0, x = judgerank_x, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				
				{id = -111, loop = 950, dst = {{time = 600, x = g.lanes.inside.x[2], y = g.lanes.inside.y[2], w = g.lanes.inside.w[2], h = g.lanes.inside.h[2], a = 0, acc = 1},{time = 650, a = 32, acc = 2},{time = 950, a = 0}}},
				
				{id = -100, filter = 1, loop = 200, offsets = {3}, op = {80}, stretch = 1,		dst = {{time = 0, x = stagefile_x, y = stagefile_y, w = stagefile_size, h = stagefile_size, a = 0},{time = 200, a = 255}}},
				{id = -100, filter = 1, loop = -1, timer = 40, offsets = {3}, stretch = 1,		dst = {{time = 0, x = stagefile_x, y = stagefile_y, w = stagefile_size, h = stagefile_size, a = 255},{time = 500, a = 0}}},
				
				{id = "judge-veryeasy",	loop = 200, offsets = {3}, op = {80,184},					dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-easy",		loop = 200, offsets = {3}, op = {80,183},					dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-normal",	loop = 200, offsets = {3}, op = {80,182},					dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-hard",		loop = 200, offsets = {3}, op = {80,181},					dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-veryhard",	loop = 200, offsets = {3}, op = {80,180},					dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				
				{id = "judge-veryeasy",	loop = 200, offsets = {3}, op = {184,1080},				dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-easy",		loop = 200, offsets = {3}, op = {183,1080},				dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-normal",	loop = 200, offsets = {3}, op = {182,1080},				dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-hard",		loop = 200, offsets = {3}, op = {181,1080},				dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				{id = "judge-veryhard",	loop = 200, offsets = {3}, op = {180,1080},				dst = {{time = 0, x = judgerank_x2, y = judgerank_y - 4, w = 204, h = 24, a = 0},{time = 200, y = judgerank_y, a = 255}}},
				
				{id = "judge-veryeasy",	loop = -1, timer = 40, offsets = {3}, op = {184},			dst = {{time = 0, x = judgerank_x2, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-easy",		loop = -1, timer = 40, offsets = {3}, op = {183},			dst = {{time = 0, x = judgerank_x2, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-normal",	loop = -1, timer = 40, offsets = {3}, op = {182},			dst = {{time = 0, x = judgerank_x2, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-hard",		loop = -1, timer = 40, offsets = {3}, op = {181},			dst = {{time = 0, x = judgerank_x2, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
				{id = "judge-veryhard",	loop = -1, timer = 40, offsets = {3}, op = {180},			dst = {{time = 0, x = judgerank_x2, y = judgerank_y, w = 204, h = 24, a = 255},{time = 500, a = 0}}},
			}
		end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
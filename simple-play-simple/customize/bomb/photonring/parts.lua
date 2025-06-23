local parts = {}

local function load(g)

	parts.source = {
		{id = "src-bomb-dummy",		path = "../customize/bomb/*" .. "/dummy.png"},
		{id = "src-bomb",			path = "../customize/bomb/*" .. "/BOMB.png"},
	}
	parts.image = {
		{id = "bomb-dummy", src = "src-bomb-dummy", x = 0, y = 0, w = -1, h = -1}
	}
	parts.imageset = {}
	parts.destination = {}
	
	local bomb = {
		x = {{}, {}},
		y = {},
		w = (6400 / 16) * 1.00 * g.lanes.bomb.magnification,
		h = (300 / 1) * 1.00 * g.lanes.bomb.magnification
	}
	do
		for i1, v1 in ipairs(g.lane.lane.order) do
			for i2, v2 in ipairs(v1) do
				bomb.x[i1][v2]	= g.lane.center_x[i1][v2] - (bomb.w / 2)
				bomb.y[i1]		= g.lanes.y[i1] + (g.lanes.judgeline.h / 2) - (bomb.h / 2)
			end
		end
	end
	
	do
		local bomb_id = {"s",1,2,3,4,5,6,7,8,9}
		local key_types = {1,2,3,4,5,"s"}
		if g.type == 0 or g.type == 2 then	key_types = {1,2,3,4,5,6,7,"s"}
		elseif g.type == 4 then				key_types = {1,2,3,4,5,6,7,8,9}
		end
		-- default
		for i, v in ipairs(bomb_id) do
			table.insert(parts.image, {id = "bomb-1" .. v,			src = "src-bomb", x = 0, y = 0,		w = 6400, h = 300, divx = 16, divy = 1, timer = 49 + i, cycle = 251})
			table.insert(parts.image, {id = "bomb-pg-1" .. v,		src = "src-bomb", x = 0, y = 300,	w = 6400, h = 300, divx = 16, divy = 1, timer = 49 + i, cycle = 251})
			table.insert(parts.image, {id = "hold1" .. v,			src = "src-bomb", x = 0, y = 900,	w = 6400, h = 300, divx = 16, divy = 1, timer = 69 + i, cycle = 500})
			table.insert(parts.image, {id = "hold1" .. v .. "-b",	src = "src-bomb", x = 0, y = 600,	w = 6400, h = 300, divx = 16, divy = 1, timer = 69 + i, cycle = 251})
			table.insert(parts.imageset, {id = "bomb1" .. v,		ref = 499 + i, images = {"bomb-1" .. v, "bomb-dummy"}})
			table.insert(parts.imageset, {id = "bombpg1" .. v,		ref = 499 + i, images = {"bomb-dummy", "bomb-pg-1" .. v}})
			if g.type == 2 or g.type == 3 then
				table.insert(parts.image, {id = "bomb-2" .. v,			src = "src-bomb", x = 0, y = 0,		w = 6400, h = 300, divx = 16, divy = 1, timer = 59 + i, cycle = 251})
				table.insert(parts.image, {id = "bomb-pg-2" .. v,		src = "src-bomb", x = 0, y = 300,	w = 6400, h = 300, divx = 16, divy = 1, timer = 59 + i, cycle = 251})
				table.insert(parts.image, {id = "hold2" .. v,			src = "src-bomb", x = 0, y = 900,	w = 6400, h = 300, divx = 16, divy = 1, timer = 79 + i, cycle = 500})
				table.insert(parts.image, {id = "hold2" .. v .. "-b",	src = "src-bomb", x = 0, y = 600,	w = 6400, h = 300, divx = 16, divy = 1, timer = 79 + i, cycle = 251})
				table.insert(parts.imageset, {id = "bomb2" .. v,		ref = 509 + i, images = {"bomb-2" .. v, "bomb-dummy"}})
				table.insert(parts.imageset, {id = "bombpg2" .. v,		ref = 509 + i, images = {"bomb-dummy", "bomb-pg-2" .. v}})
			end
		end
		for i, v in ipairs(key_types) do
			if v == "s" then
				table.insert(parts.destination, {id = "bomb1s",		timer = 50, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination, {id = "bombpg1s",	timer = 50, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination, {id = "hold1s",		timer = 70, filter = 1, blend = 2, 				offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h}}})
				table.insert(parts.destination, {id = "hold1s-b",	timer = 70, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h},{time = 250}}})
			else
				table.insert(parts.destination, {id = "bomb1" .. i,			timer = 50 + i, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination, {id = "bombpg1" .. i,		timer = 50 + i, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h},{time = 250}}})
				table.insert(parts.destination, {id = "hold1" .. i,			timer = 70 + i, filter = 1, blend = 2,				offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h}}})
				table.insert(parts.destination, {id = "hold1" .. i .. "-b",	timer = 70 + i, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[1][i], y = bomb.y[1], w = bomb.w, h = bomb.h},{time = 250}}})
			end
			if g.type == 2 or g.type == 3 then
				if v == "s" then
					table.insert(parts.destination, {id = "bomb2s",		timer = 60, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "bombpg2s",	timer = 60, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hold2s",		timer = 80, filter = 1, blend = 2, 				offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h}}})
					table.insert(parts.destination, {id = "hold2s-b",	timer = 80, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h},{time = 250}}})
				else
					table.insert(parts.destination, {id = "bomb2" .. i,			timer = 60 + i, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "bombpg2" .. i,		timer = 60 + i, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h},{time = 250}}})
					table.insert(parts.destination, {id = "hold2" .. i,			timer = 80 + i, filter = 1, blend = 2,				offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h}}})
					table.insert(parts.destination, {id = "hold2" .. i .. "-b",	timer = 80 + i, filter = 1, loop = -1, blend = 2,	offsets = {3}, dst = {{time = 0, x = bomb.x[2][i], y = bomb.y[2], w = bomb.w, h = bomb.h},{time = 250}}})
				end
			end
		end
	
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
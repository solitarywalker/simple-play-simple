local parts = {}

local function load(folder_path, lanes, judge_data, offset, size)

	local judge = {
		f = {w = 271, h = 124},
		n = {x = 353, w = 96, h = 124},
		space = -38
	}
	judge.stretch = offset.h / judge.f.h
	if judge.stretch < 1 then
		judge.f.w	= judge.f.w * judge.stretch
		judge.f.h	= judge.f.h * judge.stretch
		judge.n.x	= judge.n.x * judge.stretch
		judge.n.w	= judge.n.w * judge.stretch
		judge.n.h	= judge.n.h * judge.stretch
		judge.space	= judge.space * judge.stretch
	end
	judge.f.w	= judge.f.w + (judge.f.w / 100) * size.x
	judge.f.h	= judge.f.h + (judge.f.h / 100) * size.x
	judge.n.w	= judge.n.w + (judge.n.w / 100) * size.x
	judge.n.h	= judge.n.h + (judge.n.h / 100) * size.x
	
	judge.f.x	= lanes.x_center - (judge.f.w / 2) - (3 + (3 / 100) * size.x)
	judge.f.x2	= lanes.x_center2 - (judge.f.w / 2) - (3 + (3 / 100) * size.x)
	judge.f.y	= lanes.y + offset.y - (judge.f.h / 2) - ((judge.f.h - offset.h) / 2)
	judge.n.x	= judge.n.x + ((judge.n.x / 100) * size.x)
	judge.space = judge.space + (judge.space / 100) * size.x
	judge.n.y	= 0
	
	parts.source = {
		{id = "hub-src-tmjudge", path = folder_path}
	}

	parts.image = {
		{id = "hub-tm-judgef-pg", src = "hub-src-tmjudge", x = 0, y = 0, w = 271, h = 744, divy = 6, cycle = 100},
		{id = "hub-tm-judgef-gr", src = "hub-src-tmjudge", x = 0, y = 744, w = 271, h = 248, divy = 2, cycle = 60},
		{id = "hub-tm-judgef-gd", src = "hub-src-tmjudge", x = -22, y = 992, w = 271 * 2, h = 124, divx = 2, cycle = 60},
		{id = "hub-tm-judgef-bd", src = "hub-src-tmjudge", x = -44, y = 1116, w = 271 * 2, h = 124, divx = 2, cycle = 60},
		{id = "hub-tm-judgef-pr", src = "hub-src-tmjudge", x = -22, y = 1240, w = 271 * 2, h = 124, divx = 2, cycle = 60},
		{id = "hub-tm-judgef-ms", src = "hub-src-tmjudge", x = -34, y = 1364, w = 271 * 2, h = 124, divx = 2, cycle = 60}
	}
	parts.value = {
		{id = "hub-tm-judgen-pg", src = "hub-src-tmjudge", x = 271, y = 0, w = 960, h = 744, divx = 10, divy = 6, digit = 6, ref = 75, space = judge.space, cycle = 100},
		{id = "hub-tm-judgen-gr", src = "hub-src-tmjudge", x = 271, y = 744, w = 960, h = 124 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = judge.space, cycle = 60},
		{id = "hub-tm-judgen-gd", src = "hub-src-tmjudge", x = 271, y = 744, w = 960, h = 124 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = judge.space, cycle = 60},
		{id = "hub-tm-judgen-bd", src = "hub-src-tmjudge", x = 271, y = 744, w = 960, h = 208 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = judge.space, cycle = 60},
		{id = "hub-tm-judgen-pr", src = "hub-src-tmjudge", x = 271, y = 744, w = 960, h = 208 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = judge.space, cycle = 60},
		{id = "hub-tm-judgen-ms", src = "hub-src-tmjudge", x = 271, y = 744, w = 960, h = 208 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = judge.space, cycle = 60}
	}
	
	parts.judge = {}
	
	do
		local init = {"pg", "gr", "gd", "bd", "pr", "ms"}
		for i = 1, #judge_data.id do -- 5~14鍵なら多分1か2が入るはず
			table.insert(parts.judge, {id = judge_data.id[i], index = judge_data.index[i], images = {}, numbers = {}, shift = true})
		end
		for i, v in ipairs(init) do
			table.insert(parts.judge[1].images,		{id = "hub-tm-judgef-" .. v, loop = -1, filter = 1, timer = 46 ,offsets = {3,32},	dst = {{time = 0, x = judge.f.x, y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
			table.insert(parts.judge[1].numbers,	{id = "hub-tm-judgen-" .. v, loop = -1, filter = 1, timer = 46,						dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			if parts.judge[2] then
				table.insert(parts.judge[2].images,		{id = "hub-tm-judgef-" .. v, loop = -1, filter = 1, timer = 47 ,offsets = {3,32},	dst = {{time = 0, x = judge.f.x2, y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
				table.insert(parts.judge[2].numbers,	{id = "hub-tm-judgen-" .. v, loop = -1, filter = 1, timer = 47,						dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			end
		end
	end
	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(folder_path, lanes, judge_data, offset, size)

	local judge = {
		f = {w = 227, h = 84},
		n = {w = 55, h = 84},
		offset_x		= 0,
		num_space		= 0,
		between_space	= 10
	}
	
	local img_path = skin_config.get_path(folder_path)
	local lua_path = string.sub(img_path, 1, (string.len(img_path) - 4)) .. ".lua"
	
	local status, settings = pcall(function() return dofile(lua_path) end)
	if status and settings then
		if settings.offset_x		then judge.offset_x			= settings.offset_x			end
		if settings.num_space		then judge.num_space		= settings.num_space		end
		if settings.between_space	then judge.between_space	= settings.between_space	end
	end
	judge.n.x	= judge.f.w + judge.between_space - judge.num_space * 4.5
	
	judge.stretch = offset.h / judge.f.h
	if judge.stretch < 1 then
		judge.f.w	= judge.f.w * judge.stretch
		judge.f.h	= judge.f.h * judge.stretch
		judge.n.x	= judge.n.x * judge.stretch
		judge.n.w	= judge.n.w * judge.stretch
		judge.n.h	= judge.n.h * judge.stretch
	end
	
	judge.f.w = judge.f.w + (judge.f.w / 100) * size.x
	judge.f.h = judge.f.h + (judge.f.h / 100) * size.x
	judge.n.x = judge.n.x + (judge.n.x / 100) * size.x
	judge.n.w = judge.n.w + (judge.n.w / 100) * size.x
	judge.n.h = judge.n.h + (judge.n.h / 100) * size.x
	
	judge.offset_x		= (judge.offset_x + (judge.offset_x / 100) * size.x) - (8 + (8 / 100) * size.x)
	
	judge.f.x	= lanes.x_center - (judge.f.w / 2) + judge.offset_x
	judge.f.x2	= lanes.x_center2 - (judge.f.w / 2) + judge.offset_x
	judge.f.y	= lanes.y + offset.y - (judge.f.h / 2) - ((judge.f.h - offset.h) / 2)
	judge.n.y	= 0
	
	parts.source = {
		{id = "hub-src-gnjudge", path = folder_path}
	}
	parts.image = {
		{id = "hub-gnjudgef-pg", src = "hub-src-gnjudge", x = 0, y = 0, w = 227, h = 252, divy = 3, cycle = 120},
		{id = "hub-gnjudgef-gr", src = "hub-src-gnjudge", x = 0, y = 252, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "hub-gnjudgef-gd", src = "hub-src-gnjudge", x = 0, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "hub-gnjudgef-bd", src = "hub-src-gnjudge", x = 227, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "hub-gnjudgef-pr", src = "hub-src-gnjudge", x = 454, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "hub-gnjudgef-ms", src = "hub-src-gnjudge", x = 454, y = 420, w = 227, h = 168, divy = 2, cycle = 80}
	}
	parts.value = {
		{id = "hub-gnjudgen-pg", src = "hub-src-gnjudge", x = 227, y = 0, w = 550, h = 252, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 120, space = judge.num_space},
		{id = "hub-gnjudgen-gr", src = "hub-src-gnjudge", x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80, space = judge.num_space},
		{id = "hub-gnjudgen-gd", src = "hub-src-gnjudge", x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80, space = judge.num_space},
		{id = "hub-gnjudgen-bd", src = "hub-src-gnjudge", x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80, space = judge.num_space},
		{id = "hub-gnjudgen-pr", src = "hub-src-gnjudge", x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80, space = judge.num_space},
		{id = "hub-gnjudgen-ms", src = "hub-src-gnjudge", x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80, space = judge.num_space}
	}
	parts.judge = {}
	
	do
		local init = {"pg", "gr", "gd", "bd", "pr", "ms"}
		for i = 1, #judge_data.id do -- 5~14鍵なら多分1か2が入るはず
			table.insert(parts.judge, {id = judge_data.id[i], index = judge_data.index[i], images = {}, numbers = {}, shift = true})
		end
		for i, v in ipairs(init) do
			table.insert(parts.judge[1].images,		{id = "hub-gnjudgef-" .. v, loop = -1, filter = 1, timer = 46 ,offsets = {3,32},	dst = {{time = 0, x = judge.f.x, y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
			table.insert(parts.judge[1].numbers,	{id = "hub-gnjudgen-" .. v, loop = -1, filter = 1, timer = 46,						dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			if parts.judge[2] then
				table.insert(parts.judge[2].images,		{id = "hub-gnjudgef-" .. v, loop = -1, filter = 1, timer = 47 ,offsets = {3,32},	dst = {{time = 0, x = judge.f.x2, y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
				table.insert(parts.judge[2].numbers,	{id = "hub-gnjudgen-" .. v, loop = -1, filter = 1, timer = 47,						dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			end
		end
	end
	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
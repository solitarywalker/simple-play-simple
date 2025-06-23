local parts = {}

local function load(folder_path, lanes, judge_data, offset, size)

	local judge = {
		f = {w = 153, h = 56},
		n = {x = 159, w = 37, h = 56},
	}
	judge.stretch = offset.h / judge.f.h
	if judge.stretch < 1 then
		judge.f.w	= judge.f.w * judge.stretch
		judge.f.h	= judge.f.h * judge.stretch
		judge.n.x	= judge.n.x * judge.stretch
		judge.n.w	= judge.n.w * judge.stretch
		judge.n.h	= judge.n.h * judge.stretch
	end
	judge.f.w	= judge.f.w + (judge.f.w / 100) * size.x
	judge.f.h	= judge.f.h + (judge.f.h / 100) * size.x
	judge.n.w	= judge.n.w + (judge.n.w / 100) * size.x
	judge.n.h	= judge.n.h + (judge.n.h / 100) * size.x
	judge.f.x	= lanes.x_center - (judge.f.w / 2) - (2 + (2 / 100) * size.x)
	judge.f.x2	= lanes.x_center2 - (judge.f.w / 2) - (2 + (2 / 100) * size.x)
	judge.f.y	= lanes.y + offset.y - (judge.f.h / 2) - ((judge.f.h - offset.h) / 2)
	judge.n.x	= judge.n.x + ((judge.n.x / 100) * size.x)
	judge.n.y	= 0
	judgef_x_offsets = {
		0,
		0,
		0,
		0,
		0,
		0
	}
	
	parts.source = {
		{id = "hub-src-wmixjudge", path = folder_path}
	}
	parts.image = {
		{id = "hub-wmixjudgef-pg", src = "hub-src-wmixjudge", x = 0, y = 0, w = 153, h = 336, divy = 6, cycle = 100},
		{id = "hub-wmixjudgef-gr", src = "hub-src-wmixjudge", x = 0, y = 337, w = 306, h = 56, divx = 2, cycle = 80},
		{id = "hub-wmixjudgef-gd", src = "hub-src-wmixjudge", x = 0, y = 394, w = 306, h = 56, divx = 2, cycle = 80},
		{id = "hub-wmixjudgef-bd", src = "hub-src-wmixjudge", x = 0, y = 451, w = 306, h = 56, divx = 2, cycle = 80},
		{id = "hub-wmixjudgef-pr", src = "hub-src-wmixjudge", x = 0, y = 508, w = 306, h = 56, divx = 2, cycle = 80},
		{id = "hub-wmixjudgef-ms", src = "hub-src-wmixjudge", x = 0, y = 508, w = 306, h = 56, divx = 2, cycle = 80}
	}
	parts.value = {
		{id = "hub-wmixjudgen-pg", src = "hub-src-wmixjudge", x = 154, y = 0, w = 370, h = 336, divx = 10, divy = 6, digit = 6, ref = 75, cycle = 100},
		{id = "hub-wmixjudgen-gr", src = "hub-src-wmixjudge", x = 0, y = 565, w = 370, h = 112, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "hub-wmixjudgen-gd", src = "hub-src-wmixjudge", x = 0, y = 565, w = 370, h = 112, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "hub-wmixjudgen-bd", src = "hub-src-wmixjudge", x = 0, y = 565, w = 370, h = 112, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "hub-wmixjudgen-pr", src = "hub-src-wmixjudge", x = 0, y = 565, w = 370, h = 112, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "hub-wmixjudgen-ms", src = "hub-src-wmixjudge", x = 0, y = 565, w = 370, h = 112, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80}
	}
	parts.judge = {}
	
	do
		local init = {"pg", "gr", "gd", "bd", "pr", "ms"}
		for i = 1, #judge_data.id do -- 5~14鍵なら多分1か2が入るはず
			table.insert(parts.judge, {id = judge_data.id[i], index = judge_data.index[i], images = {}, numbers = {}, shift = true})
		end
		for i, v in ipairs(init) do
			table.insert(parts.judge[1].images,		{id = "hub-wmixjudgef-" .. v, loop = -1, filter = 1, timer = 46 ,		offsets = {3,32},	dst = {{time = 0, x = judge.f.x - judgef_x_offsets[i], y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
			table.insert(parts.judge[1].numbers,	{id = "hub-wmixjudgen-" .. v, loop = -1, filter = 1, timer = 46,							dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			if parts.judge[2] then
				table.insert(parts.judge[2].images,		{id = "hub-wmixjudgef-" .. v, loop = -1, filter = 1, timer = 47 ,	offsets = {3,32},	dst = {{time = 0, x = judge.f.x2 - judgef_x_offsets[i], y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
				table.insert(parts.judge[2].numbers,	{id = "hub-wmixjudgen-" .. v, loop = -1, filter = 1, timer = 47,						dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			end
		end
	end
	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(folder_path, lanes, judge_data, offset, size)

	local judge = {
		f = {w = 231, h = 105 * 0.75},
		n = {x = 240, w = 51, h = 105 * 0.75},
	}
	local judgef_x_offsets = {
		0,
		0,
		24,
		45,
		24,
		24
	}
	judge.stretch = offset.h / judge.f.h
	if judge.stretch < 1 then
		judge.f.w	= judge.f.w * judge.stretch
		judge.f.h	= judge.f.h * judge.stretch
		judge.n.x	= judge.n.x * judge.stretch
		judge.n.w	= judge.n.w * judge.stretch
		judge.n.h	= judge.n.h * judge.stretch
		judgef_x_offsets[3] = judgef_x_offsets[3] * judge.stretch
		judgef_x_offsets[4] = judgef_x_offsets[4] * judge.stretch
		judgef_x_offsets[5] = judgef_x_offsets[5] * judge.stretch
		judgef_x_offsets[6] = judgef_x_offsets[6] * judge.stretch
	end
	judge.f.w	= judge.f.w + (judge.f.w / 100) * size.x
	judge.f.h	= judge.f.h + (judge.f.h / 100) * size.x
	judge.n.w	= judge.n.w + (judge.n.w / 100) * size.x
	judge.n.h	= judge.n.h + (judge.n.h / 100) * size.x
	judge.f.x	= lanes.x_center - (judge.f.w / 2) - (5 + (5 / 100) * size.x)
	judge.f.x2	= lanes.x_center2 - (judge.f.w / 2) - (5 + (5 / 100) * size.x)
	judge.f.y	= lanes.y + offset.y - (judge.f.h / 2) - ((judge.f.h - offset.h) / 2)
	judge.n.x	= judge.n.x + ((judge.n.x / 100) * size.x)
	judge.n.y	= 0
	judgef_x_offsets[3] = judgef_x_offsets[3] + (judgef_x_offsets[3] / 100) * size.x
	judgef_x_offsets[4] = judgef_x_offsets[4] + (judgef_x_offsets[4] / 100) * size.x
	judgef_x_offsets[5] = judgef_x_offsets[5] + (judgef_x_offsets[5] / 100) * size.x
	judgef_x_offsets[6] = judgef_x_offsets[6] + (judgef_x_offsets[6] / 100) * size.x
	
	parts.source = {
		{id = "hub-src-oadx+judge", path = folder_path}
	}
	parts.image = {
		{id = "hub-oadx+judgef-pg", src = "hub-src-oadx+judge", x = 0, y = 0, w = 77, h = 105, divy = 3, cycle = 125},
		{id = "hub-oadx+judgef-gr", src = "hub-src-oadx+judge", x = 0, y = 105, w = 77, h = 70, divy = 2, cycle = 75},
		{id = "hub-oadx+judgef-gd", src = "hub-src-oadx+judge", x = 247, y = 0, w = 77, h = 70, divy = 2, cycle = 75},	-- -8
		{id = "hub-oadx+judgef-bd", src = "hub-src-oadx+judge", x = 324, y = 0, w = 77, h = 70, divy = 2, cycle = 75},	-- -15
		{id = "hub-oadx+judgef-pr", src = "hub-src-oadx+judge", x = 401, y = 0, w = 77, h = 70, divy = 2, cycle = 75},	-- -8
		{id = "hub-oadx+judgef-ms", src = "hub-src-oadx+judge", x = 401, y = 0, w = 77, h = 70, divy = 2, cycle = 75}	-- -8
	}
	parts.value = {
		{id = "hub-oadx+judgen-pg", src = "hub-src-oadx+judge", x = 77, y = 0, w = 170, h = 105, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 125},
		{id = "hub-oadx+judgen-gr", src = "hub-src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
		{id = "hub-oadx+judgen-gd", src = "hub-src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
		{id = "hub-oadx+judgen-bd", src = "hub-src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
		{id = "hub-oadx+judgen-pr", src = "hub-src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
		{id = "hub-oadx+judgen-ms", src = "hub-src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75}
	}
	parts.judge = {}
	
	do
		local init = {"pg", "gr", "gd", "bd", "pr", "ms"}
		for i = 1, #judge_data.id do -- 5~14鍵なら多分1か2が入るはず
			table.insert(parts.judge, {id = judge_data.id[i], index = judge_data.index[i], images = {}, numbers = {}, shift = true})
		end
		for i, v in ipairs(init) do
			table.insert(parts.judge[1].images,		{id = "hub-oadx+judgef-" .. v, loop = -1, filter = 1, timer = 46 ,		offsets = {3,32},	dst = {{time = 0, x = judge.f.x - judgef_x_offsets[i], y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
			table.insert(parts.judge[1].numbers,	{id = "hub-oadx+judgen-" .. v, loop = -1, filter = 1, timer = 46,							dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			if parts.judge[2] then
				table.insert(parts.judge[2].images,		{id = "hub-oadx+judgef-" .. v, loop = -1, filter = 1, timer = 47 ,	offsets = {3,32},	dst = {{time = 0, x = judge.f.x2 - judgef_x_offsets[i], y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
				table.insert(parts.judge[2].numbers,	{id = "hub-oadx+judgen-" .. v, loop = -1, filter = 1, timer = 47,						dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			end
		end
	end
	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
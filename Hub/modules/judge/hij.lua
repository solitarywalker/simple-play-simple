local parts = {}

local function load(folder_path, lanes, judge_data, offset, size)

	local judge = {
		f = {w = 256, h = 72},
		n = {x = 256, w = 48, h = 72},
	}
	local judgef_x_offsets = {
		0,
		0,
		0,
		0,
		0,
		0
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
	judge.f.x	= lanes.x_center - (judge.f.w / 2)
	judge.f.x2	= lanes.x_center2 - (judge.f.w / 2)
	judge.f.y	= lanes.y + offset.y - (judge.f.h / 2) - ((judge.f.h - offset.h) / 2)
	judge.n.x	= judge.n.x + ((judge.n.x / 100) * size.x)
	judge.n.y	= 0
	
	parts.source = {
		{id = "hub-src-hijjudge", path = folder_path}
	}
	parts.image = {
		{id = "hub-hijjudgef-pg", src = "hub-src-hijjudge", x = 0, y = 0,   w = 256, h = 216, divy = 3, cycle = 120},	
		{id = "hub-hijjudgef-gr", src = "hub-src-hijjudge", x = 0, y = 216, w = 256, h = 216, divy = 3, cycle = 120},
		{id = "hub-hijjudgef-gd", src = "hub-src-hijjudge", x = 0, y = 432, w = 256, h = 72},
		{id = "hub-hijjudgef-bd", src = "hub-src-hijjudge", x = 0, y = 504, w = 256, h = 72},
		{id = "hub-hijjudgef-pr", src = "hub-src-hijjudge", x = 0, y = 576, w = 256, h = 72},
		{id = "hub-hijjudgef-ms", src = "hub-src-hijjudge", x = 0, y = 576, w = 256, h = 72}
	}
	parts.value = {
		{id = "hub-hijjudgen-pg", src = "hub-src-hijjudge", x = 256, y = 0,   w = 480, h = 216, divx = 10, divy = 3, digit = 4, ref = 75, cycle = 120},
		{id = "hub-hijjudgen-gr", src = "hub-src-hijjudge", x = 256, y = 216, w = 480, h = 216, divx = 10, divy = 3, digit = 4, ref = 75, cycle = 120},
		{id = "hub-hijjudgen-gd", src = "hub-src-hijjudge", x = 256, y = 432, w = 480, h = 72,  divx = 10,	       digit = 4, ref = 75},
		{id = "hub-hijjudgen-bd", src = "hub-src-hijjudge", x = 256, y = 432, w = 480, h = 72,  divx = 10,	       digit = 4, ref = 75},
		{id = "hub-hijjudgen-pr", src = "hub-src-hijjudge", x = 256, y = 432, w = 480, h = 72,  divx = 10,	       digit = 4, ref = 75},
		{id = "hub-hijjudgen-ms", src = "hub-src-hijjudge", x = 256, y = 432, w = 480, h = 72,  divx = 10,	       digit = 4, ref = 75},
	}
	parts.judge = {}
	
	do
		local init = {"pg", "gr", "gd", "bd", "pr", "ms"}
		for i = 1, #judge_data.id do -- 5~14鍵なら多分1か2が入るはず
			table.insert(parts.judge, {id = judge_data.id[i], index = judge_data.index[i], images = {}, numbers = {}, shift = true})
		end
		for i, v in ipairs(init) do
			table.insert(parts.judge[1].images,		{id = "hub-hijjudgef-" .. v, loop = -1, filter = 1, timer = 46 ,		offsets = {3,32},	dst = {{time = 0, x = judge.f.x - judgef_x_offsets[i], y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
			table.insert(parts.judge[1].numbers,	{id = "hub-hijjudgen-" .. v, loop = -1, filter = 1, timer = 46,								dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			if parts.judge[2] then
				table.insert(parts.judge[2].images,		{id = "hub-hijjudgef-" .. v, loop = -1, filter = 1, timer = 47 ,	offsets = {3,32},	dst = {{time = 0, x = judge.f.x2 - judgef_x_offsets[i], y = judge.f.y, w = judge.f.w, h = judge.f.h},{time = 500}}})
				table.insert(parts.judge[2].numbers,	{id = "hub-hijjudgen-" .. v, loop = -1, filter = 1, timer = 47,							dst = {{time = 0, x = judge.n.x, y = judge.n.y, w = judge.n.w, h = judge.n.h},{time = 500}}})
			end
		end
	end
	
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
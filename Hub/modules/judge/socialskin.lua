local parts = {}

local function load(folder_path, lanes, judge_data, offset, size)

	local judge = {
		f = {
			{w = 120, h = 23.25},
			{w = 160, h = 31}
		},
		n = {
			{x = 60, y = -41.25, w = 21.75, h = 28.5},
			{x = 79.75, y = -45.333332, w = 29, h = 38}
		}
	}
	judge.stretch = offset.h / judge.f[2].h
	if judge.stretch < 1 then
		judge.f[1].w	= judge.f[1].w * judge.stretch
		judge.f[2].w	= judge.f[2].w * judge.stretch
		judge.f[1].h	= judge.f[1].h * judge.stretch
		judge.f[2].h	= judge.f[2].h * judge.stretch
		judge.n[1].x	= judge.n[1].x * judge.stretch
		judge.n[2].x	= judge.n[2].x * judge.stretch
		judge.n[1].w	= judge.n[1].w * judge.stretch
		judge.n[2].w	= judge.n[2].w * judge.stretch
		judge.n[1].h	= judge.n[1].h * judge.stretch
		judge.n[2].h	= judge.n[2].h * judge.stretch
	end
	
	judge.f[1].w = judge.f[1].w + ((judge.f[1].w / 100) * size.x)
	judge.f[2].w = judge.f[2].w + ((judge.f[2].w / 100) * size.x)
	judge.f[1].h = judge.f[1].h + ((judge.f[1].h / 100) * size.x)
	judge.f[2].h = judge.f[2].h + ((judge.f[2].h / 100) * size.x)
	
	judge.n[1].x = judge.n[1].x + ((judge.n[1].x / 100) * size.x)
	judge.n[2].x = judge.n[2].x + ((judge.n[2].x / 100) * size.x)
	judge.n[1].y = judge.n[1].y + ((judge.n[1].y / 100) * size.x)
	judge.n[2].y = judge.n[2].y + ((judge.n[2].y / 100) * size.x)
	judge.n[1].w = judge.n[1].w + ((judge.n[1].w / 100) * size.x)
	judge.n[2].w = judge.n[2].w + ((judge.n[2].w / 100) * size.x)
	judge.n[1].h = judge.n[1].h + ((judge.n[1].h / 100) * size.x)
	judge.n[2].h = judge.n[2].h + ((judge.n[2].h / 100) * size.x)
	
	judge.f[1].x	= lanes.x_center - (judge.f[1].w / 2)
	judge.f[2].x	= lanes.x_center - (judge.f[2].w / 2)
	
	judge.f[1].x2	= lanes.x_center2 - (judge.f[1].w / 2)
	judge.f[2].x2	= lanes.x_center2 - (judge.f[2].w / 2)
	
	judge.f[1].y	= lanes.y + offset.y - (judge.f[1].h / 2) - ((judge.f[1].h - offset.h) / 2)
	judge.f[2].y	= lanes.y + offset.y - (judge.f[2].h / 2) - ((judge.f[2].h - offset.h) / 2)
	
	parts.source = {
		--{id = "hub-src-ssparts", path = folder_path[1]},
		{id = "hub-src-ssjudge", path = folder_path[2]},
		{id = "hub-src-sscombo", path = folder_path[3]}
	}

	parts.image = {
		--{id = "comboText", src = "hub-src-ssparts", x = 360, y = 0, w = 92, h = 23},
		{id = "hub-ss-judgef-pg", src = "hub-src-ssjudge", x = 0, y = 0,   w = 160, h = 31},
		{id = "hub-ss-judgef-gr", src = "hub-src-ssjudge", x = 0, y = 31,  w = 160, h = 31},
		{id = "hub-ss-judgef-gd", src = "hub-src-ssjudge", x = 0, y = 62,  w = 160, h = 31},
		{id = "hub-ss-judgef-bd", src = "hub-src-ssjudge", x = 0, y = 93,  w = 160, h = 31},
		{id = "hub-ss-judgef-pr", src = "hub-src-ssjudge", x = 0, y = 124, w = 160, h = 31},
		{id = "hub-ss-judgef-ms", src = "hub-src-ssjudge", x = 0, y = 155, w = 160, h = 31}
	}
	parts.value = {
		{id = "hub-ss-judgen", src = "hub-src-sscombo", x = 0, y = 0, w = 290, h = 38, divx = 10, digit = 6, align = 2, ref = 75}
	}
	
	parts.judge = {}
	
	do
		local init = {"pg", "gr", "gd", "bd", "pr", "ms"}
		for i = 1, #judge_data.id do -- 5~14鍵なら多分1か2が入るはず
			table.insert(parts.judge, {id = judge_data.id[i], index = judge_data.index[i], images = {}, numbers = {}, shift = false})
		end
		for i, v in ipairs(init) do
			table.insert(parts.judge[1].images, {id = "hub-ss-judgef-" .. v, loop = -1, filter = 1, timer = 46 ,offsets = {3,32}, dst = {
				{time = 0,  x = judge.f[1].x, y = judge.f[1].y, w = judge.f[1].w, h = judge.f[1].h},
				{time = 75, x = judge.f[2].x, y = judge.f[2].y, w = judge.f[2].w, h = judge.f[2].h},
				{time = 1000}
			}})
			table.insert(parts.judge[1].numbers, {id = "hub-ss-judgen", loop = -1, filter = 1, timer = 46, dst = {
				{time = 0,  x = judge.n[1].x, y = judge.n[1].y, w = judge.n[1].w, h = judge.n[1].h},
				{time = 75, x = judge.n[2].x, y = judge.n[2].y, w = judge.n[2].w, h = judge.n[2].h},
				{time = 1000}
			}})
			if parts.judge[2] then
				table.insert(parts.judge[2].images, {id = "hub-ss-judgef-" .. v, loop = -1, filter = 1, timer = 47 ,offsets = {3,32}, dst = {
					{time = 0,  x = judge.f[1].x2, y = judge.f[1].y, w = judge.f[1].w, h = judge.f[1].h},
					{time = 75, x = judge.f[2].x2, y = judge.f[2].y, w = judge.f[2].w, h = judge.f[2].h},
					{time = 1000}
				}})
				table.insert(parts.judge[2].numbers, {id = "hub-ss-judgen", loop = -1, filter = 1, timer = 47, dst = {
					{time = 0,  x = judge.n[1].x, y = judge.n[1].y, w = judge.n[1].w, h = judge.n[1].h},
					{time = 75, x = judge.n[2].x, y = judge.n[2].y, w = judge.n[2].w, h = judge.n[2].h},
					{time = 1000}
				}})
			end
		end
	end
	
	parts.destination = {}
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
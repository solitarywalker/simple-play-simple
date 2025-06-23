local parts = {}

local function load(g)
	
	local parts = dofile(skin_config.get_path("../customize/judge/*") .. "/judge.lua")
	local judge = {}
	judge.fx = {0, 0}
	judge.fy = {0, 0}
	
	judge.fw = parts.JUDGEF_WIDTH	* g.lanes.judge.magnification
	judge.fh = parts.JUDGEF_HEIGHT	* g.lanes.judge.magnification
	judge.nw = parts.JUDGEN_WIDTH	* g.lanes.judge.magnification
	judge.nh = parts.JUDGEN_HEIGHT	* g.lanes.judge.magnification
	
	judge.fx[1] = g.lanes.center_x[1] - ((judge.fw + (parts.JUDGE_SPACE * g.lanes.judge.magnification)) / 2)
	judge.fy[1] = g.lanes.judge.y[1]
	if g.lanes.x[2] then
		judge.fx[2] = g.lanes.center_x[2] - ((judge.fw + (parts.JUDGE_SPACE * g.lanes.judge.magnification)) / 2)
		judge.fy[2] = g.lanes.judge.y[2]
	end
	judge.nx = judge.fw + (parts.JUDGE_SPACE * g.lanes.judge.magnification)
	judge.ny = 0
	
	judge.time_scale	= 100
	judge.fw_scale		= 0
	judge.fh_scale		= 0
	judge.fa_scale		= 255
	judge.nw_scale		= 0
	judge.nh_scale		= 0
	judge.na_scale		= 255
	
	if parts.JUDGE_SCALE_ANIMATION_TIME		then judge.time_scale	= parts.JUDGE_SCALE_ANIMATION_TIME		end
	if parts.JUDGEF_SCALE_ANIMATION_WIDTH	then judge.fw_scale		= parts.JUDGEF_SCALE_ANIMATION_WIDTH	* g.lanes.judge.magnification	end
	if parts.JUDGEF_SCALE_ANIMATION_HEIGHT	then judge.fh_scale		= parts.JUDGEF_SCALE_ANIMATION_HEIGHT	* g.lanes.judge.magnification	end
	if parts.JUDGEF_SCALE_ANIMATION_OPACITY	then judge.fa_scale		= parts.JUDGEF_SCALE_ANIMATION_OPACITY	end
	if parts.JUDGEN_SCALE_ANIMATION_WIDTH	then judge.nw_scale		= parts.JUDGEN_SCALE_ANIMATION_WIDTH	* g.lanes.judge.magnification	end
	if parts.JUDGEN_SCALE_ANIMATION_HEIGHT	then judge.nh_scale		= parts.JUDGEN_SCALE_ANIMATION_HEIGHT	* g.lanes.judge.magnification	end
	if parts.JUDGEN_SCALE_ANIMATION_OPACITY	then judge.na_scale		= parts.JUDGEN_SCALE_ANIMATION_OPACITY	end
	
	judge.h = judge.fh
	judge.shift	= true
	
	if judge.fh < judge.nh then judge.h = judge.nh end
	
	if parts.JUDGE_FORMAT == 2 then
		judge.shift	= false
		judge.fx[1]	= g.lanes.center_x[1] - (judge.fw / 2)
		if g.lanes.x[2] then judge.fx[2] = g.lanes.center_x[2] - (judge.fw / 2) end
		judge.nx	= judge.fw / 2
		judge.ny	= judge.fh + parts.JUDGE_SPACE
		judge.h		= judge.fh + judge.nh + parts.JUDGE_SPACE
		
	elseif parts.JUDGE_FORMAT == 3 then
		judge.shift	= false
		judge.fx[1]	= g.lanes.center_x[1] - (judge.fw / 2)
		if g.lanes.x[2] then judge.fx[2] = g.lanes.center_x[2] - (judge.fw / 2) end
		judge.nx	= judge.fw / 2
		judge.fy[1]	= judge.fy[1] + judge.nh + parts.JUDGE_SPACE
		judge.fy[2]	= judge.fy[2] + judge.nh + parts.JUDGE_SPACE
		judge.ny	= (judge.nh + parts.JUDGE_SPACE) * -1
		judge.h		= judge.fh + judge.nh + parts.JUDGE_SPACE
	end
	
	parts.source = {
		{id = "src-pg",				path = "../customize/judge/*" .. "/F_PG.png"},
		{id = "src-gr",				path = "../customize/judge/*" .. "/F_GR.png"},
		{id = "src-gd",				path = "../customize/judge/*" .. "/F_GD.png"},
		{id = "src-bd",				path = "../customize/judge/*" .. "/F_BD.png"},
		{id = "src-pr",				path = "../customize/judge/*" .. "/F_PR.png"},
		{id = "src-pgn",			path = "../customize/judge/*" .. "/N_PG.png"},
		{id = "src-grn",			path = "../customize/judge/*" .. "/N_GR.png"},
		{id = "src-gdn",			path = "../customize/judge/*" .. "/N_GD.png"}
	}
	
	parts.image = {
		{id = "judgef-pg", src = "src-pg", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_PG, cycle = parts.JUDGE_ANIMATION_CYCLE_PG},
		{id = "judgef-gr", src = "src-gr", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_GR, cycle = parts.JUDGE_ANIMATION_CYCLE_GR},
		{id = "judgef-gd", src = "src-gd", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_GD, cycle = parts.JUDGE_ANIMATION_CYCLE_GD},
		{id = "judgef-bd", src = "src-bd", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_BD, cycle = parts.JUDGE_ANIMATION_CYCLE_BD},
		{id = "judgef-pr", src = "src-pr", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_PR, cycle = parts.JUDGE_ANIMATION_CYCLE_PR},
		{id = "judgef-ms", src = "src-pr", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_PR, cycle = parts.JUDGE_ANIMATION_CYCLE_PR}
	}
	
	parts.value = {
		{id = "judgen-pg", src = "src-pgn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = parts.DIVY_N_PG, digit = 6, ref = 75, cycle = parts.JUDGE_ANIMATION_CYCLE_PG},
		{id = "judgen-gr", src = "src-grn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = parts.DIVY_N_GR, digit = 6, ref = 75, cycle = parts.JUDGE_ANIMATION_CYCLE_GR},
		{id = "judgen-gd", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = parts.DIVY_N_GD, digit = 6, ref = 75, cycle = parts.JUDGE_ANIMATION_CYCLE_GD},
		{id = "judgen-bd", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = parts.DIVY_N_GD, digit = 6, ref = 75, cycle = parts.JUDGE_ANIMATION_CYCLE_GD},
		{id = "judgen-pr", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = parts.DIVY_N_GD, digit = 6, ref = 75, cycle = parts.JUDGE_ANIMATION_CYCLE_GD},
		{id = "judgen-ms", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = parts.DIVY_N_GD, digit = 6, ref = 75, cycle = parts.JUDGE_ANIMATION_CYCLE_GD}
	}
		
	parts.judge = {}
	do
		judge.images	= {{}, {}}
		judge.numbers	= {{}, {}}
		judge.images9	= {p1 = {}, p2 = {}, p3 = {}}
		judge.numbers9	= {p1 = {}, p2 = {}, p3 = {}}
		local def = {
			y		= {},
			w		= judge.fw + judge.fw_scale,
			h		= judge.fh + judge.fh_scale,
			offset	= (g.lanes.w[1] / 9) * 3
		}
		def.y[1]	= judge.fy[1] - (judge.fh_scale / 2)
		def.y[2]	= judge.fy[2] - (judge.fh_scale / 2)
		local judge_types = {"pg","gr","gd","bd","pr","ms"}
		
		for i, v in ipairs(judge_types) do
			if v == "bd" then
				judge.fx[1] = g.lanes.center_x[1] - (judge.fw / 2)
				if g.lanes.x[2] then judge.fx[2] = g.lanes.center_x[2] - (judge.fw / 2) end
			end
			
			table.insert(judge.images[1], {id = "judgef-" .. v, filter = 1, loop = -1, timer = 46, offsets = {3,32}, dst = {
				{time = 0,					x = judge.fx[1] - (judge.fw_scale / 2),	y = def.y[1],		w = def.w,		h = def.h,		a = judge.fa_scale},
				{time = judge.time_scale,	x = judge.fx[1],						y = judge.fy[1],	w = judge.fw,	h = judge.fh,	a = 255},
				{time = 500}
			}})
			
			table.insert(judge.numbers[1], {id = "judgen-" .. v, filter = 1, loop = -1, timer = 46, dst = {
				{time = 0,					x = (judge.nx + (judge.fw_scale / 2)) - (judge.nw_scale / 2),	y = (judge.ny + (judge.fh_scale / 2)) - (judge.nh_scale / 2),	w = judge.nw + judge.nw_scale,	h = judge.nh + judge.nh_scale,	a = judge.na_scale},
				{time = judge.time_scale,	x = judge.nx,													y = judge.ny,													w = judge.nw,					h = judge.nh,					a = 255},
				{time = 500}
			}})
			
			if g.type == 2 or g.type == 3 then
				table.insert(judge.images[2], {id = "judgef-" .. v, filter = 1, loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0,					x = judge.fx[2] - (judge.fw_scale / 2),	y = def.y[2],		w = def.w,		h = def.h,		a = judge.fa_scale},
					{time = judge.time_scale,	x = judge.fx[2],						y = judge.fy[2],	w = judge.fw,	h = judge.fh,	a = 255},
					{time = 500}
				}})
				
				table.insert(judge.numbers[2], {id = "judgen-" .. v, filter = 1, loop = -1, timer = 47, dst = {
					{time = 0,					x = (judge.nx + (judge.fw_scale / 2)) - (judge.nw_scale / 2),	y = (judge.ny + (judge.fh_scale / 2)) - (judge.nh_scale / 2),	w = judge.nw + judge.nw_scale,	h = judge.nh + judge.nh_scale,	a = judge.na_scale},
					{time = judge.time_scale,	x = judge.nx,													y = judge.ny,													w = judge.nw,					h = judge.nh,					a = 255},
					{time = 500}
				}})
			end
			
			-- 3列判定
			table.insert(judge.images9.p1, {id = "judgef-" .. v, filter = 1, loop = -1, timer = 46, offsets = {3,32}, dst = {
				{time = 0,					x = judge.fx[1] - (judge.fw_scale / 2) - def.offset,	y = def.y[1],		w = def.w,		h = def.h, a = judge.fa_scale},
				{time = judge.time_scale,	x = judge.fx[1] - def.offset,							y = judge.fy[1],	w = judge.fw,	h = judge.fh, a = 255},
				{time = 500}
			}})
			table.insert(judge.numbers9.p1, {id = "judgen-" .. v, filter = 1, loop = -1, timer = 46, dst = {
				{time = 0,					x = (judge.nx + (judge.fw_scale / 2)) - (judge.nw_scale / 2),	y = (judge.ny + (judge.fh_scale / 2)) - (judge.nh_scale / 2),	w = judge.nw + judge.nw_scale,	h = judge.nh + judge.nh_scale,	a = judge.na_scale},
				{time = judge.time_scale,	x = judge.nx,													y = judge.ny,													w = judge.nw,					h = judge.nh,					a = 255},
				{time = 500}
			}})
			table.insert(judge.images9.p2, {id = "judgef-" .. v, filter = 1, loop = -1, timer = 47, offsets = {3,32}, dst = {
				{time = 0,					x = judge.fx[1] - (judge.fw_scale / 2),	y = def.y[1],		w = def.w,		h = def.h, a = judge.fa_scale},
				{time = judge.time_scale,	x = judge.fx[1],						y = judge.fy[1],	w = judge.fw,	h = judge.fh, a = 255},
				{time = 500}
			}})
			table.insert(judge.numbers9.p2, {id = "judgen-" .. v, filter = 1, loop = -1, timer = 47, dst = {
				{time = 0,					x = (judge.nx + (judge.fw_scale / 2)) - (judge.nw_scale / 2),	y = (judge.ny + (judge.fh_scale / 2)) - (judge.nh_scale / 2),	w = judge.nw + judge.nw_scale,	h = judge.nh + judge.nh_scale,	a = judge.na_scale},
				{time = judge.time_scale,	x = judge.nx,													y = judge.ny,													w = judge.nw,					h = judge.nh,					a = 255},
				{time = 500}
			}})
			table.insert(judge.images9.p3, {id = "judgef-" .. v, filter = 1, loop = -1, timer = 247, offsets = {3,32}, dst = {
				{time = 0,					x = judge.fx[1] - (judge.fw_scale / 2) + def.offset,	y = def.y[1],		w = def.w,		h = def.h, a = judge.fa_scale},
				{time = judge.time_scale,	x = judge.fx[1] + def.offset,							y = judge.fy[1],	w = judge.fw,	h = judge.fh, a = 255},
				{time = 500}
			}})
			table.insert(judge.numbers9.p3, {id = "judgen-" .. v, filter = 1, loop = -1, timer = 247, dst = {
				{time = 0,					x = (judge.nx + (judge.fw_scale / 2)) - (judge.nw_scale / 2),	y = (judge.ny + (judge.fh_scale / 2)) - (judge.nh_scale / 2),	w = judge.nw + judge.nw_scale,	h = judge.nh + judge.nh_scale,	a = judge.na_scale},
				{time = judge.time_scale,	x = judge.nx,													y = judge.ny,													w = judge.nw,					h = judge.nh,					a = 255},
				{time = 500}
			}})
		end	
		
		if g.type == 4 and parts.JUDGE_3ROW then
			parts.judge = {
				{id = "judge1", index = 0, images = judge.images9.p1, numbers = judge.numbers9.p1, shift = judge.shift},
				{id = "judge2", index = 1, images = judge.images9.p2, numbers = judge.numbers9.p2, shift = judge.shift},
				{id = "judge3", index = 2, images = judge.images9.p3, numbers = judge.numbers9.p3, shift = judge.shift}
			}
		elseif g.type == 2 or g.type == 3 then
			parts.judge = {
				{id = "judge1", index = 0, images = judge.images[1], numbers = judge.numbers[1], shift = judge.shift},
				{id = "judge2", index = 1, images = judge.images[2], numbers = judge.numbers[2], shift = judge.shift}
			}
		else
			parts.judge = {
				{id = "judge", index = 0, images = judge.images[1], numbers = judge.numbers[1], shift = judge.shift}
			}
		end
	end
		
	parts.destination = {}
	if g.type == 4 and parts.JUDGE_3ROW then
		parts.destination = {
			{id = "judge1"},
			{id = "judge2"},
			{id = "judge3"}
		}
	elseif g.type == 2 or g.type == 3 then
		parts.destination = {
			{id = "judge1"},
			{id = "judge2"},
		}
	else
		parts.destination = {
			{id = "judge"}
		}
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
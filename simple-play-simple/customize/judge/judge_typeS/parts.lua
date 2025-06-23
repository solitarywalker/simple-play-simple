local parts = {}
local main_state = require("main_state")

local function load(g)
	
	local parts = dofile(skin_config.get_path("../customize/judge/*") .. "/judge.lua")
	local judge = {}
	judge.fx = {0, 0}
	judge.fy = {0, 0}
	
	judge.fw = parts.JUDGEF_WIDTH * g.lanes.judge.magnification
	judge.fh = parts.JUDGEF_HEIGHT * g.lanes.judge.magnification
	judge.nw = parts.JUDGEN_WIDTH * g.lanes.judge.magnification
	judge.nh = parts.JUDGEN_HEIGHT * g.lanes.judge.magnification
	
	judge.fx[1] = g.lanes.center_x[1] - ((judge.fw + parts.JUDGE_SPACE * g.lanes.judge.magnification) / 2)
	judge.fy[1] = g.lanes.judge.y[1]
	if g.lanes.x[2] then
		judge.fx[2] = g.lanes.center_x[2] - ((judge.fw + parts.JUDGE_SPACE * g.lanes.judge.magnification) / 2)
		judge.fy[2] = g.lanes.judge.y[2]
	end
	judge.nx = judge.fw + parts.JUDGE_SPACE * g.lanes.judge.magnification
	judge.ny = 0
	
	judge.time_scale	= 100
	judge.fw_scale		= 0
	judge.fh_scale		= 0
	judge.fa_scale		= 255
	judge.nw_scale		= 0
	judge.nh_scale		= 0
	judge.na_scale		= 255
	
	if parts.JUDGE_SCALE_ANIMATION_TIME		then judge.time_scale	= parts.JUDGE_SCALE_ANIMATION_TIME		end
	if parts.JUDGEF_SCALE_ANIMATION_WIDTH	then judge.fw_scale		= parts.JUDGEF_SCALE_ANIMATION_WIDTH * g.lanes.judge.magnification	end
	if parts.JUDGEF_SCALE_ANIMATION_HEIGHT	then judge.fh_scale		= parts.JUDGEF_SCALE_ANIMATION_HEIGHT * g.lanes.judge.magnification	end
	if parts.JUDGEF_SCALE_ANIMATION_OPACITY	then judge.fa_scale		= parts.JUDGEF_SCALE_ANIMATION_OPACITY	end
	if parts.JUDGEN_SCALE_ANIMATION_WIDTH	then judge.nw_scale		= parts.JUDGEN_SCALE_ANIMATION_WIDTH * g.lanes.judge.magnification	end
	if parts.JUDGEN_SCALE_ANIMATION_HEIGHT	then judge.nh_scale		= parts.JUDGEN_SCALE_ANIMATION_HEIGHT * g.lanes.judge.magnification	end
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
		{id = "src-gdn",			path = "../customize/judge/*" .. "/N_GD.png"},
		{id = "src-judge-typeS",	path = "../customize/judge/*" .. "/parts.png"}
	}
	
	local id = {
		dm = "ex-judge-typeS-dummy",
		pg = "ex-judge-typeS-pg",
		gr = "ex-judge-typeS-gr",
		gd = "ex-judge-typeS-gd",
		bd = "ex-judge-typeS-bd",
		pr = "ex-judge-typeS-pr"
	}
	parts.image = {
		{id = "judgef-pg", src = "src-pg", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_PG, cycle = parts.JUDGE_ANIMATION_CYCLE_PG},
		{id = "judgef-gr", src = "src-gr", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_GR, cycle = parts.JUDGE_ANIMATION_CYCLE_GR},
		{id = "judgef-gd", src = "src-gd", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_GD, cycle = parts.JUDGE_ANIMATION_CYCLE_GD},
		{id = "judgef-bd", src = "src-bd", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_BD, cycle = parts.JUDGE_ANIMATION_CYCLE_BD},
		{id = "judgef-pr", src = "src-pr", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_PR, cycle = parts.JUDGE_ANIMATION_CYCLE_PR},
		{id = "judgef-ms", src = "src-pr", x = 0, y = 0, w = -1, h = -1, divy = parts.DIVY_F_PR, cycle = parts.JUDGE_ANIMATION_CYCLE_PR},
		{id = id.dm, src = "src-judge-typeS", x = 511, y = 511, w = 1, h = 1},
		{id = id.pg, src = "src-judge-typeS", x = 0, y = 0, w = 128, h = 17},
		{id = id.gr, src = "src-judge-typeS", x = 0, y = 17, w = 128, h = 17},
		{id = id.gd, src = "src-judge-typeS", x = 0, y = 34, w = 128, h = 17},
		{id = id.bd, src = "src-judge-typeS", x = 0, y = 51, w = 128, h = 17},
		{id = id.pr, src = "src-judge-typeS", x = 0, y = 68, w = 128, h = 17}
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
				{time = judge.time_scale,	x = judge.fx[1] ,			y = judge.fy[1],	w = judge.fw,	h = judge.fh, a = 255},
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
	
	-- 各レーン毎の判定
	do
		local judge_width = 128 * g.lanes.judge.magnification
		local judge_height = 17 * g.lanes.judge.magnification
		local judge_y = {}
		local bs_judge_y = {}
		local judge_x = {{}, {}}
		judge_y[1] = g.lanes.inside.y[1] + 100
		bs_judge_y[1] = judge_y[1]
		do
			for i, v in ipairs(g.lane.lane.order[1]) do
				judge_x[1][v]	= g.lane.center_x[1][v] - (judge_width / 2)
			end
		end
		if g.type == 2 or g.type == 3 then
			judge_y[2] = g.lanes.inside.y[2] + 100
			bs_judge_y[2] = judge_y[2]
			do
				for i, v in ipairs(g.lane.lane.order[2]) do
					judge_x[2][v]	= g.lane.center_x[2][v] - (judge_width / 2)
				end
			end
		end
		
		local function flag(num)
			if main_state.timer(70 + num) == main_state.timer_off_value then
				return true
			else
				return false
			end
		end
		local function flag2(num)
			if main_state.timer(80 + num) == main_state.timer_off_value then
				return true
			else
				return false
			end
		end
		
		parts.imageset = {
			-- VALUE_JUDGE 500~
			-- {未定義, PG, GR(FAST), GR(SLOW). … KP(FAST), KP(SLOW)}
			{id = "ex-judge-typeS-judge11", ref = 501, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge12", ref = 502, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge13", ref = 503, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge14", ref = 504, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge15", ref = 505, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge16", ref = 506, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge17", ref = 507, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge18", ref = 508, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge19", ref = 509, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
			{id = "ex-judge-typeS-judge1s", ref = 500, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
		}
		if g.type == 2 or g.type == 3 then
			parts.imageset = {
				-- VALUE_JUDGE 500~
				-- {未定義, PG, GR(FAST), GR(SLOW). … KP(FAST), KP(SLOW)}
				{id = "ex-judge-typeS-judge11", ref = 501, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge12", ref = 502, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge13", ref = 503, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge14", ref = 504, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge15", ref = 505, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge16", ref = 506, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge17", ref = 507, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge18", ref = 508, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge19", ref = 509, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge1s", ref = 500, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge21", ref = 511, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge22", ref = 512, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge23", ref = 513, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge24", ref = 514, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge25", ref = 515, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge26", ref = 516, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge27", ref = 517, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge28", ref = 518, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge29", ref = 519, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}},
				{id = "ex-judge-typeS-judge2s", ref = 510, images = {id.dm, id.pg, id.gr, id.gr, id.gd, id.gd, id.bd, id.bd, id.pr, id.pr, id.pr, id.pr}}
			}
		end
		local key_types = {}
		if		g.type == 0 or g.type == 2	then key_types = {"w", "b", "w", "b", "w", "b", "w", "s"}
		elseif	g.type == 1 or g.type == 3	then key_types = {"w", "b", "w", "b", "w", "s"}
		elseif	g.type == 4					then key_types = {"w", "b", "w", "b", "w", "b", "w", "b", "w"}
		end
		for i, v in ipairs(key_types) do
			if v == "w" then
				table.insert(parts.destination, {id = "ex-judge-typeS-judge1" .. i,	timer = 100 + i, loop = 10, offsets = {3}, draw = function() return flag(i) end,	dst = {{time = 0, x = judge_x[1][i], y = judge_y[1], w = judge_width, h = judge_height, acc = 2},{time = 10}}})
				table.insert(parts.destination, {id = "ex-judge-typeS-judge1" .. i,	timer = 120 + i, loop = -1, offsets = {3}, draw = function() return flag(i) end,	dst = {{time = 0, x = judge_x[1][i], y = judge_y[1], w = judge_width, h = judge_height, a = 255, acc = 2},{time = 300},{time = 360, a = 0}}})
			elseif v == "b" then
				table.insert(parts.destination, {id = "ex-judge-typeS-judge1" .. i,	timer = 100 + i, loop = 10, offsets = {3}, draw = function() return flag(i) end,	dst = {{time = 0, x = judge_x[1][i], y = bs_judge_y[1], w = judge_width, h = judge_height, acc = 2},{time = 10}}})
				table.insert(parts.destination, {id = "ex-judge-typeS-judge1" .. i,	timer = 120 + i, loop = -1, offsets = {3}, draw = function() return flag(i) end,	dst = {{time = 0, x = judge_x[1][i], y = bs_judge_y[1], w = judge_width, h = judge_height, a = 255, acc = 2},{time = 300},{time = 360, a = 0}}})
			elseif v == "s" then
				table.insert(parts.destination, {id = "ex-judge-typeS-judge1s",		timer = 100, loop = 10, offsets = {3}, draw = function() return flag(0) end,		dst = {{time = 0, x = judge_x[1][i], y = bs_judge_y[1], w = judge_width, h = judge_height, acc = 2},{time = 10}}})
				table.insert(parts.destination, {id = "ex-judge-typeS-judge1s",		timer = 120, loop = -1, offsets = {3}, draw = function() return flag(0) end,		dst = {{time = 0, x = judge_x[1][i], y = bs_judge_y[1], w = judge_width, h = judge_height, a = 255, acc = 2},{time = 300},{time = 360, a = 0}}})
			end
			if g.type == 2 or g.type == 3 then
				if v == "w" then
					table.insert(parts.destination, {id = "ex-judge-typeS-judge2" .. i,	timer = 110 + i, loop = 10, offsets = {3}, draw = function() return flag2(i) end,	dst = {{time = 0, x = judge_x[2][i], y = judge_y[2], w = judge_width, h = judge_height, acc = 2},{time = 10}}})
					table.insert(parts.destination, {id = "ex-judge-typeS-judge2" .. i,	timer = 130 + i, loop = -1, offsets = {3}, draw = function() return flag2(i) end,	dst = {{time = 0, x = judge_x[2][i], y = judge_y[2], w = judge_width, h = judge_height, a = 255, acc = 2},{time = 300},{time = 360, a = 0}}})
				elseif v == "b" then
					table.insert(parts.destination, {id = "ex-judge-typeS-judge2" .. i,	timer = 110 + i, loop = 10, offsets = {3}, draw = function() return flag2(i) end,	dst = {{time = 0, x = judge_x[2][i], y = bs_judge_y[2], w = judge_width, h = judge_height, acc = 2},{time = 10}}})
					table.insert(parts.destination, {id = "ex-judge-typeS-judge2" .. i,	timer = 130 + i, loop = -1, offsets = {3}, draw = function() return flag2(i) end,	dst = {{time = 0, x = judge_x[2][i], y = bs_judge_y[2], w = judge_width, h = judge_height, a = 255, acc = 2},{time = 300},{time = 360, a = 0}}})
				elseif v == "s" then
					table.insert(parts.destination, {id = "ex-judge-typeS-judge2s",		timer = 110, loop = 10, offsets = {3}, draw = function() return flag2(0) end,		dst = {{time = 0, x = judge_x[2][i], y = bs_judge_y[2], w = judge_width, h = judge_height, acc = 2},{time = 10}}})
					table.insert(parts.destination, {id = "ex-judge-typeS-judge2s",		timer = 130, loop = -1, offsets = {3}, draw = function() return flag2(0) end,		dst = {{time = 0, x = judge_x[2][i], y = bs_judge_y[2], w = judge_width, h = judge_height, a = 255, acc = 2},{time = 300},{time = 360, a = 0}}})
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
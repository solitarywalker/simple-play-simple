local parts = {}

local function load(folder_path)
	
	parts.source = {
		{id = "hub-src-rgnotes", path = folder_path},
	}
	
	local notesInfo = {
		height = 12,
		Wh_width = 60,
		Bl_width = 48,
		Sc_width = 108,
		Wh_x = 216,
		Bl_x = 276,
		Ye_x = 324,
		Sc_x = 108,
		As_x = 0,
		Std_y = 12,
		lnEn_y = 48,
		lnSt_y = 84,
		lnAc_y = 168,
		lnBo_y = 120,
		hcEn_y = 228,
		hcSt_y = 264,
		hcBo_y = 120,
		hcAc_y = 300,
		hcDm_y = 300,
		hcRe_y = 336,

		lnCycle = 200,
		hcnCycle = 200,
		hcnDamageCycle = 100,

		mine_y = 360,
	}
	
	parts.image = {
		{id = "hub-note-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.Std_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-note-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.Std_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-note-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.Std_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-note-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.Std_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-lnSt-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.lnSt_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-lnSt-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.lnSt_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-lnSt-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.lnSt_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-lnSt-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.lnSt_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-lnEn-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.lnEn_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-lnEn-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.lnEn_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-lnEn-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.lnEn_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-lnEn-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.lnEn_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-lnBo-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.lnAc_y, w = notesInfo.Bl_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},
		{id = "hub-lnBo-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.lnAc_y, w = notesInfo.Wh_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},
		{id = "hub-lnBo-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.lnAc_y, w = notesInfo.Sc_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},
		{id = "hub-lnBo-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.lnAc_y, w = notesInfo.Bl_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},

		{id = "hub-lnAc-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.lnBo_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-lnAc-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.lnBo_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-lnAc-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.lnBo_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-lnAc-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.lnBo_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-hcSt-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.hcSt_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-hcSt-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.hcSt_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-hcSt-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.hcSt_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-hcSt-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.hcSt_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-hcEn-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.hcEn_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-hcEn-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.hcEn_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-hcEn-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.hcEn_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-hcEn-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.hcEn_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-hcAc-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.hcBo_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-hcAc-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.hcBo_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-hcAc-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.hcBo_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-hcAc-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.hcBo_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hub-hcBo-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.hcAc_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hub-hcBo-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.hcAc_y, w = notesInfo.Wh_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hub-hcBo-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.hcAc_y, w = notesInfo.Sc_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hub-hcBo-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.hcAc_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},

		{id = "hub-hcDm-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.hcDm_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hub-hcDm-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.hcDm_y, w = notesInfo.Wh_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hub-hcDm-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.hcDm_y, w = notesInfo.Sc_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hub-hcDm-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.hcDm_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},

		{id = "hub-hcRe-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.hcRe_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},
		{id = "hub-hcRe-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.hcRe_y, w = notesInfo.Wh_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},
		{id = "hub-hcRe-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.hcRe_y, w = notesInfo.Sc_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},
		{id = "hub-hcRe-Ye", src = "hub-src-rgnotes", x = notesInfo.Ye_x, y = notesInfo.hcRe_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},

		{id = "hub-mine-Bl", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.mine_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hub-mine-Wh", src = "hub-src-rgnotes", x = notesInfo.Wh_x, y = notesInfo.mine_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hub-mine-Sc", src = "hub-src-rgnotes", x = notesInfo.Sc_x, y = notesInfo.mine_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hub-mine-Ye", src = "hub-src-rgnotes", x = notesInfo.Bl_x, y = notesInfo.mine_y, w = notesInfo.Bl_width, h = notesInfo.height}
	}
	
	parts.note				= {}
	parts.note.note			= {}
	parts.note.lnend		= {}
	parts.note.lnstart		= {}
	parts.note.lnbody		= {}
	parts.note.lnactive		= {}
	parts.note.hcnend		= {}
	parts.note.hcnstart		= {}
	parts.note.hcnbody		= {}
	parts.note.hcnactive	= {}
	parts.note.hcndamage	= {}
	parts.note.hcnreactive	= {}
	parts.note.mine			= {}
	
	do
		local init = {}
		if		is_play_5keys()		then init = {"Wh", "Bl", "Wh", "Bl", "Wh", "Sc"}
		elseif	is_play_7keys()		then init = {"Wh", "Bl", "Wh", "Ye", "Wh", "Bl", "Wh", "Sc"}
		elseif	is_play_9keys()		then init = {"Wh", "Bl", "Wh", "Bl", "Wh", "Bl", "Wh", "Bl", "Wh"}
		elseif	is_play_10keys()	then init = {"Wh", "Bl", "Wh", "Bl", "Wh", "Sc", "Wh", "Bl", "Wh", "Bl", "Wh", "Sc"}
		elseif	is_play_14keys()	then init = {"Wh", "Bl", "Wh", "Ye", "Wh", "Bl", "Wh", "Sc", "Wh", "Bl", "Wh", "Ye", "Wh", "Bl", "Wh", "Sc"}
		end
		for i, v in pairs(init) do
			parts.note.note[i]			= "hub-note-" .. v
			parts.note.lnend[i]			= "hub-lnEn-" .. v
			parts.note.lnstart[i]		= "hub-lnSt-" .. v
			parts.note.lnbody[i]		= "hub-lnBo-" .. v
			parts.note.lnactive[i]		= "hub-lnAc-" .. v
			parts.note.hcnend[i]		= "hub-hcEn-" .. v
			parts.note.hcnstart[i]		= "hub-hcSt-" .. v
			parts.note.hcnbody[i]		= "hub-hcBo-" .. v
			parts.note.hcnactive[i]		= "hub-hcAc-" .. v
			parts.note.hcndamage[i]		= "hub-hcDm-" .. v
			parts.note.hcnreactive[i]	= "hub-hcRe-" .. v
			parts.note.mine[i]			= "hub-mine-" .. v
		end
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(folder_path)
	
	parts.source = {
		{id = "hub-src-mcnotes",	path = folder_path[1]},
		{id = "hub-src-mcmine",		path = folder_path[2]}
	}
	
	local v_x = {}
	local v_y = {}
	local v_w = {}
	local v_h = {}
	
	v_x = {216, 276, 108}
	v_y = {0, 72, 36, 144, 108, 252, 216, 288, 108, 324, 288}
	v_w = {60, 48, 108}
	v_h = {36, 72, 18}
	
	parts.image = {
		-- ノート
		{id = "hub-note-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[1], w = v_w[1], h = v_h[1]},
		{id = "hub-note-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[1], w = v_w[2], h = v_h[1]},
		{id = "hub-note-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[1], w = v_w[3], h = v_h[1]},
		-- ロングノート始点
		{id = "hub-lns-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[2], w = v_w[1], h = v_h[1]},
		{id = "hub-lns-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[2], w = v_w[2], h = v_h[1]},
		{id = "hub-lns-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[2], w = v_w[3], h = v_h[1]},
		-- ロングノート終点
		{id = "hub-lne-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[3], w = v_w[1], h = v_h[1]},
		{id = "hub-lne-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[3], w = v_w[2], h = v_h[1]},
		{id = "hub-lne-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[3], w = v_w[3], h = v_h[1]},
		-- ロングノートアクティブ
		{id = "hub-lnb-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[4], w = v_w[1], h = v_h[2], divy = 2, cycle = 200},
		{id = "hub-lnb-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[4], w = v_w[2], h = v_h[2], divy = 2, cycle = 200},
		{id = "hub-lnb-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[4], w = v_w[3], h = v_h[2], divy = 2, cycle = 200},
		-- ロングノート非アクティブ
		{id = "hub-lna-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[5], w = v_w[1], h = v_h[1]},
		{id = "hub-lna-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[5], w = v_w[2], h = v_h[1]},
		{id = "hub-lna-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[5], w = v_w[3], h = v_h[1]},
		-- ヘルチャージノート始点
		{id = "hub-hcns-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[6], w = v_w[1], h = v_h[1]},
		{id = "hub-hcns-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[6], w = v_w[2], h = v_h[1]},
		{id = "hub-hcns-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[6], w = v_w[3], h = v_h[1]},
		-- ヘルチャージノート終点
		{id = "hub-hcne-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[7], w = v_w[1], h = v_h[1]},
		{id = "hub-hcne-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[7], w = v_w[2], h = v_h[1]},
		{id = "hub-hcne-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[7], w = v_w[3], h = v_h[1]},
		-- ヘルチャージノートアクティブ
		{id = "hub-hcnb-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[8], w = v_w[1], h = v_h[1], divy = 2, cycle = 200},
		{id = "hub-hcnb-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[8], w = v_w[2], h = v_h[1], divy = 2, cycle = 200},
		{id = "hub-hcnb-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[8], w = v_w[3], h = v_h[1], divy = 2, cycle = 200},
		-- ヘルチャージノート非アクティブ
		{id = "hub-hcna-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[9], w = v_w[1], h = v_h[3]},
		{id = "hub-hcna-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[9], w = v_w[2], h = v_h[3]},
		{id = "hub-hcna-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[9], w = v_w[3], h = v_h[3]},
		-- ヘルチャージノートダメージ
		{id = "hub-hcnr-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[10], w = v_w[1], h = v_h[1], divy = 2, cycle = 200},
		{id = "hub-hcnr-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[10], w = v_w[2], h = v_h[1], divy = 2, cycle = 200},
		{id = "hub-hcnr-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[10], w = v_w[3], h = v_h[1], divy = 2, cycle = 200},
		-- ヘルチャージノートリアクティブ
		{id = "hub-hcnd-w", src = "hub-src-mcnotes", x = v_x[1], y = v_y[11], w = v_w[1], h = v_h[1], divy = 2, cycle = 100},
		{id = "hub-hcnd-b", src = "hub-src-mcnotes", x = v_x[2], y = v_y[11], w = v_w[2], h = v_h[1], divy = 2, cycle = 100},
		{id = "hub-hcnd-s", src = "hub-src-mcnotes", x = v_x[3], y = v_y[11], w = v_w[3], h = v_h[1], divy = 2, cycle = 100},
		-- 地雷
		{id = "hub-mine-w", src = "hub-src-mcmine", x = v_x[1], y = v_y[1], w = v_w[1], h = v_h[1]},
		{id = "hub-mine-b", src = "hub-src-mcmine", x = v_x[2], y = v_y[1], w = v_w[2], h = v_h[1]},
		{id = "hub-mine-s", src = "hub-src-mcmine", x = v_x[3], y = v_y[1], w = v_w[3], h = v_h[1]}
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
		if		is_play_5keys()		then init = {"w", "b", "w", "b", "w", "s"}
		elseif	is_play_7keys()		then init = {"w", "b", "w", "b", "w", "b", "w", "s"}
		elseif	is_play_9keys()		then init = {"w", "b", "w", "b", "w", "b", "w", "b", "w"}
		elseif	is_play_10keys()	then init = {"w", "b", "w", "b", "w", "s", "w", "b", "w", "b", "w", "s"}
		elseif	is_play_14keys()	then init = {"w", "b", "w", "b", "w", "b", "w", "s", "w", "b", "w", "b", "w", "b", "w", "s"}
		end
		for i, v in pairs(init) do
			parts.note.note[i]			= "hub-note-" .. v
			parts.note.lnend[i]			= "hub-lne-" .. v
			parts.note.lnstart[i]		= "hub-lns-" .. v
			parts.note.lnbody[i]		= "hub-lnb-" .. v
			parts.note.lnactive[i]		= "hub-lna-" .. v
			parts.note.hcnend[i]		= "hub-hcne-" .. v
			parts.note.hcnstart[i]		= "hub-hcns-" .. v
			parts.note.hcnbody[i]		= "hub-hcnb-" .. v
			parts.note.hcnactive[i]		= "hub-hcna-" .. v
			parts.note.hcndamage[i]		= "hub-hcnd-" .. v
			parts.note.hcnreactive[i]	= "hub-hcnr-" .. v
			parts.note.mine[i]			= "hub-mine-" .. v
		end
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
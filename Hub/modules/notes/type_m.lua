local parts = {}

local function load(folder_path)
	
	parts.source = {
		{id = "hub-src-tmnotes", path = folder_path}
	}
	
	parts.image = {
		-- ノート
		{id = "hub-note-b", src = "hub-src-tmnotes", x = 233, y = 2, w = 39, h = 23},
		{id = "hub-note-w", src = "hub-src-tmnotes", x = 181, y = 2, w = 51, h = 23},
		{id = "hub-note-s", src = "hub-src-tmnotes", x = 91, y = 2, w = 89, h = 23},
		-- ロングノート始点
		{id = "hub-lns-b", src = "hub-src-tmnotes", x = 233, y = 75, w = 39, h = 23},
		{id = "hub-lns-w", src = "hub-src-tmnotes", x = 181, y = 75, w = 51, h = 23},
		{id = "hub-lns-s", src = "hub-src-tmnotes", x = 91, y = 75, w = 89, h = 23},
		-- ロングノート終点
		{id = "hub-lne-b", src = "hub-src-tmnotes", x = 233, y = 51, w = 39, h = 23},
		{id = "hub-lne-w", src = "hub-src-tmnotes", x = 181, y = 51, w = 51, h = 23},
		{id = "hub-lne-s", src = "hub-src-tmnotes", x = 91, y = 51, w = 89, h = 23},
		-- ロングノートアクティブ
		{id = "hub-lnb-b", src = "hub-src-tmnotes", x = 233, y = 115, w = 39, h = 2, divy = 2, cycle = 266},
		{id = "hub-lnb-w", src = "hub-src-tmnotes", x = 181, y = 115, w = 51, h = 2, divy = 2, cycle = 266},
		{id = "hub-lnb-s", src = "hub-src-tmnotes", x = 91, y = 115, w = 89, h = 2, divy = 2, cycle = 266},
		-- ロングノート非アクティブ
		{id = "hub-lna-b", src = "hub-src-tmnotes", x = 233, y = 99, w = 39, h = 1},
		{id = "hub-lna-w", src = "hub-src-tmnotes", x = 181, y = 99, w = 51, h = 1},
		{id = "hub-lna-s", src = "hub-src-tmnotes", x = 91, y = 99, w = 89, h = 1},
		-- ヘルチャージノート始点
		{id = "hub-hcns-b", src = "hub-src-tmnotes", x = 233, y = 142, w = 39, h = 23},
		{id = "hub-hcns-w", src = "hub-src-tmnotes", x = 181, y = 142, w = 51, h = 23},
		{id = "hub-hcns-s", src = "hub-src-tmnotes", x = 91, y = 142, w = 89, h = 23},
		-- ヘルチャージノート終点
		{id = "hub-hcne-b", src = "hub-src-tmnotes", x = 233, y = 118, w = 39, h = 23},
		{id = "hub-hcne-w", src = "hub-src-tmnotes", x = 181, y = 118, w = 51, h = 23},
		{id = "hub-hcne-s", src = "hub-src-tmnotes", x = 91, y = 118, w = 89, h = 23},
		-- ヘルチャージノートアクティブ
		{id = "hub-hcnb-b", src = "hub-src-tmnotes", x = 233, y = 182, w = 39, h = 2, divy = 2, cycle = 266},
		{id = "hub-hcnb-w", src = "hub-src-tmnotes", x = 181, y = 182, w = 51, h = 2, divy = 2, cycle = 266},
		{id = "hub-hcnb-s", src = "hub-src-tmnotes", x = 91, y = 182, w = 89, h = 2, divy = 2, cycle = 266},
		-- ヘルチャージノート非アクティブ
		{id = "hub-hcna-b", src = "hub-src-tmnotes", x = 233, y = 166, w = 39, h = 1},
		{id = "hub-hcna-w", src = "hub-src-tmnotes", x = 181, y = 166, w = 51, h = 1},
		{id = "hub-hcna-s", src = "hub-src-tmnotes", x = 91, y = 166, w = 89, h = 1},
		-- ヘルチャージノートリアクティブ
		{id = "hub-hcnd-b", src = "hub-src-tmnotes", x = 233, y = 182, w = 39, h = 2, divy = 2, cycle = 266},
		{id = "hub-hcnd-w", src = "hub-src-tmnotes", x = 181, y = 182, w = 51, h = 2, divy = 2, cycle = 266},
		{id = "hub-hcnd-s", src = "hub-src-tmnotes", x = 91, y = 182, w = 89, h = 2, divy = 2, cycle = 266},
		-- ヘルチャージノートダメージ
		{id = "hub-hcnr-b", src = "hub-src-tmnotes", x = 233, y = 167, w = 39, h = 2, divy = 2, cycle = 100},
		{id = "hub-hcnr-w", src = "hub-src-tmnotes", x = 181, y = 167, w = 51, h = 2, divy = 2, cycle = 100},
		{id = "hub-hcnr-s", src = "hub-src-tmnotes", x = 91, y = 167, w = 89, h = 2, divy = 2, cycle = 100},
		-- 地雷
		{id = "hub-mine-b", src = "hub-src-tmnotes", x = 233, y = 27, w = 39, h = 23},
		{id = "hub-mine-w", src = "hub-src-tmnotes", x = 181, y = 27, w = 51, h = 23},
		{id = "hub-mine-s", src = "hub-src-tmnotes", x = 91, y = 27, w = 89, h = 23}
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
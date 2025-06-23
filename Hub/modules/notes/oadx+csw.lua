local parts = {}

local function load(folder_path)
	
	local note = {
		w = {
			x = 258,
			w = 30,
			h = 18
		},
		b = {
			x = 289,
			w = 23,
			h = 18
		},
		s = {
			x = 204,
			w = 53,
			h = 18
		},
		y = {
			note = 95,
			lns = 152,
			lne = 133,
			lnb = 172, -- アクティブ
			lna = 171, -- 非アクティブ
			mine = 114
		},
		size = 36
	}
	
	parts.source = {
		{id = "hub-src-oadx+acnotes", path = folder_path[1]},
		{id = "hub-src-oadx+achcn", path = folder_path[2]}
	}
	
	parts.image = {
		-- ノート
		{id = "hub-note-w", src = "hub-src-oadx+acnotes", x = note.w.x, y = note.y.note, w = note.w.w, h = note.w.h},
		{id = "hub-note-b", src = "hub-src-oadx+acnotes", x = note.b.x, y = note.y.note, w = note.b.w, h = note.b.h},
		{id = "hub-note-s", src = "hub-src-oadx+acnotes", x = note.s.x, y = note.y.note, w = note.s.w, h = note.s.h},
		-- ロングノート始点
		{id = "hub-lns-w", src = "hub-src-oadx+acnotes", x = note.w.x, y = note.y.lns, w = note.w.w, h = note.w.h},
		{id = "hub-lns-b", src = "hub-src-oadx+acnotes", x = note.b.x, y = note.y.lns, w = note.b.w, h = note.b.h},
		{id = "hub-lns-s", src = "hub-src-oadx+acnotes", x = note.s.x, y = note.y.lns, w = note.s.w, h = note.s.h},
		-- ロングノート終点
		{id = "hub-lne-w", src = "hub-src-oadx+acnotes", x = note.w.x, y = note.y.lne, w = note.w.w, h = note.w.h},
		{id = "hub-lne-b", src = "hub-src-oadx+acnotes", x = note.b.x, y = note.y.lne, w = note.b.w, h = note.b.h},
		{id = "hub-lne-s", src = "hub-src-oadx+acnotes", x = note.s.x, y = note.y.lne, w = note.s.w, h = note.s.h},
		-- ロングノートアクティブ
		{id = "hub-lnb-w", src = "hub-src-oadx+acnotes", x = note.w.x, y = note.y.lnb, w = note.w.w, h = note.w.h, divy = 17, cycle = 250},
		{id = "hub-lnb-b", src = "hub-src-oadx+acnotes", x = note.b.x, y = note.y.lnb, w = note.b.w, h = note.b.h, divy = 17, cycle = 250},
		{id = "hub-lnb-s", src = "hub-src-oadx+acnotes", x = note.s.x, y = note.y.lnb, w = note.s.w, h = note.s.h, divy = 17, cycle = 250},
		-- ロングノート非アクティブ
		{id = "hub-lna-w", src = "hub-src-oadx+acnotes", x = note.w.x, y = note.y.lna, w = note.w.w, h = 1},
		{id = "hub-lna-b", src = "hub-src-oadx+acnotes", x = note.b.x, y = note.y.lna, w = note.b.w, h = 1},
		{id = "hub-lna-s", src = "hub-src-oadx+acnotes", x = note.s.x, y = note.y.lna, w = note.s.w, h = 1},
		-- ヘルチャージノート始点
		{id = "hub-hcns-w", src = "hub-src-oadx+achcn", x = note.w.x, y = note.y.lns, w = note.w.w, h = note.w.h},
		{id = "hub-hcns-b", src = "hub-src-oadx+achcn", x = note.b.x, y = note.y.lns, w = note.b.w, h = note.b.h},
		{id = "hub-hcns-s", src = "hub-src-oadx+achcn", x = note.s.x, y = note.y.lns, w = note.s.w, h = note.s.h},
		-- ヘルチャージノート終点
		{id = "hub-hcne-w", src = "hub-src-oadx+achcn", x = note.w.x, y = note.y.lne, w = note.w.w, h = note.w.h},
		{id = "hub-hcne-b", src = "hub-src-oadx+achcn", x = note.b.x, y = note.y.lne, w = note.b.w, h = note.b.h},
		{id = "hub-hcne-s", src = "hub-src-oadx+achcn", x = note.s.x, y = note.y.lne, w = note.s.w, h = note.s.h},
		-- ヘルチャージノートアクティブ
		{id = "hub-hcnb-w", src = "hub-src-oadx+achcn", x = note.w.x, y = note.y.lnb, w = note.w.w, h = note.w.h, divy = 17, cycle = 250},
		{id = "hub-hcnb-b", src = "hub-src-oadx+achcn", x = note.b.x, y = note.y.lnb, w = note.b.w, h = note.b.h, divy = 17, cycle = 250},
		{id = "hub-hcnb-s", src = "hub-src-oadx+achcn", x = note.s.x, y = note.y.lnb, w = note.s.w, h = note.s.h, divy = 17, cycle = 250},
		-- ヘルチャージノート非アクティブ
		{id = "hub-hcna-w", src = "hub-src-oadx+achcn", x = note.w.x, y = note.y.lna, w = note.w.w, h = 1},
		{id = "hub-hcna-b", src = "hub-src-oadx+achcn", x = note.b.x, y = note.y.lna, w = note.b.w, h = 1},
		{id = "hub-hcna-s", src = "hub-src-oadx+achcn", x = note.s.x, y = note.y.lna, w = note.s.w, h = 1},
		-- ヘルチャージノートリアクティブ
		{id = "hub-hcnd-w", src = "hub-src-oadx+achcn", x = note.w.x, y = note.y.lnb, w = note.w.w, h = note.w.h, divy = 17, cycle = 250},
		{id = "hub-hcnd-b", src = "hub-src-oadx+achcn", x = note.b.x, y = note.y.lnb, w = note.b.w, h = note.b.h, divy = 17, cycle = 250},
		{id = "hub-hcnd-s", src = "hub-src-oadx+achcn", x = note.s.x, y = note.y.lnb, w = note.s.w, h = note.s.h, divy = 17, cycle = 250},
		-- ヘルチャージノートダメージ
		{id = "hub-hcnr-w", src = "hub-src-oadx+achcn", x = note.w.x, y = note.y.lna, w = note.w.w, h = 1},
		{id = "hub-hcnr-b", src = "hub-src-oadx+achcn", x = note.b.x, y = note.y.lna, w = note.b.w, h = 1},
		{id = "hub-hcnr-s", src = "hub-src-oadx+achcn", x = note.s.x, y = note.y.lna, w = note.s.w, h = 1},
		-- 地雷
		{id = "hub-mine-w", src = "hub-src-oadx+acnotes", x = note.w.x, y = note.y.mine, w = note.w.w, h = note.w.h},
		{id = "hub-mine-b", src = "hub-src-oadx+acnotes", x = note.b.x, y = note.y.mine, w = note.b.w, h = note.b.h},
		{id = "hub-mine-s", src = "hub-src-oadx+acnotes", x = note.s.x, y = note.y.mine, w = note.s.w, h = note.s.h}
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
	parts.note.size			= {}
	
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
			parts.note.size[i]			= note.size
		end
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
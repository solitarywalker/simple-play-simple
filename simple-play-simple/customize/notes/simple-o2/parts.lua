local parts = {}

local function load(g)
	
	local note_types = {}
	if		g.type == 0	then note_types	= {"w","b","w","c","w","b","w","s"}
	elseif	g.type == 1	then note_types	= {"w","b","c","b","w","s"}
	elseif	g.type == 4	then note_types	= {"w","b","w","b","c","b","w","b","w"}
	elseif	g.type == 3	then note_types	= {"w","b","c","b","w","s","w","b","c","b","w","s"}
	elseif	g.type == 2	then note_types	= {"w","b","w","c","w","b","w","s","w","b","w","c","w","b","w","s"}
	end
	
	local note = {
		x = {},
		y = {},
		w = {},
		h = {},
		size = {}
	}
	do
		for i1, v1 in pairs(g.lane.lane.order) do
			for i2, v2 in pairs(v1) do
				table.insert(note.x, g.lane.notes.x[i1][i2])
				table.insert(note.y, g.lanes.y[i1] + g.lane.outline.px)
				table.insert(note.w, g.lane.notes.w[i1][i2])
				table.insert(note.h, g.resolution.h - (g.lanes.y[i1] + g.lane.outline.px))
				table.insert(note.size, g.lane.notes.h[i1][i2])
			end
		end
	end
	
	parts.source = {
		{id = "src-notes-s", path = "../customize/notes/*" .. "/s.png"},
		{id = "src-notes-w", path = "../customize/notes/*" .. "/w.png"},
		{id = "src-notes-b", path = "../customize/notes/*" .. "/b.png"},
		{id = "src-notes-c", path = "../customize/notes/*" .. "/c.png"},
		{id = "src-barline", path = "../customize/notes/*" .. "/barline.png"}
	}
	
	parts.image = {
		{id = "section-line", src = "src-barline", x = 0, y = 0, w = -1, h = -1}
	}
	
	do
		local init = {"s","w","b","c"}
		for i, v in ipairs(init) do
			table.insert(parts.image, {id = "note-" .. v, src = "src-notes-" .. v, x = 0, y = 0,   w = 128, h = 40})							-- ノート
			table.insert(parts.image, {id = "lns-" .. v,  src = "src-notes-" .. v, x = 0, y = 80,  w = 128, h = 40})							-- ロングノート始点
			table.insert(parts.image, {id = "lne-" .. v,  src = "src-notes-" .. v, x = 0, y = 40,  w = 128, h = 40})							-- ロングノート終点
			table.insert(parts.image, {id = "lnb-" .. v,  src = "src-notes-" .. v, x = 0, y = 132, w = 128, h = 24, divy = 24, cycle = 266})	-- ロングノートアクティブ
			table.insert(parts.image, {id = "lna-" .. v,  src = "src-notes-" .. v, x = 0, y = 120, w = 128, h = 12})							-- ロングノート非アクティブ
			table.insert(parts.image, {id = "hcns-" .. v, src = "src-notes-" .. v, x = 0, y = 196, w = 128, h = 40})							-- ヘルチャージノート始点
			table.insert(parts.image, {id = "hcne-" .. v, src = "src-notes-" .. v, x = 0, y = 156, w = 128, h = 40})							-- ヘルチャージノート終点
			table.insert(parts.image, {id = "hcnb-" .. v, src = "src-notes-" .. v, x = 0, y = 248, w = 128, h = 24, divy = 24, cycle = 266})	-- ヘルチャージノートアクティブ
			table.insert(parts.image, {id = "hcna-" .. v, src = "src-notes-" .. v, x = 0, y = 236, w = 128, h = 12})							-- ヘルチャージノート非アクティブ
			table.insert(parts.image, {id = "hcnr-" .. v, src = "src-notes-" .. v, x = 0, y = 272, w = 128, h = 24, divy = 24, cycle = 100})	-- ヘルチャージノートダメージ
			table.insert(parts.image, {id = "hcnd-" .. v, src = "src-notes-" .. v, x = 0, y = 248, w = 128, h = 24, divy = 24, cycle = 266})	-- ヘルチャージノートリアクティブ
			table.insert(parts.image, {id = "mine-" .. v, src = "src-notes-" .. v, x = 0, y = 296, w = 128, h = 40})							-- 地雷
		end
	end
	
	parts.note = {
		id = "notes",
		note		= {},
		lnend		= {},
		lnstart		= {},
		lnbody		= {},
		lnactive	= {},
		hcnend		= {},
		hcnstart	= {},
		hcnbody		= {},
		hcnactive	= {},
		hcndamage	= {},
		hcnreactive	= {},
		mine		= {},
		hidden		= {},
		processed	= {},
		size		= note.size,
		dst			= {},
		group		= {{id = "section-line", offset = 3, dst = {{x = g.lanes.x[1] + g.lane.outline.px, y = g.lanes.y[1] + g.lane.outline.px, w = g.lanes.w[1] - g.lane.outline.px * 2, h = 1, r = 128, g = 128, b = 128, a = g.lanes.barline.a}}}},
		time		= {{id = "section-line", offset = 3, dst = {{x = g.lanes.x[1] + g.lane.outline.px, y = g.lanes.y[1] + g.lane.outline.px, w = g.lanes.w[1] - g.lane.outline.px * 2, h = 1, r = 64,  g = 192, b = 192, a = g.lanes.barline.a}}}},
		bpm			= {{id = "section-line", offset = 3, dst = {{x = g.lanes.x[1] + g.lane.outline.px, y = g.lanes.y[1] + g.lane.outline.px, w = g.lanes.w[1] - g.lane.outline.px * 2, h = 2, r = 0,   g = 192, b = 0,   a = g.lanes.barline.a}}}},
		stop		= {{id = "section-line", offset = 3, dst = {{x = g.lanes.x[1] + g.lane.outline.px, y = g.lanes.y[1] + g.lane.outline.px, w = g.lanes.w[1] - g.lane.outline.px * 2, h = 2, r = 192, g = 192, b = 0,   a = g.lanes.barline.a}}}}
	}
	for i, v in ipairs(note_types) do
		parts.note.note[i]			= "note-" .. v
		parts.note.lnend[i]			= "lne-" .. v
		parts.note.lnstart[i]		= "lns-" .. v
		parts.note.lnbody[i]		= "lnb-" .. v
		parts.note.lnactive[i]		= "lna-" .. v
		parts.note.hcnend[i]		= "hcne-" .. v
		parts.note.hcnstart[i]		= "hcns-" .. v
		parts.note.hcnbody[i]		= "hcnb-" .. v
		parts.note.hcnactive[i]		= "hcna-" .. v
		parts.note.hcndamage[i]		= "hcnd-" .. v
		parts.note.hcnreactive[i]	= "hcnr-" .. v
		parts.note.mine[i]			= "mine-" .. v
		parts.note.dst[i]			= {x = note.x[i], y = note.y[i], w = note.w[i], h = note.h[i]}
	end
	if g.type == 2 or g.type == 3 then -- DP
		table.insert(parts.note.group,	{id = "section-line", offset = 3, dst = {{x = g.lanes.x[2] + g.lane.outline.px, y = g.lanes.y[2] + g.lane.outline.px, w = g.lanes.w[2] - g.lane.outline.px * 2, h = 1, r = 128, g = 128, b = 128, a = g.lanes.barline.a}}})
		table.insert(parts.note.time,	{id = "section-line", offset = 3, dst = {{x = g.lanes.x[2] + g.lane.outline.px, y = g.lanes.y[2] + g.lane.outline.px, w = g.lanes.w[2] - g.lane.outline.px * 2, h = 1, r = 64,  g = 192, b = 192, a = g.lanes.barline.a}}})
		table.insert(parts.note.bpm,	{id = "section-line", offset = 3, dst = {{x = g.lanes.x[2] + g.lane.outline.px, y = g.lanes.y[2] + g.lane.outline.px, w = g.lanes.w[2] - g.lane.outline.px * 2, h = 2, r = 0,   g = 192, b = 0,   a = g.lanes.barline.a}}})
		table.insert(parts.note.stop,	{id = "section-line", offset = 3, dst = {{x = g.lanes.x[2] + g.lane.outline.px, y = g.lanes.y[2] + g.lane.outline.px, w = g.lanes.w[2] - g.lane.outline.px * 2, h = 2, r = 192, g = 192, b = 0,   a = g.lanes.barline.a}}})
	end
	
	parts.destination = {{id = "notes"}}
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
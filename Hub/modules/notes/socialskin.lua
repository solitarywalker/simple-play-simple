local parts = {}

local function load(folder_path)
	
	parts.source = {
		{id = "hub-src-ssnotes", path = folder_path}
	}
	
	parts.image = {
		{id = "hub-note-b", src = "hub-src-ssnotes", x = 127, y = 5, w = 21, h = 12},
		{id = "hub-note-w", src = "hub-src-ssnotes", x = 99, y = 5, w = 27, h = 12},
		{id = "hub-note-s", src = "hub-src-ssnotes", x = 50, y = 5, w = 46, h = 12},

		{id = "hub-lns-b", src = "hub-src-ssnotes", x = 127, y = 57, w = 21, h = 13},
		{id = "hub-lns-w", src = "hub-src-ssnotes", x = 99, y = 57, w = 27, h = 13},
		{id = "hub-lns-s", src = "hub-src-ssnotes", x = 50, y = 57, w = 46, h = 12},

		{id = "hub-lne-b", src = "hub-src-ssnotes", x = 127, y = 43, w = 21, h = 13},
		{id = "hub-lne-w", src = "hub-src-ssnotes", x = 99, y = 43, w = 27, h = 13},
		{id = "hub-lne-s", src = "hub-src-ssnotes", x = 50, y = 43, w = 46, h = 12},

		{id = "hub-lnb-b", src = "hub-src-ssnotes", x = 127, y = 80, w = 21, h = 1},
		{id = "hub-lnb-w", src = "hub-src-ssnotes", x = 99, y = 80, w = 27, h = 1},
		{id = "hub-lnb-s", src = "hub-src-ssnotes", x = 50, y = 80, w = 46, h = 1},

		{id = "hub-lna-b", src = "hub-src-ssnotes", x = 127, y = 76, w = 21, h = 1},
		{id = "hub-lna-w", src = "hub-src-ssnotes", x = 99, y = 76, w = 27, h = 1},
		{id = "hub-lna-s", src = "hub-src-ssnotes", x = 50, y = 76, w = 46, h = 1},

		{id = "hub-hcns-b", src = "hub-src-ssnotes", x = 127, y = 108, w = 21, h = 13},
		{id = "hub-hcns-w", src = "hub-src-ssnotes", x = 99, y = 108, w = 27, h = 13},
		{id = "hub-hcns-s", src = "hub-src-ssnotes", x = 50, y = 108, w = 46, h = 12},

		{id = "hub-hcne-b", src = "hub-src-ssnotes", x = 127, y = 94, w = 21, h = 13},
		{id = "hub-hcne-w", src = "hub-src-ssnotes", x = 99, y = 94, w = 27, h = 13},
		{id = "hub-hcne-s", src = "hub-src-ssnotes", x = 50, y = 94, w = 46, h = 12},

		{id = "hub-hcnb-b", src = "hub-src-ssnotes", x = 127, y = 131, w = 21, h = 1},
		{id = "hub-hcnb-w", src = "hub-src-ssnotes", x = 99, y = 131, w = 27, h = 1},
		{id = "hub-hcnb-s", src = "hub-src-ssnotes", x = 50, y = 131, w = 46, h = 1},

		{id = "hub-hcna-b", src = "hub-src-ssnotes", x = 127, y = 127, w = 21, h = 1},
		{id = "hub-hcna-w", src = "hub-src-ssnotes", x = 99, y = 127, w = 27, h = 1},
		{id = "hub-hcna-s", src = "hub-src-ssnotes", x = 50, y = 127, w = 46, h = 1},

		{id = "hub-hcnd-b", src = "hub-src-ssnotes", x = 127, y = 128, w = 21, h = 1},
		{id = "hub-hcnd-w", src = "hub-src-ssnotes", x = 99, y = 128, w = 27, h = 1},
		{id = "hub-hcnd-s", src = "hub-src-ssnotes", x = 50, y = 128, w = 46, h = 1},

		{id = "hub-hcnr-b", src = "hub-src-ssnotes", x = 127, y = 129, w = 21, h = 1},
		{id = "hub-hcnr-w", src = "hub-src-ssnotes", x = 99, y = 129, w = 27, h = 1},
		{id = "hub-hcnr-s", src = "hub-src-ssnotes", x = 50, y = 129, w = 46, h = 1},

		{id = "hub-mine-b", src = "hub-src-ssnotes", x = 127, y = 23, w = 21, h = 8},
		{id = "hub-mine-w", src = "hub-src-ssnotes", x = 99, y = 23, w = 27, h = 8},
		{id = "hub-mine-s", src = "hub-src-ssnotes", x = 50, y = 23, w = 46, h = 8}
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
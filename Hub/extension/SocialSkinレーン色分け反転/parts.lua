local parts = {}

local function load(skin, path)
	
	if mode_socialskin() then
	
		local pos = 0
		do
			local c = 0
			for i, v in pairs(skin.destination) do
				if v.id == "white" and v.dst[1].a == 24 then
					if pos == 0 then
						pos = i
						parts.line = pos
					end
					c = c + 1
				end
			end
			if c > 0 then
				for i = 1, c do table.remove(skin.destination, pos) end
			end
		end
		
		if pos ~= 0 then
		
			parts.source = {{id = "hub-src-white", path = "../../Hub/extension/SocialSkinレーン色分け反転/white.png"}}
			parts.image = {{id = "hub_white",	src = "hub-src-white", x = 0, y = 0, w = -1, h = -1}}
			
			parts.destination = {
				{id = "hub_white", dst = {{x = skin.note.dst[1].x, y = skin.note.dst[1].y, w = 52, h = 723, a = 24}}},
				{id = "hub_white", dst = {{x = skin.note.dst[3].x, y = skin.note.dst[3].y, w = 52, h = 723, a = 24}}},
				{id = "hub_white", dst = {{x = skin.note.dst[5].x, y = skin.note.dst[5].y, w = 52, h = 723, a = 24}}},
				{id = "hub_white", dst = {{x = skin.note.dst[7].x, y = skin.note.dst[7].y, w = 52, h = 723, a = 24}}}
			}
			
		end
		
	end
	
	return parts	
end

return {
	parts = parts,
	load = load
}
local parts = {}

-- @param t geometry
local function load(t)	
	parts.source = {
		{id = "src-fceffect",	path = "../customize/effect/fullcombo/default/fceffect.png"},
		{id = "src-fullcombo",	path = "../customize/effect/fullcombo/default/fullcombo.png"}
	}
	parts.image = {
		{id = "fc-effect", src = "src-fceffect", x = 0, y = 0, w = -1, h = -1},
		{id = "fullcombo", src = "src-fullcombo", x = 0, y = 0, w = -1, h = -1}
	}
	parts.destination = {}
	for i = 1, #t.lanes.x do
		table.insert(parts.destination, {id = "fc-effect", loop = -1, timer = 48, stretch = 3, blend = 2, dst = {
			{time = 0, x = t.lanes.x[i], y = t.lanes.y[i], w = t.lanes.w[i], h = t.lanes.h[i], a = 128},
			{time = 2100, y = t.lanes.y[i] + 100, a = 0}
		}})
		table.insert(parts.destination, {id = "fullcombo", loop = -1, timer = 48, dst = {
			{time = 550, x = t.lanes.center_x[i] - 180, y = t.lanes.judge.y[i], w = 360, h = 36, a = 0},
			{time = 650, a = 255},
			{time = 1600},
			{time = 1800, y = t.lanes.judge.y[i] - 18, a = 0}
		}})
	end
				
	return parts	
end

return {
	parts = parts,
	load = load
}
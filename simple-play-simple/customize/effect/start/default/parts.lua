local parts = {}

-- @param t geometry
local function load(t)	

	parts.source = {
		{id = "src-ready", path = "../customize/effect/start/default/ready.png"}
	}
	
	parts.image = {
		{id = "ready", src = "src-ready", x = 0, y = 0, w = -1, h = -1}
	}
	
	parts.destination = {}
	for i = 1, #t.lanes.x do
		table.insert(parts.destination, {id = "ready", loop = -1, timer = 40, offset = 3, dst = {
			{time = 0, x = t.lanes.center_x[i] - 162, y = t.lanes.judge.y[i], w = 324, h = 36, a = 0},
			{time = 100, a = 255},
			{time = 800},
			{time = 1000, y = t.lanes.judge.y[i] - 18, a = 0}
		}})
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
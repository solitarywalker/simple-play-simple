local parts = {}

-- param g : geometry
local function load(g)

	parts.source = {
		{id = "src-ex-dpframe", path = "../customize/extension/DPデフォルト用フレーム(仮)/dpframe.png"}
	}
	
	parts.image = {
		{id = "ex-dpframe", src = "src-ex-dpframe", x = 0, y = 0, w = -1, h = -1}
	}
	
	parts.destination = {
		{id = "ex-dpframe", loop = 900, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 800},
			{time = 900, a = 255}
		}}
	}
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
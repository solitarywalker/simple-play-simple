local parts = {}

-- @param t geometry
local function load(t)	
	parts.source = {
		{id = "src-failed",				path = "../customize/effect/failed/default/failed.png"},
		{id = "src-failedeffect",		path = "../customize/effect/failed/default/failed_effect.png"},
		{id = "src-failedeffect2",		path = "../customize/effect/failed/default/failed_effect2.png"}
	}
	parts.image = {
		{id = "failedeffect",	src = "src-failedeffect", x = 0, y = 0, w = -1, h = -1},
		{id = "failed",			src = "src-failed", x = 0, y = 0, w = -1, h = 36},
		{id = "failedeffect2",	src = "src-failedeffect2", x = 0, y = 0, w = -1, h = -1}
	}
	parts.destination = {
		{id = "failedeffect", loop = 400, timer = 3, op = {33},		dst = {{time = 0, x = 0, y = t.resolution.h, w = t.resolution.w, h = t.resolution.h * 1.5, acc = 2},{time = 400, y = t.resolution.h - (t.resolution.h * 1.5)}}},

		{id = "failedeffect", loop = 400, timer = 3, op = {32},		dst = {{time = 0, x = 0, y = t.resolution.h, w = t.resolution.w, h = t.resolution.h * 1.5, a = 200, acc = 2},{time = 400, y = t.resolution.h - (t.resolution.h * 1.5)}}},
		{id = "failed", loop = 1500, timer = 3, op = {32},			dst = {{time = 300, x = ((t.resolution.w / 40) * 19) - 108, y = (t.resolution.h / 2) - 36, w = 216, h = 36, a = 0, acc = 2},{time = 400, x = ((t.resolution.w / 40) * 19.8) - 108, a = 128},{time = 1500, x = (t.resolution.w / 2) - 108}}},
		{id = "failedeffect2", loop = 1500, timer = 3, op = {32},	dst = {{time = 1100, x = -(t.resolution.w * 1.33), y = 0, w = t.resolution.w * 1.33, h = t.resolution.h},{time = 1500, x = 0}}}
	}			
	return parts	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(g)

	local ghost = dofile(skin_config.get_path("../customize/ghost/*") .. "/ghost.lua")
	
	local ghost_width	= ghost.GHOST_WIDTH * 12
	local ghost_height	= ghost.GHOST_HEIGHT
	
	
	parts.source = {
		{id = "src-ghost", path = "../customize/ghost/*" .. "/GHOST.png"},
	}
	
	parts.image = {}
	
	parts.value = {
		{id = "ghost-mybest", src = "src-ghost", x = 0, y = 0, w = ghost_width, h = ghost_height * 2, divx = 12, divy = 2, digit = 6, align = 2, ref = 152},
		--{id = "ghost-target", src = "src-ghost", x = 0, y = 0, w = ghost_width, h = ghost_height * 2, divx = 12, divy = 2, digit = 6, align = 2, ref = 153}
	}
	parts.destination = {}
	
	if g.type == 4 then
		parts.destination = {
			{id = "ghost-mybest", loop = -1, timer = 46,	offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			{id = "ghost-mybest", loop = -1, timer = 47,	offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			{id = "ghost-mybest", loop = -1, timer = 247,	offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			--{id = "ghost-target", loop = -1, timer = 46,	offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			--{id = "ghost-target", loop = -1, timer = 47,	offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			--{id = "ghost-target", loop = -1, timer = 247,	offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}}
		}
	elseif g.type == 2 or g.type == 3 then
		parts.destination = {
			{id = "ghost-mybest", loop = -1, timer = 46, offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			{id = "ghost-mybest", loop = -1, timer = 47, offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[2] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[2], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			--{id = "ghost-target", loop = -1, timer = 46, offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			--{id = "ghost-target", loop = -1, timer = 47, offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[2] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[2], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}}
		}
	else
		parts.destination = {
			{id = "ghost-mybest", loop = -1, timer = 46, offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}},
			--{id = "ghost-target", loop = -1, timer = 46, offsets = {3,32,33}, dst = {{time = 0, x = g.lanes.ghost.x[1] - (ghost.GHOST_WIDTH * 3), y = g.lanes.ghost.y[1], w = ghost.GHOST_WIDTH, h = ghost.GHOST_HEIGHT},{time = 500}}}
		}
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
local parts = {}

local function load(g)

	local cover = {x = {}, y = {}, w = {}, h = {}, y_lane = {}, y_hid = {}, y_lift = {}}
	for i = 1, #g.lanes.x do
		cover.x[i]		= g.lanes.x[i] + g.lane.outline.px
		cover.w[i]		= g.lanes.w[i] - (g.lane.outline.px * 2)
		cover.h[i]		= g.resolution.h - g.lanes.y[i] - g.lane.outline.px
		cover.y[i]		= g.lanes.y[i] + g.lane.outline.px
		cover.y_lane[i]	= g.resolution.h
		cover.y_hid[i]	= g.lanes.y[i] + g.lane.outline.px - cover.h[i]
		cover.y_lift[i]	= g.lanes.y[i] + g.lane.outline.px - cover.h[i]
	end
	
	if g.type == 2 or g.type == 3 then
		parts.source = {
			{id = "src-lanecover1",			path = "../customize/cover/lane/*|1|"},
			{id = "src-lanecover2",			path = "../customize/cover/lane/*|2|"},
			{id = "src-liftcover1",			path = "../customize/cover/lift/*|1|"},
			{id = "src-liftcover2",			path = "../customize/cover/lift/*|2|"},
			{id = "src-hiddencover1",		path = "../customize/cover/hidden/*|1|"},
			{id = "src-hiddencover2",		path = "../customize/cover/hidden/*|2|"},
			{id = "src-finishcover1",		path = "../customize/cover/finish/*|1|"},
			{id = "src-finishcover2",		path = "../customize/cover/finish/*|2|"}
		}
		parts.image = {
			{id = "finishcover1", src = "src-finishcover1", x = 0, y = 0, w = -1, h = -1},
			{id = "finishcover2", src = "src-finishcover2", x = 0, y = 0, w = -1, h = -1}
		}
		parts.slider = {
			{id = "lanecover1", src = "src-lanecover1", x = 0, y = 0, w = -1, h = -1, angle = 2, range = cover.h[1], type = 4},
			{id = "lanecover2", src = "src-lanecover2", x = 0, y = 0, w = -1, h = -1, angle = 2, range = cover.h[2], type = 4}
		}
		parts.liftCover = {
			{id = "liftcover1", src = "src-liftcover1", x = 0, y = 0, w = -1, h = -1, disapearLine = cover.y[1]},
			{id = "liftcover2", src = "src-liftcover2", x = 0, y = 0, w = -1, h = -1, disapearLine = cover.y[2]}
		}
		parts.hiddenCover = {
			{id = "hiddencover1", src = "src-hiddencover1", x = 0, y = 0, w = -1, h = -1, disapearLine = cover.y[1], isDisapearLineLinkLift = true},
			{id = "hiddencover2", src = "src-hiddencover2", x = 0, y = 0, w = -1, h = -1, disapearLine = cover.y[2], isDisapearLineLinkLift = true}
		}
		parts.destination = {
			{id = "lanecover1", loop = 1300, filter = 1, stretch = 3, dst = {
				{time = 0, x = cover.x[1], y = cover.y_lane[1] * 2, w = cover.w[1], h = cover.h[1], acc = 2},
				{time = 1300, y = cover.y_lane[1]}
			}},
			{id = "lanecover2", loop = 1300, filter = 1, stretch = 3, dst = {
				{time = 0, x = cover.x[2], y = cover.y_lane[2] * 2, w = cover.w[2], h = cover.h[2], acc = 2},
				{time = 1300, y = cover.y_lane[2]}
			}},
			{id = "liftcover1", filter = 1, stretch = 3, dst = {
				{ x = cover.x[1], y = cover.y_lift[1], w = cover.w[1], h = cover.h[1]}
			}},
			{id = "liftcover2", filter = 1, stretch = 3, dst = {
				{ x = cover.x[2], y = cover.y_lift[2], w = cover.w[2], h = cover.h[2]}
			}},
			{id = "hiddencover1", filter = 1, stretch = 3, dst = {
				{ x = cover.x[1], y = cover.y_hid[1], w = cover.w[1], h = cover.h[1]}
			}},
			{id = "hiddencover2", filter = 1, stretch = 3, dst = {
				{ x = cover.x[2], y = cover.y_hid[2], w = cover.w[2], h = cover.h[2]}
			}},
			{id = "finishcover1", filter = 1, timer = 143, loop = 1000, stretch = 3, dst = {
				{time = 0, x = cover.x[1], y = cover.y_lane[1], w = cover.w[1], h = cover.h[1], acc = 2},
				{time = 1000, y = cover.y[1]}
			}},
			{id = "finishcover2", filter = 1, timer = 143, loop = 1000, stretch = 3, dst = {
				{time = 0, x = cover.x[2], y = cover.y_lane[2], w = cover.w[2], h = cover.h[2], acc = 2},
				{time = 1000, y = cover.y[2]}
			}}
		}
	else
		parts.source = {
			{id = "src-lanecover1",			path = "../customize/cover/lane/*|1|"},
			{id = "src-liftcover1",			path = "../customize/cover/lift/*|1|"},
			{id = "src-hiddencover1",		path = "../customize/cover/hidden/*|1|"},
			{id = "src-finishcover1",		path = "../customize/cover/finish/*|1|"}
		}
		parts.image = {
			{id = "finishcover1", src = "src-finishcover1", x = 0, y = 0, w = -1, h = -1}
		}
		parts.slider = {
			{id = "lanecover1", src = "src-lanecover1", x = 0, y = 0, w = -1, h = -1, angle = 2, range = cover.h[1], type = 4}
		}
		parts.liftCover = {
			{id = "liftcover1", src = "src-liftcover1", x = 0, y = 0, w = -1, h = -1, disapearLine = cover.y[1]}
		}
		parts.hiddenCover = {
			{id = "hiddencover1", src = "src-hiddencover1", x = 0, y = 0, w = -1, h = -1, disapearLine = cover.y[1], isDisapearLineLinkLift = true}
		}
		parts.destination = {
			{id = "lanecover1", loop = 1300, filter = 1, stretch = 3, dst = {
				{time = 0, x = cover.x[1], y = cover.y_lane[1] * 2, w = cover.w[1], h = cover.h[1], acc = 2},
				{time = 1300, y = cover.y_lane[1]}
			}},
			{id = "liftcover1", filter = 1, stretch = 3, dst = {
				{ x = cover.x[1], y = cover.y_lift[1], w = cover.w[1], h = cover.h[1]}
			}},
			{id = "hiddencover1", filter = 1, stretch = 3, dst = {
				{ x = cover.x[1], y = cover.y_hid[1], w = cover.w[1], h = cover.h[1]}
			}},
			{id = "finishcover1", filter = 1, timer = 143, loop = 1000, stretch = 3, dst = {
				{time = 0, x = cover.x[1], y = cover.y_lane[1], w = cover.w[1], h = cover.h[1], acc = 2},
				{time = 1000, y = cover.y[1]}
			}}
		}
	end
	
	return parts	
	
end

return {
	parts = parts,
	load = load
}
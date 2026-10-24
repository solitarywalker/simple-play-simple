local parts = {}

-- ソフラン追従レーンカバー ----------------------------------------------------
-- 定速 (HI-SPEED FIX) 時、beatoraja はハイスピードを基準BPMから一度だけ決める
-- (LaneRenderer.resetHispeed: hispeed = 2400 / (基準BPM/100) / duration * (1-カバー))。
-- そのため実際のスクロール速度は現在BPMに比例し、ソフランすると緑数字がずれる。
-- 可視領域を 現在BPM / 基準BPM 倍に縮めれば緑数字は一定になるので、その位置に
-- もう一枚レーンカバーを重ねて追従させる。ModernChic の「サドプラ自動調節」と同じ考え方。
local NUM = {
	LANECOVER1	= 14,	-- カバー量(0-1000) リフトは考慮されていない生の値
	LIFT1		= 314,	-- リフト量(0-1000)
	MAXBPM		= 90,
	MINBPM		= 91,
	MAINBPM		= 92,
	NOWBPM		= 160
}
local OP = {
	CONSTANT		= 400,	-- 定速が有効
	LANECOVER1_ON	= 271,
	LIFT1_ON		= 272
}
local BUTTON_HSFIX = 55
local HSFIX = {OFF = 0, START = 1, MAX = 2, MAIN = 3, MIN = 4}

-- 定速の基準BPM
local start_bpm = nil
local function get_reference_bpm()
	local fix = main_state.event_index(BUTTON_HSFIX)
	if		fix == HSFIX.MAX	then return main_state.number(NUM.MAXBPM)
	elseif	fix == HSFIX.MAIN	then return main_state.number(NUM.MAINBPM)
	elseif	fix == HSFIX.MIN	then return main_state.number(NUM.MINBPM)
	elseif	fix == HSFIX.START	then
		-- 開始BPMは数値プロパティに無いので最初に観測した現在BPMで代用する
		if not start_bpm then
			local now = main_state.number(NUM.NOWBPM)
			if now > 0 then start_bpm = now end
		end
		return start_bpm
	end
	return nil
end

-- 追従後のカバー量(0-1 上からの被覆率)
local function get_adjusted_cover()
	local lanecover	= main_state.number(NUM.LANECOVER1) / 1000
	local lift		= 0
	if main_state.option(OP.LIFT1_ON) then lift = main_state.number(NUM.LIFT1) / 1000 end
	-- 実際のカバー量。beatoraja が本来のレーンカバーに使う値と同じ
	local covered = (1 - lift) * lanecover
	local ref = get_reference_bpm()
	local now = main_state.number(NUM.NOWBPM)
	if not ref or ref <= 0 or now <= 0 then return covered end
	-- 可視領域をBPM比で縮める
	local value = covered + ((1 - lift) * (1 - lanecover)) * (1 - (now / ref))
	-- 基準より速い区間ではカバーを戻せない(元のカバーより上には行かない)
	if value < covered	then return covered end
	if value > 1		then return 1 end
	return value
end
------------------------------------------------------------------------------

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

	-- ソフラン追従レーンカバー(本来のレーンカバーの直後に重ねる)
	if g.follow_lanecover then
		for i = 1, #g.lanes.x do
			table.insert(parts.slider, {id = "adjustcover" .. i, src = "src-lanecover" .. i, x = 0, y = 0, w = -1, h = -1, angle = 2, range = cover.h[i], value = get_adjusted_cover})
			table.insert(parts.destination, #g.lanes.x + i, {id = "adjustcover" .. i, loop = 1300, filter = 1, stretch = 3, op = {OP.CONSTANT, OP.LANECOVER1_ON}, dst = {
				{time = 0, x = cover.x[i], y = cover.y_lane[i] * 2, w = cover.w[i], h = cover.h[i], acc = 2},
				{time = 1300, y = cover.y_lane[i]}
			}})
		end
	end

	return parts

end

return {
	parts = parts,
	load = load
}
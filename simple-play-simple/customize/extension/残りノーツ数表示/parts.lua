local parts = {}
local main_state = require("main_state")

local function load(g)

	local nc = {
		current	= 0,						-- 処理済みノーツ数
		remain	= 0,						-- 残りノーツ数
		total	= main_state.number(106),	-- 譜面のノーツ数
		tmp		= 0,						-- 一時計算用
		flag	= true						-- 描画フラグ
	}
	
	parts.source = {{id = "ex-notes-count", path = "../customize/extension/残りノーツ数表示/num.png"}}
	
	parts.value = {
		{id = "ex-notes-count-remain", src = "ex-notes-count", x = 0, y = 0, w = 180, h = 20, divx = 10, digit = 4, align = 2, value = function()
			-- 現在の処理済みノーツ数を計算
			nc.tmp = 0
			for i = 0, 4 do
				nc.tmp = nc.tmp + main_state.number(110 + i)
			end
			nc.current = nc.tmp
			
			-- 残りノーツ数の計算
			nc.remain = nc.total - nc.current
			
			-- 残りノーツ数が0の場合描画しない
			if nc.remain == 0 and nc.flag then
				nc.flag = false
			end
			
			-- 残りノーツ数を返却
			return nc.remain
		end}
	}
	
	parts.destination = {}
	for i = 1, #g.lanes.x do
		table.insert(parts.destination, {id = "ex-notes-count-remain", timer = 41, offsets = {3, 32}, draw = function() return nc.flag end, dst = {
			{x = g.lanes.center_x[i] - 36, y = g.lanes.judge.y[i] - 76, w = 18, h = 20}
		}})
	end
		
	return parts
	
end

return {
	parts = parts,
	load = load
}
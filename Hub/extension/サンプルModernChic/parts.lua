-- レーンの上に画像を表示するだけのもの(ModernChic用)
local parts = {}

--[[
--	パーツの追加位置を指定する(destination)
--	未記入時及び該当idが存在しない場合は末尾に追加される
--]]

-- 指定したidの前に追加する
parts.prefix = "judge_line"

-- 指定したidの後に追加する
--parts.postfix = ""

-- 指定したテーブル位置に追加する
--parts.line = 1

-- skin: スキンのテーブル
-- path: フォルダパス
local function load(skin, path)
	
	if mode_modernchic() then
	
		-- レーンの情報を取得
		local lane_data = {}
		for i, v in pairs(skin.destination) do
			if v.id == "lane" then
				lane_data.x = v.dst[1].x
				lane_data.y = v.dst[1].y
				lane_data.w = v.dst[1].w
				lane_data.h = v.dst[1].h
			end
		end

		parts.source = {
			{id = "hub-src-sample", path = "../Hub/extension/サンプルModernChic/sample.png"}
		}
		
		parts.image = {
			{id = "hub_sample",	src = "hub-src-sample", x = 0, y = 0, w = -1, h = -1}
		}
		
		parts.destination = {
			{id = "hub_sample", stretch = 1, dst = {{x = lane_data.x, y = lane_data.y, w = lane_data.w, h = lane_data.h}}}
		}
		
		--parts.font				= {}
		--parts.imageset			= {}
		--parts.value				= {}
		--parts.text				= {}
		--parts.slider				= {}
		--parts.hiddenCover			= {}
		--parts.liftCover			= {}
		--parts.graph				= {}
		--parts.judgegraph			= {}
		--parts.bpmgraph			= {}
		--parts.judge				= {}
		--parts.hiterrorvisualizer	= {}
		--parts.timingvisualizer	= {}
		--parts.pmchara				= {}
		--parts.customTimers		= {}
	
	end
	
	return parts	
end

return {
	parts = parts,
	load = load
}
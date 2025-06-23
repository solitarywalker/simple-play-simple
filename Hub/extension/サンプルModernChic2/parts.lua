-- 背景画像を消すだけのもの(ModernChic用)
local parts = {}

--[[
--	パーツの追加位置を指定する(destination)
--	未記入時及び該当idが存在しない場合は末尾に追加される
--]]

-- 指定したidの前に追加する
-- parts.prefix = ""

-- 指定したidの後に追加する
-- parts.postfix = ""

-- 指定したテーブル位置に追加する
--parts.line = 1

-- skin: スキンのテーブル
-- path: フォルダパス
local function load(skin, path)
	
	if mode_modernchic() then
		table.remove(skin.destination, 1)
		--parts.source				= {}
		--parts.image				= {}
		--parts.destination			= {}
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
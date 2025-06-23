local t = require("modules.init").settings
local function load(header)
	-- 描画設定
	-- レーン設定 ----------------------------------------------------------

	-- レーン全体の座標{1P, 2P}
	t.lanes.x = {54}
	t.lanes.y = {210}

	-- レーンの並び{{1P}, {2P}}
	-- 7KEYS-14KEYS: 1~7が鍵盤 8がスクラッチ
	-- 5KEYS-10KEYS: 1~5が鍵盤 6がスクラッチ
	t.lane.lane.order	= {{8, 1, 2, 3, 4, 5, 6, 7}}

	-- レーンの横幅{{1P}, {2P}}
	t.lane.lane.w		= {{74, 58, 74, 58, 74, 58, 74, 130}}
	t.lane.lane.a		= 255

	-- ノーツの横幅{{1P}, {2P}}
	t.lane.notes.w		= {{74, 58, 74, 58, 74, 58, 74, 130}}
	-- ノーツの縦幅{{1P}, {2P}}
	t.lane.notes.h		= {{40, 40, 40, 40, 40, 40, 40, 40}}

	-- レーン間の線
	t.lane.line.px		= 3
	t.lane.line.a		= 255

	-- レーン外枠の線
	t.lane.outline.px	= 3
	t.lane.outline.a	= 255

	-- キービーム
	t.lane.keybeam.h	= 370
	t.lane.keybeam.a	= 255
	t.lane.keybeam.variable_key_on	= 10 -- キーオン時の可変幅(横幅)
	t.lane.keybeam.time_key_on		= 40 -- キーオン時のアニメーション再生時間
	t.lane.keybeam.variable_key_off	= 20 -- キーオフ時の可変幅(横幅)
	t.lane.keybeam.time_key_off		= 60 -- キーオフ時のアニメーション再生時間

	-- 背景
	t.lanes.background.a = 255

	-- 小節線
	t.lanes.barline.a	= 255

	-- グロー
	t.lanes.glow.h		= 36
	t.lanes.glow.a		= 255

	-- 判定ライン
	t.lanes.judgeline.h	= 8
	t.lanes.judgeline.a	= 255

	-- ボム表示倍率
	t.lanes.bomb.magnification = 1

	--[[ 計算用 消さないでください
		t.lane.lane.x		{{1P}, {2P}} 各レーンのx座標
		t.lane.center_x		{{1P}, {2P}} 各レーンのx座標(中心)
		t.lane.line.x		{{1P}, {2P}} 各ラインのx座標
		t.lane.outline.x	{{1P}, {2P}} アウトラインの座標
		t.lane.notes.x		{{1P}, {2P}} 各ノーツの座標
		t.lanes.w			{1P, 2P} レーン全体の横幅
		t.lanes.h			{1P, 2P} レーン全体の縦幅
		t.lanes.center_x	{1P, 2P} レーン全体のx座標(中心)
		t.lanes.right_x		{1P, 2P} レーン全体のx座標(右端)
		t.lanes.inside.x	{1P, 2P} レーン全体のx座標(アウトラインを除く)
		t.lanes.inside.y	{1P, 2P} レーン全体のy座標(アウトラインを除く)
		t.lanes.inside.w	{1P, 2P} レーン全体の横幅(アウトラインを除く)
		t.lanes.inside.h	{1P, 2P} レーン全体の縦幅(アウトラインを除く)
	--]]
	for i1, v1 in pairs(t.lane.lane.order) do
		local x = t.lanes.x[i1] + t.lane.outline.px
		t.lanes.w[i1] = (t.lane.line.px * (#v1 - 1)) + (t.lane.outline.px * 2)
		for i2, v2 in pairs(v1) do
			t.lane.lane.x[i1][v2]	= x
			t.lane.line.x[i1][i2]	= x - t.lane.line.px
			t.lane.center_x[i1][v2]	= x + (t.lane.lane.w[i1][v2] / 2)
			t.lane.notes.x[i1][v2]	= t.lane.center_x[i1][v2] - (t.lane.notes.w[i1][v2] / 2)
			t.lanes.w[i1]			= t.lanes.w[i1] + t.lane.lane.w[i1][v2]
			x						= x + t.lane.lane.w[i1][v2] + t.lane.line.px
		end
		t.lanes.center_x[i1] = t.lanes.x[i1] + (t.lanes.w[i1] / 2)
		t.lanes.right_x[i1] = t.lanes.x[i1] + t.lanes.w[i1]
		t.lanes.h[i1] = header.h - t.lanes.y[i1]
		t.lane.outline.x[i1][1] = t.lanes.x[i1]
		t.lane.outline.x[i1][2] = x - t.lane.line.px
		t.lanes.inside.x[i1] = t.lanes.x[i1] + t.lane.outline.px
		t.lanes.inside.y[i1] = t.lanes.y[i1] + t.lane.outline.px
		t.lanes.inside.w[i1] = t.lanes.w[i1] - (t.lane.outline.px * 2)
		t.lanes.inside.h[i1] = t.lanes.h[i1] - t.lane.outline.px
	end

	-- 判定文字表示倍率
	t.lanes.judge.magnification = 1

	for i = 1, #t.lanes.x do
		-- 判定文字
		t.lanes.judge.x[i]			= t.lanes.center_x[i]
		t.lanes.judge.y[i]			= t.lanes.y[i] + 160
		
		-- ゴーストスコア
		t.lanes.ghost.x[i]			= t.lanes.center_x[i]
		t.lanes.ghost.y[i]			= t.lanes.judge.y[i] + 180
		
		-- 判定詳細(FAST/SLOW)
		t.lanes.judgedetail.x[i]	= t.lanes.center_x[i]
		t.lanes.judgedetail.y[i]	= t.lanes.judge.y[i] + 120
	end
	------------------------------------------------------------------------


	-- フレーム設定 --------------------------------------------------------
	-- 背景
	t.frame.background.a = 255

	-- BGA
	t.frame.bga = {
		{x = 928, y = 44, w = 992, h = 992, a = 255, brightness = 255, stretch = 1}
	}

	-- グルーブゲージ
	t.frame.gauge.x		= t.lanes.x[1] + 135
	t.frame.gauge.y		= 64
	t.frame.gauge.h		= 36
	t.frame.gauge.scale	= 54 -- ゲージの粒数
	t.frame.gauge.w		= t.frame.gauge.scale * 12
	t.frame.gauge.num_x	= t.frame.gauge.x + t.frame.gauge.w - 112
	t.frame.gauge.num_y	= t.frame.gauge.y + 42

	-- ソングプログレスバー
	t.frame.songprogress.x		= t.lanes.x[1] - 46
	t.frame.songprogress.range	= t.lanes.h[1] - 80
	t.frame.songprogress.y		= t.lanes.y[1] + t.frame.songprogress.range

	-- スコアグラフ
	t.frame.graph.x = t.lanes.right_x[1] + 9
	t.frame.graph.y = 360

	-- BPM
	t.frame.bpm.x = t.frame.gauge.x + t.frame.gauge.w - 200
	t.frame.bpm.y = t.frame.gauge.y - 56

	-- スコア
	t.frame.score.x = t.frame.graph.x
	t.frame.score.y = t.frame.graph.y + 17

	-- スコアレート
	t.frame.scorerate.x = t.frame.graph.x
	t.frame.scorerate.y = t.frame.graph.y + 36

	-- 自己ベストとのスコア差
	t.frame.diffbest.x = t.frame.graph.x
	t.frame.diffbest.y = t.frame.graph.y + 55

	-- ターゲットとのスコア差
	t.frame.difftarget.x = t.frame.graph.x
	t.frame.difftarget.y = t.frame.graph.y + 74

	-- ジャッジカウント
	t.frame.judgecount.x = t.frame.graph.x
	t.frame.judgecount.y = t.frame.graph.y - 150

	-- MAXコンボ
	t.frame.maxcombo.x = t.frame.graph.x
	t.frame.maxcombo.y = t.frame.judgecount.y - 19

	-- タイムレフト	
	t.frame.timeleft.x = 8
	t.frame.timeleft.y = 8

	-- 現在のランク
	t.frame.rankpace.x = t.frame.graph.x
	t.frame.rankpace.y = t.frame.graph.y + 112

	-- マスコット
	t.frame.mascot.x = t.frame.graph.x + 52
	t.frame.mascot.y = t.frame.graph.y + 3

	-- 動くマスコット
	t.frame.movingmascot.x = t.frame.graph.x + 52
	t.frame.movingmascot.y = t.frame.graph.y + 3

	-- ぽみゅキャラ
	t.frame.pmchara.x = t.frame.graph.x + 52
	t.frame.pmchara.y = t.frame.graph.y + 3
	 -- ぽみゅキャラの表示倍率
	t.frame.pmchara.magnification	= 1

	-- 楽曲情報
	t.frame.songinfo.w = t.frame.gauge.w - 200
	t.frame.songinfo.h = 24
	t.frame.songinfo.x = t.frame.gauge.x + (t.frame.songinfo.w / 2)
	t.frame.songinfo.y = t.frame.gauge.y - 56

	-- タイミングビジュアライザ
	t.frame.timingvisualizer.w = t.lanes.inside.w[1] - t.lane.lane.w[1][8] - t.lane.line.px
	t.frame.timingvisualizer.h = 12
	t.frame.timingvisualizer.x = t.lane.lane.x[1][1]
	t.frame.timingvisualizer.y = t.lanes.y[1] - 30
	t.frame.timingvisualizer.a = 168

	-- ヒットエラービジュアライザー
	t.frame.hiterrorvisualizer.w = t.frame.timingvisualizer.w
	t.frame.hiterrorvisualizer.h = t.frame.timingvisualizer.h
	t.frame.hiterrorvisualizer.x = t.frame.timingvisualizer.x
	t.frame.hiterrorvisualizer.y = t.frame.timingvisualizer.y
	t.frame.hiterrorvisualizer.a = t.frame.timingvisualizer.a

	-- ジャッジグラフ
	t.frame.judgegraph.w = t.frame.timingvisualizer.w
	t.frame.judgegraph.h = 60
	t.frame.judgegraph.x = t.frame.timingvisualizer.x
	t.frame.judgegraph.y = t.lanes.y[1] - 100
	t.frame.judgegraph.a = 168

	-- BPMグラフ
	t.frame.bpmgraph.w = t.frame.judgegraph.w
	t.frame.bpmgraph.h = t.frame.judgegraph.h
	t.frame.bpmgraph.x = t.frame.judgegraph.x
	t.frame.bpmgraph.y = t.frame.judgegraph.y
	t.frame.bpmgraph.a = t.frame.judgegraph.a
	------------------------------------------------------------------------
		
	return t
end

return {
	t = t,
	load = load
}
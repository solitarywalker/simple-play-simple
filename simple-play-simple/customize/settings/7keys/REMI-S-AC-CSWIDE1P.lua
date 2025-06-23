local t = require("modules.init").settings
local function load(header)
	-- 描画設定
	-- レーン設定 ----------------------------------------------------------

	-- レーン全体の座標{1P, 2P}
	t.lanes.x = {171}
	t.lanes.y = {275}

	-- レーンの並び{{1P}, {2P}}
	-- 7KEYS-14KEYS: 1~7が鍵盤 8がスクラッチ
	-- 5KEYS-10KEYS: 1~5が鍵盤 6がスクラッチ
	t.lane.lane.order	= {{8, 1, 2, 3, 4, 5, 6, 7}}

	-- レーンの横幅{{1P}, {2P}}
	t.lane.lane.w		= {{90, 69, 90, 69, 90, 69, 90, 159}}
	t.lane.lane.a		= 96

	-- ノーツの横幅{{1P}, {2P}}
	t.lane.notes.w		= {{90, 69, 90, 69, 90, 69, 90, 159}}
	-- ノーツの縦幅{{1P}, {2P}}
	t.lane.notes.h		= {{36, 36, 36, 36, 36, 36, 36, 36}}

	-- レーン間の線
	t.lane.line.px		= 6
	t.lane.line.a		= 96

	-- レーン外枠の線
	t.lane.outline.px	= 6
	t.lane.outline.a	= 192

	-- キービーム
	t.lane.keybeam.h	= 370
	t.lane.keybeam.a	= 255
	t.lane.keybeam.variable_key_on	= 10 -- キーオン時の可変幅(横幅)
	t.lane.keybeam.time_key_on		= 40 -- キーオン時のアニメーション再生時間
	t.lane.keybeam.variable_key_off	= 20 -- キーオフ時の可変幅(横幅)
	t.lane.keybeam.time_key_off		= 200 -- キーオフ時のアニメーション再生時間

	-- 背景
	t.lanes.background.a = 255

	-- 小節線
	t.lanes.barline.a	= 255

	-- グロー
	t.lanes.glow.h		= 36
	t.lanes.glow.a		= 255

	-- 判定ライン
	t.lanes.judgeline.h	= 9
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
		t.lanes.judge.y[i]			= t.lanes.y[i] + 186
		
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
		{x = t.lanes.right_x[1] + 9, y = 238, w = 788, h = 788, a = 255, brightness = 255, stretch = 1}
	}

	-- グルーブゲージ
	t.frame.gauge.x		= t.lanes.x[1] + 7
	t.frame.gauge.y		= 90
	t.frame.gauge.h		= 34
	t.frame.gauge.scale	= 52 -- ゲージの粒数
	t.frame.gauge.w		= t.frame.gauge.scale * 11
	t.frame.gauge.num_x	= t.frame.gauge.x + t.frame.gauge.w + 20
	t.frame.gauge.num_y	= t.frame.gauge.y + 14

	-- ソングプログレスバー
	t.frame.songprogress.x		= t.lanes.x[1] - 55
	t.frame.songprogress.range	= t.lanes.h[1] - 80
	t.frame.songprogress.y		= t.lanes.y[1] + t.frame.songprogress.range

	-- BPM
	t.frame.bpm.x = t.lanes.right_x[1] - 14
	t.frame.bpm.y = 32

	-- スコアグラフ
	t.frame.graph.x = t.lanes.right_x[1]
	t.frame.graph.y = t.lanes.y[1] - 41

	-- スコア
	t.frame.score.x = t.frame.graph.x + 2
	t.frame.score.y = t.lanes.y[1] + 706

	-- スコアレート
	t.frame.scorerate.x = t.lanes.right_x[1] + 505
	t.frame.scorerate.y = 45

	-- 自己ベストとのスコア差
	t.frame.diffbest.x = t.frame.graph.x + 2
	t.frame.diffbest.y = t.lanes.y[1] + 687

	-- ターゲットとのスコア差
	t.frame.difftarget.x = t.frame.graph.x + 2
	t.frame.difftarget.y = t.lanes.y[1] + 668

	-- ジャッジカウント
	t.frame.judgecount.x = t.lanes.right_x[1] + 255
	t.frame.judgecount.y = 64

	-- MAXコンボ
	t.frame.maxcombo.x = t.frame.judgecount.x - 39
	t.frame.maxcombo.y = 45

	-- タイムレフト	
	t.frame.timeleft.x = t.frame.scorerate.x
	t.frame.timeleft.y = t.frame.scorerate.y + 19

	-- 現在のランク
	t.frame.rankpace.x = t.frame.scorerate.x + 8
	t.frame.rankpace.y = 96

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
	 -- ぽみゅキャラのサイズ比率はふぃーりんぐぽみゅに合わせています
	t.frame.pmchara.magnification	= 1

	-- 楽曲情報
	t.frame.songinfo.w = 788
	t.frame.songinfo.h = 24
	t.frame.songinfo.x = t.lanes.right_x[1] + 9 + (t.frame.songinfo.w / 2)
	t.frame.songinfo.y = 1042

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
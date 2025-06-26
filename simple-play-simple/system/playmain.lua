local err_msg = {}

----------------------------------------------------------------------------------------------
-- リストに要素を追加する
local function add_all(list, t, pos)
	if t then
		if pos then
			for i, v in pairs(t) do
				table.insert(list, pos + i, v)
			end
		else
			for i, v in pairs(t) do
				table.insert(list, v)
			end
		end
	end
	-- タグの除去
	if pos then table.remove(list, pos) end
end

local function get_tag_hub()
	if PATH_HUB then
		return "hub"
	end
	return ""
end

-- スキン構成を書き出す
local function output_skin_config(header, path)
	-- propertyの出力
	local file = io.open(path, "w")
	file:write("return {\n\tproperty = {\n")
	for i1, v1 in pairs(header.property) do
		for i2, v2 in pairs(v1.item) do
			if skin_config.option[v1.name] == v2.op then
				if v1.name == "スキン構成の保存 SaveSkinConfig" then
					file:write("\t\t{name = \"スキン構成の保存 SaveSkinConfig\", def = \"OFF\"},\n")
				else
					file:write("\t\t{name = \"" .. v1.name .. "\", def = \"" .. v2.name .. "\"},\n")
				end
			end
		end
	end
	file:write("\t},\n")
	-- filepathの出力
	file:write("\tfilepath = {\n")
	for i, v in pairs(header.filepath) do
		file:write("\t\t{name = \"" .. v.name .. "\", def = \"" .. skin_config.file_path[v.name] .. "\"},\n")
	end
	file:write("\t},\n")
	-- offsetの出力
	file:write("\toffset = {\n")
	for i, v in pairs(header.offset) do
		file:write("\t\t{name = \"" .. v.name .. "\"")
		if v.x then file:write(", x = " .. skin_config.offset[v.name].x) end
		if v.y then file:write(", y = " .. skin_config.offset[v.name].y) end
		if v.w then file:write(", w = " .. skin_config.offset[v.name].w) end
		if v.h then file:write(", h = " .. skin_config.offset[v.name].h) end
		if v.r then file:write(", r = " .. skin_config.offset[v.name].r) end
		if v.a then file:write(", a = " .. skin_config.offset[v.name].a) end
		file:write("},\n")
	end
	file:write("\t}\n")
	-- 終了
	file:write("}")
	file:close()
end

-- スキン構成を読み込む
local function load_skin_config(header, path)
	local status, parts = pcall(function() return dofile(path) end)
	if status and parts then
		-- propertyの割当
		for i1, v1 in pairs(parts.property) do
			for i2, v2 in pairs(header.property) do
				if v1.name == v2.name then
					header.property[i2].def = v1.def
					break
				end
			end
		end
		-- filepathの割当
		for i1, v1 in pairs(parts.filepath) do
			for i2, v2 in pairs(header.filepath) do
				if v1.name == v2.name then
					header.filepath[i2].def = v1.def
					break
				end
			end
		end
		-- TODO: offsetの割当 実装方法
	end
end

-- 設定ファイルを読み込む
local function load_settings(path, header, name)
	local status, parts = pcall(function() return dofile(path).load(header) end)
	if status and parts then
		return parts
	else
		print("simple-play: error " .. tostring(parts))
		table.insert(err_msg, tostring(parts))
		return dofile("skin/" .. name .. "/system/default/" .. tostring(KEYS) .. "keys.lua").load(header)
	end
end

-- 基本機能を読み込む
local function load_modules(path, geometry)
	local status, parts = pcall(function() return dofile(path).load(geometry) end)
	if status and parts then
		return parts
	else
		print("simple-play: error " .. tostring(parts))
		table.insert(err_msg, tostring(parts))
		return {}
	end
end

-- パーツを読み込む
local function load_parts(path, geometry)
	local status, parts = pcall(function() return dofile(path .. "/parts.lua").load(geometry) end)
	if status and parts then
		return parts
	else
		print("simple-play: error " .. tostring(parts))
		table.insert(err_msg, tostring(parts))
		return {}
	end
end

-- フレームを読み込む
local function load_frame(path, geometry)
	local status, parts = pcall(function() return dofile(path .. "/parts.lua").load(geometry) end)
	if status and parts then
		return parts
	else
		print("simple-play: error " .. tostring(parts))
		table.insert(err_msg, tostring(parts))
		return require("default.frame").load(geometry)
	end
end

-- ノーツを読み込む
local function load_notes(path, geometry)
	local status, parts = pcall(function() return dofile(path .. "/parts.lua").load(geometry) end)
	if status and parts then
		return parts
	else
		print("simple-play: error " .. tostring(parts))
		table.insert(err_msg, tostring(parts))
		return require("default.notes.parts").load(geometry)
	end
end

-- パーツの追加位置を取得する
local function get_pos(luaskin, id)
	local pos = nil
	for i, v in pairs(luaskin.destination) do
		if v.id == id then pos = i end
	end
	return pos
end

-- パーツを追加する
local function add_parts(luaskin, parts, id)
	if id then
		local pos = get_pos(luaskin, id)
		if pos then
			add_all(luaskin.source,				parts.source)
			add_all(luaskin.font,				parts.font)
			add_all(luaskin.image,				parts.image)
			add_all(luaskin.imageset,			parts.imageset)
			add_all(luaskin.value,				parts.value)
			add_all(luaskin.text,				parts.text)
			add_all(luaskin.slider,				parts.slider)
			add_all(luaskin.hiddenCover,		parts.hiddenCover)
			add_all(luaskin.liftCover,			parts.liftCover)
			add_all(luaskin.graph,				parts.graph)
			add_all(luaskin.judgegraph,			parts.judgegraph)
			add_all(luaskin.bpmgraph,			parts.bpmgraph)
			add_all(luaskin.judge,				parts.judge)
			add_all(luaskin.hiterrorvisualizer,	parts.hiterrorvisualizer)
			add_all(luaskin.timingvisualizer,	parts.timingvisualizer)
			add_all(luaskin.customEvents,		parts.customEvents)
			add_all(luaskin.customTimers,		parts.customTimers)
			add_all(luaskin.destination,		parts.destination, pos)
		end
	end
end

-- マスコットを追加する
local function add_mascot(luaskin, parts, id)
	if id then
		local pos = get_pos(luaskin, id)
		if pos then
			add_all(luaskin.source,				parts.source)
			add_all(luaskin.image,				parts.image)
			add_all(luaskin.pmchara,			parts.pmchara)
			add_all(luaskin.destination,		parts.destination, pos)
		end
	end
end

-- フレームを追加する
local function add_frame(luaskin, parts)
	add_all(luaskin.source,				parts.source)
	add_all(luaskin.font,				parts.font)
	add_all(luaskin.image,				parts.image)
	add_all(luaskin.imageset,			parts.imageset)
	add_all(luaskin.value,				parts.value)
	add_all(luaskin.text,				parts.text)
	add_all(luaskin.slider,				parts.slider)
	add_all(luaskin.hiddenCover,		parts.hiddenCover)
	add_all(luaskin.liftCover,			parts.liftCover)
	add_all(luaskin.bga,				parts.bga)
	add_all(luaskin.graph,				parts.graph)
	add_all(luaskin.judgegraph,			parts.judgegraph)
	add_all(luaskin.bpmgraph,			parts.bpmgraph)
	add_all(luaskin.judge,				parts.judge)
	add_all(luaskin.hiterrorvisualizer,	parts.hiterrorvisualizer)
	add_all(luaskin.timingvisualizer,	parts.timingvisualizer)
	add_all(luaskin.customEvents,		parts.customEvents)
	add_all(luaskin.customTimers,		parts.customTimers)
	add_all(luaskin.destination,		parts.destination)
end

-- ノーツを追加する
local function add_notes(luaskin, parts, id)
	add_parts(luaskin, parts, id)
	luaskin.note.id = parts.note.id
	add_all(luaskin.note.note,			parts.note.note)
	add_all(luaskin.note.lnend,			parts.note.lnend)
	add_all(luaskin.note.lnstart,		parts.note.lnstart)
	add_all(luaskin.note.lnbody,		parts.note.lnbody)
	add_all(luaskin.note.lnactive,		parts.note.lnactive)
	add_all(luaskin.note.hcnend,		parts.note.hcnend)
	add_all(luaskin.note.hcnstart,		parts.note.hcnstart)
	add_all(luaskin.note.hcnbody,		parts.note.hcnbody)
	add_all(luaskin.note.hcnactive,		parts.note.hcnactive)
	add_all(luaskin.note.hcndamage,		parts.note.hcndamage)
	add_all(luaskin.note.hcnreactive,	parts.note.hcnreactive)
	add_all(luaskin.note.mine,			parts.note.mine)
	add_all(luaskin.note.hidden,		parts.note.hidden)
	add_all(luaskin.note.processed,		parts.note.processed)
	add_all(luaskin.note.size,			parts.note.size)
	add_all(luaskin.note.dst,			parts.note.dst)
	add_all(luaskin.note.group,			parts.note.group)
	add_all(luaskin.note.time,			parts.note.time)
	add_all(luaskin.note.bpm,			parts.note.bpm)
	add_all(luaskin.note.stop,			parts.note.stop)
end

-- ゲージを追加する
local function add_gauge(luaskin, parts, id)
	add_parts(luaskin, parts, id)
	if parts.gauge then
		luaskin.gauge.id	= parts.gauge.id
		luaskin.gauge.parts	= parts.gauge.parts
		add_all(luaskin.gauge.nodes, parts.gauge.nodes)
	end
end

-- BGAを追加する
local function add_bga(luaskin, parts, id)
	add_parts(luaskin, parts, id)
	if parts.bga then
		luaskin.bga.id	= parts.bga.id
	end
end

-- フォントファイルのパスを取得する
local function get_font_path(path)
	return "../customize/" .. (string.sub(path, (string.find(path, "font"))))
end

-- フォルダ名を取得する
local function get_folder_name()
	return string.sub(tostring(package.path), 12, string.len(tostring(package.path)) - 13)
end

-- オプション番号を割り当てる
local property_op = 899
local function assign_property_op()
	property_op = property_op + 1
	return property_op
end

-- オフセットidを割り当てる
local offset_id = 59
local function assign_offset_id()
	offset_id = offset_id + 1
	return offset_id
end

----------------------------------------------------------------------------------------------

local folder_name = get_folder_name()
local config_path = "skin/".. folder_name .. "/system/config/" .. get_tag_hub() .. tostring(KEYS) .. "keys.lua"
local op = {
	save_skin_config = {
		OFF	= assign_property_op(),
		ON	= assign_property_op()
	},
	disp_err = {
		OFF	= assign_property_op(),
		ON	= assign_property_op()
	},
	resolution = {
		_4K		= assign_property_op(),
		WQHD	= assign_property_op(),
		FHD		= assign_property_op(),
		HD		= assign_property_op(),
		XGA		= assign_property_op(),
		SVGA	= assign_property_op(),
		VGA		= assign_property_op()
	}
}

-- header ------------------------------------------------------------------------------------
local header = {
	type		= SKINTYPE,
	name		= folder_name,
	w			= 1920,
	h			= 1080,
	loadend		= 2000,
	playstart	= 1000,
	scene		= 3600000,
	input		= 500,
	close		= 1500,
	fadeout		= 1000,
	property = {
		{name = "スキン構成の保存 SaveSkinConfig", item = {
			{name = "OFF",	op = op.save_skin_config.OFF},
			{name = "ON",	op = op.save_skin_config.ON}
		}, def = "OFF"},
		{name = "エラーメッセージ表示 DisplayErrorMessage", item = {
			{name = "OFF",	op = op.disp_err.OFF},
			{name = "ON",	op = op.disp_err.ON}
		}, def = "OFF"},
		{name = "画面解像度 Resolution", item = {
			{name = "4K(3840x2160)",	op = op.resolution._4K},
			{name = "WQHD(2560x1440)",	op = op.resolution.WQHD},
			{name = "FHD(1920x1080)",	op = op.resolution.FHD},
			{name = "HD(1280x720)",		op = op.resolution.HD},
			{name = "XGA(1024x768)",	op = op.resolution.XGA},
			{name = "SVGA(800x600)",	op = op.resolution.SVGA},
			{name = "VGA(640x480)",		op = op.resolution.VGA}
		}, def = "FHD(1920x1080)"}
	},
	filepath = {
		{name = "システムフォント Font",				path = "../customize/font/*.ttf",		def = "mgenplus-1c-bold.ttf"},
		{name = "フレーム Frame",						path = "../customize/frame/*",			def = "default"},
		{name = "背景 Background",						path = "../customize/background/*",		def = "default.png"},
		{name = "汎用BGA/BGI NoBgaImage",				path = "../customize/bga/*",			def = "default"},
		{name = "鍵盤デザイン Device",					path = "../customize/device/*",			def = "default"},
		{name = "グルーブゲージ GrooveGauge",			path = "../customize/gauge/*",			def = "default"},
		{name = "スコアグラフ ScoreGraph",				path = "../customize/scoregraph/*",		def = "default_1p"},
		{name = "ソングプログレスバー SongProgress",	path = "../customize/songprogress/*",	def = "aqua"},
		{name = "楽曲情報 SongInfo",					path = "../customize/songinfo/*",		def = "default"},
		{name = "BPM Bpm",								path = "../customize/bpm/*",			def = "default"},
		{name = "スコア Score",							path = "../customize/score/*",			def = "default"},
		{name = "スコアレート ScoreRate",				path = "../customize/scorerate/*",		def = "default"},
		{name = "MAXコンボ MaxCombo",					path = "../customize/maxcombo/*",		def = "default"},
		{name = "自己ベストスコア差 DiffBestScore",		path = "../customize/diffbest/*",		def = "default"},
		{name = "ターゲットスコア差 DiffTargetScore",	path = "../customize/difftarget/*",		def = "default"},
		{name = "ランクペース RankPace",				path = "../customize/rankpace/*",		def = "default"},
		{name = "ジャッジカウント JudgeCount",			path = "../customize/judgecount/*",		def = "default"},
		{name = "タイムレフト TimeLeft",				path = "../customize/timeleft/*",		def = "default"},
		{name = "マスコット Mascot",					path = "../customize/mascot/*",			def = "off.png"},
		{name = "動くマスコット MovingMascot",			path = "../customize/movingmascot/*",	def = "off.png"},
		{name = "ぽみゅキャラ Pmchara",					path = "../customize/pmchara/*",		def = "off"},

		{name = "タイミングビジュアライザ TimingVisualizer",		path = "../customize/timingvisualizer/*",	def = "off"},
		{name = "ヒットエラービジュアライザ HitErrorVisualizer",	path = "../customize/hiterrorvisualizer/*",	def = "off"},
		{name = "ジャッジグラフ JudgeGraph",						path = "../customize/judgegraph/*",			def = "off"},
		{name = "BPMグラフ BpmGraph",								path = "../customize/bpmgraph/*",			def = "off"},

		{name = "レーン背景 LaneBackground",			path = "../customize/lanebackground/*",		def = "default.png"},
		{name = "レーン Lane",							path = "../customize/lane/*",				def = "beat"},
		{name = "グロー Glow",							path = "../customize/glow/*",				def = "aqua"},
		{name = "判定ライン JudgeLine",					path = "../customize/judgeline/*",			def = "red"},
		{name = "ノーツ notes",							path = "../customize/notes/*",				def = "simple"},
		{name = "キービーム Keybeam",					path = "../customize/keybeam/*",			def = "default"},
		{name = "レーンカバー1P LaneCover1P",			path = "../customize/cover/lane/*|1|",		def = "default.png"},
		{name = "リフトカバー1P LiftCover1P",			path = "../customize/cover/lift/*|1|",		def = "default.png"},
		{name = "HIDDENカバー1P HiddenCover1P",			path = "../customize/cover/hidden/*|1|",	def = "default.png"},
		{name = "フィニッシュカバー1P FinishCover1P",	path = "../customize/cover/finish/*|1|",	def = "default.png"},
		{name = "カバー数値 CoverDuration",				path = "../customize/coverduration/*",		def = "default"},
		{name = "ボム Bomb",							path = "../customize/bomb/*",				def = "photonring"},
		{name = "判定文字 Judge",						path = "../customize/judge/*",				def = "default2"},
		{name = "判定タイミング JudgeDetail",			path = "../customize/judgedetail/*",		def = "default-fastslow"},
		{name = "ゴーストスコア GhostScore",			path = "../customize/ghost/*",				def = "default-target"},

		{name = "ロード中演出 Loading",				path = "../customize/effect/loading/*",		def = "default"},
		{name = "開始演出 Start",					path = "../customize/effect/start/*",		def = "default"},
		{name = "クリア演出 Clear",					path = "../customize/effect/clear/*",		def = "off"},
		{name = "フルコンボ演出 FullCombo",			path = "../customize/effect/fullcombo/*",	def = "default"},
		{name = "閉店演出 Failed",					path = "../customize/effect/failed/*",		def = "default"},
		{name = "終了演出 Close",					path = "../customize/effect/close/*",		def = "default"},

		{name = "拡張機能1 Extension1",				path = "../customize/extension/*|1|",	def = "off"},
		{name = "拡張機能2 Extension2",				path = "../customize/extension/*|2|",	def = "off"},
		{name = "拡張機能3 Extension3",				path = "../customize/extension/*|3|",	def = "off"},
		{name = "拡張機能4 Extension4",				path = "../customize/extension/*|4|",	def = "off"},
		{name = "拡張機能5 Extension5",				path = "../customize/extension/*|5|",	def = "off"},
		{name = "拡張機能6 Extension6",				path = "../customize/extension/*|6|",	def = "off"},
		{name = "拡張機能7 Extension7",				path = "../customize/extension/*|7|",	def = "off"},
		{name = "拡張機能8 Extension8",				path = "../customize/extension/*|8|",	def = "off"},
		{name = "拡張機能9 Extension9",				path = "../customize/extension/*|9|",	def = "off"},
		{name = "拡張機能10 Extension10",			path = "../customize/extension/*|10|",	def = "off"}
	},
	offset = {},
	category = {
		{name = "基本設定", item = {
			"スキン構成の保存 SaveSkinConfig",
			"エラーメッセージ表示 DisplayErrorMessage",
			"設定ファイル Settings",
			"画面解像度 Resolution",
			"システムフォント Font"
		}},
		{name = "フレーム", item = {
			"フレーム Frame",
			"背景 Background",
			"汎用BGA/BGI NoBgaImage",
			"鍵盤デザイン Device",
			"グルーブゲージ GrooveGauge",
			"スコアグラフ ScoreGraph",
			"ソングプログレスバー SongProgress",
			"楽曲情報 SongInfo",
			"BPM Bpm",
			"スコア Score",
			"スコアレート ScoreRate",
			"MAXコンボ MaxCombo",
			"自己ベストスコア差 DiffBestScore",
			"ターゲットスコア差 DiffTargetScore",
			"ランクペース RankPace",
			"ジャッジカウント JudgeCount",
			"タイムレフト TimeLeft",
			"マスコット Mascot",
			"動くマスコット MovingMascot",
			"ぽみゅキャラ Pmchara",
			"タイミングビジュアライザ TimingVisualizer",
			"ヒットエラービジュアライザ HitErrorVisualizer",
			"ジャッジグラフ JudgeGraph",
			"BPMグラフ BpmGraph",
		}},
		{name = "プレイエリア", item = {
			"レーン背景 LaneBackground",
			"レーン Lane",
			"グロー Glow",
			"判定ライン JudgeLine",
			"ノーツ notes",
			"キービーム Keybeam",
			"レーンカバー1P LaneCover1P",
			"レーンカバー2P LaneCover2P",
			"リフトカバー1P LiftCover1P",
			"リフトカバー2P LiftCover2P",
			"HIDDENカバー1P HiddenCover1P",
			"HIDDENカバー2P HiddenCover2P",
			"フィニッシュカバー1P FinishCover1P",
			"フィニッシュカバー2P FinishCover2P",
			"カバー数値 CoverDuration",
			"ボム Bomb",
			"判定文字 Judge",
			"判定タイミング JudgeDetail",
			"ゴーストスコア GhostScore"
		}},
		{name = "エフェクト", item = {
			"ロード中演出 Loading",
			"開始演出 Start",
			"クリア演出 Clear",
			"フルコンボ演出 FullCombo",
			"閉店演出 Failed",
			"終了演出 Close",
		}},
		{name = "拡張機能", item = {
			"拡張機能1 Extension1",
			"拡張機能2 Extension2",
			"拡張機能3 Extension3",
			"拡張機能4 Extension4",
			"拡張機能5 Extension5",
			"拡張機能6 Extension6",
			"拡張機能7 Extension7",
			"拡張機能8 Extension8",
			"拡張機能9 Extension9",
			"拡張機能10 Extension10"
		}}
	}
}

header.name = header.name .. " " .. tostring(KEYS) .. "keys"
defside = ""
if KEYS == 5 or KEYS == 7 then
	defside = "1P"
end
table.insert(header.filepath, 1, {name = "設定ファイル Settings", path = "../customize/settings/" .. tostring(KEYS) .. "keys/*", def = "default" .. defside .. ".lua"})
if KEYS == 10 or KEYS == 14 then
	table.insert(header.filepath,		{name = "レーンカバー2P LaneCover2P",			path = "../customize/cover/lane/*|2|",		def = "default.png"})
	table.insert(header.filepath,		{name = "リフトカバー2P LiftCover2P",			path = "../customize/cover/lift/*|2|",		def = "default.png"})
	table.insert(header.filepath,		{name = "HIDDENカバー2P HiddenCover2P",			path = "../customize/cover/hidden/*|2|",	def = "default.png"})
	table.insert(header.filepath,		{name = "フィニッシュカバー2P FinishCover2P",	path = "../customize/cover/finish/*|2|",	def = "default.png"})
end

-- カテゴリの設定
for i = 1, #header.property	do header.property[i].category	= header.property[i].name	end
for i = 1, #header.filepath	do header.filepath[i].category	= header.filepath[i].name	end
for i = 1, #header.offset	do header.offset[i].category	= header.offset[i].name		end

-- スキン構成の読込
load_skin_config(header, config_path)
----------------------------------------------------------------------------------------------


-- main --------------------------------------------------------------------------------------
local function main()
	-- スキン構成の保存
	if skin_config.option["スキン構成の保存 SaveSkinConfig"] == op.save_skin_config.ON then output_skin_config(header, config_path) end

	-- 画面解像度の設定
	if		skin_config.option["画面解像度 Resolution"] == op.resolution._4K	then header.w, header.h = 3840, 2160
	elseif	skin_config.option["画面解像度 Resolution"] == op.resolution.WQHD	then header.w, header.h = 2560, 1440
	elseif	skin_config.option["画面解像度 Resolution"] == op.resolution.FHD	then header.w, header.h = 1920, 1080
	elseif	skin_config.option["画面解像度 Resolution"] == op.resolution.HD		then header.w, header.h = 1280, 720
	elseif	skin_config.option["画面解像度 Resolution"] == op.resolution.XGA	then header.w, header.h = 1024, 768
	elseif	skin_config.option["画面解像度 Resolution"] == op.resolution.SVGA	then header.w, header.h = 800, 600
	elseif	skin_config.option["画面解像度 Resolution"] == op.resolution.VGA	then header.w, header.h = 640, 480
	end

	-- スキン初期化
	local skin = require("modules.init").skin
	for k, v in pairs(header) do skin[k] = v end

	-- 設定ファイル読込
	local geometry = load_settings(skin_config.get_path(header.filepath[1].path), header, folder_name)
	geometry.type = header.type
	geometry.resolution = {
		w = header.w,
		h = header.h
	}
	geometry.name		= header.name
	geometry.loadend	= header.loadend
	geometry.playstart	= header.playstart
	geometry.scene		= header.scene
	geometry.input		= header.input
	geometry.close		= header.close
	geometry.fadeout	= header.fadeout

	-- フォント設定
	skin.font = {{id = "system-font", path = get_font_path(skin_config.get_path("../customize/font/*.ttf"))}}

	-- Hub用
	function get_simple_play_settings() return geometry end
	local hub = {
		flg = {
			changed_bomb	= false,
			changed_judge	= false,
			changed_fce		= false
		},
		init = {
			judge = {
				judge = {},
				destination = {}
			}
		}
	}

	table.insert(hub.init.judge.judge, {id = "judge1", index = 0, images = {}, numbers = {}, shift = true})
	table.insert(hub.init.judge.destination, {id = "judge1"})
	if KEYS == 10 or KEYS == 14 then
		table.insert(hub.init.judge.judge, {id = "judge2", index = 1, images = {}, numbers = {}, shift = true})
		table.insert(hub.init.judge.destination, {id = "judge2"})
	end
	if PATH_HUB then
		hub.flg.changed_bomb	= is_hub_changed_bomb()
		hub.flg.changed_judge	= is_hub_changed_judge()
		hub.flg.changed_fce		= is_hub_changed_fce()
	end

	-- パーツ読込
	add_frame(skin, load_frame(skin_config.get_path("../customize/frame/*"),					geometry))

	add_parts(skin, load_modules("skin/" .. folder_name .. "/system/modules/background.lua",	geometry),	"sps-background")

	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|1|"),				geometry),	"sps-extension1")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|2|"),				geometry),	"sps-extension2")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|3|"),				geometry),	"sps-extension3")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|4|"),				geometry),	"sps-extension4")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|5|"),				geometry),	"sps-extension5")

	add_bga  (skin, load_modules("skin/" .. folder_name .. "/system/modules/bga.lua",			geometry),	"sps-bga")

	add_parts(skin, load_parts(skin_config.get_path("../customize/device/*"),					geometry),	"sps-device")
	add_gauge(skin, load_parts(skin_config.get_path("../customize/gauge/*"),					geometry),	"sps-gauge")
	add_parts(skin, load_parts(skin_config.get_path("../customize/scoregraph/*"),				geometry),	"sps-scoregraph")
	add_parts(skin, load_parts(skin_config.get_path("../customize/songprogress/*"),				geometry),	"sps-songprogress")
	add_mascot(skin, load_modules("skin/" .. folder_name .. "/system/modules/mascot.lua",		geometry),	"sps-mascot")
	add_parts(skin, load_parts(skin_config.get_path("../customize/songinfo/*"),					geometry),	"sps-songinfo")
	add_parts(skin, load_parts(skin_config.get_path("../customize/bpm/*"),						geometry),	"sps-bpm")
	add_parts(skin, load_parts(skin_config.get_path("../customize/score/*"),					geometry),	"sps-score")
	add_parts(skin, load_parts(skin_config.get_path("../customize/scorerate/*"),				geometry),	"sps-scorerate")
	add_parts(skin, load_parts(skin_config.get_path("../customize/maxcombo/*"),					geometry),	"sps-maxcombo")
	add_parts(skin, load_parts(skin_config.get_path("../customize/diffbest/*"),					geometry),	"sps-diffbest")
	add_parts(skin, load_parts(skin_config.get_path("../customize/difftarget/*"),				geometry),	"sps-difftarget")
	add_parts(skin, load_parts(skin_config.get_path("../customize/rankpace/*"),					geometry),	"sps-rankpace")
	add_parts(skin, load_parts(skin_config.get_path("../customize/judgecount/*"),				geometry),	"sps-judgecount")
	add_parts(skin, load_parts(skin_config.get_path("../customize/timeleft/*"),					geometry),	"sps-timeleft")

	add_parts(skin, load_modules("skin/" .. folder_name .. "/system/modules/lanebackground.lua",	geometry),	"sps-lanebackground")
	add_parts(skin, load_parts(skin_config.get_path("../customize/lane/*"),							geometry),	"sps-lane")
	add_parts(skin, load_parts(skin_config.get_path("../customize/glow/*"),							geometry),	"sps-glow")
	add_parts(skin, load_parts(skin_config.get_path("../customize/judgeline/*"),					geometry),	"sps-judgeline")
	add_parts(skin, load_parts(skin_config.get_path("../customize/keybeam/*"),						geometry),	"sps-keybeam")
	add_notes(skin, load_notes(skin_config.get_path("../customize/notes/*"),						geometry),	"sps-notes")
	add_parts(skin, load_modules("skin/" .. folder_name .. "/system/modules/cover.lua",				geometry),	"sps-cover")
	add_parts(skin, load_parts(skin_config.get_path("../customize/coverduration/*"),				geometry),	"sps-coverduration")
	if not hub.flg.changed_bomb  then add_parts(skin, load_parts(skin_config.get_path("../customize/bomb/*"),  geometry), "sps-bomb") end
	if not hub.flg.changed_judge then add_parts(skin, load_parts(skin_config.get_path("../customize/judge/*"), geometry), "sps-judge")
	else add_parts(skin, hub.init.judge, "sps-judge") end
	add_parts(skin, load_parts(skin_config.get_path("../customize/judgedetail/*"),					geometry),	"sps-judgedetail")
	add_parts(skin, load_parts(skin_config.get_path("../customize/ghost/*"),						geometry),	"sps-ghost")

	add_parts(skin, load_parts(skin_config.get_path("../customize/timingvisualizer/*"),				geometry),	"sps-timingvisualizer")
	add_parts(skin, load_parts(skin_config.get_path("../customize/hiterrorvisualizer/*"),			geometry),	"sps-hiterrorvisualizer")
	add_parts(skin, load_parts(skin_config.get_path("../customize/judgegraph/*"),					geometry),	"sps-judgegraph")
	add_parts(skin, load_parts(skin_config.get_path("../customize/bpmgraph/*"),						geometry),	"sps-bpmgraph")

	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|6|"),					geometry),	"sps-extension6")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|7|"),					geometry),	"sps-extension7")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|8|"),					geometry),	"sps-extension8")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|9|"),					geometry),	"sps-extension9")
	add_parts(skin, load_parts(skin_config.get_path("../customize/extension/*|10|"),				geometry),	"sps-extension10")

	add_parts(skin, load_parts(skin_config.get_path("../customize/effect/loading/*"),	geometry),	"sps-loading")
	add_parts(skin, load_parts(skin_config.get_path("../customize/effect/start/*"),		geometry),	"sps-start")
	add_parts(skin, load_parts(skin_config.get_path("../customize/effect/clear/*"),		geometry),	"sps-clear")
	if not hub.flg.changed_fce then add_parts(skin, load_parts(skin_config.get_path("../customize/effect/fullcombo/*"),	geometry), "sps-fullcombo") end
	add_parts(skin, load_parts(skin_config.get_path("../customize/effect/failed/*"),	geometry),	"sps-failed")
	add_parts(skin, load_parts(skin_config.get_path("../customize/effect/close/*"),		geometry),	"sps-close")

	-- TODO: 効果あるのか
	-- 画像ファイル先読み
	for i, v in pairs(skin.source) do
		if v.id ~= "src-pomyu1p" then -- ぽみゅキャラはフォルダ指定なので除外
			table.insert(skin.image, i,			{id = "ahead-img-" .. v.id, src = v.id, x = 0, y = 0, w = -1, h = -1})
			table.insert(skin.destination, i,	{id = "ahead-img-" .. v.id, dst = {{x = 0, y = 0, w = 1, h = 1}}})
		end
	end

	-- エラーメッセージ表示
	if skin_config.option["エラーメッセージ表示 DisplayErrorMessage"] == op.disp_err.ON then
		for i, v in pairs(err_msg) do
			table.insert(skin.text, {id = "error-" .. i, font = "system-font", size = 20, constantText = v, shadowOffsetX = 1, shadowOffsetY = 1})
			table.insert(skin.destination, {id = "error-" .. i, dst = {{x = 0, y = 1080 - (i * 22), w = 20, h = 20, r = 255, g = 200, b = 60}}})
		end
	end

	return skin
end
----------------------------------------------------------------------------------------------


return {
	header	= header,
	main	= main
}

local DEBUG = false
local SKIN_MSG = "Hub: "
local MODE = require("mode")

if DEBUG then print(SKIN_MSG .. "MODE = " .. MODE) end

function mode_modernchic()		return MODE == 1	end
function mode_generictheme()	return MODE == 2	end
function mode_type_m()			return MODE == 3	end
function mode_rogan()			return MODE == 4	end
function mode_socialskin()		return MODE == 5	end
function mode_hij_simple()		return MODE == 6	end
function mode_neotm()			return MODE == 7	end
function mode_dotpop()			return MODE == 8	end
function mode_simple_play()		return MODE == 9	end
function mode_other()			return MODE == -1	end -- TODO: なんか良い方法思いついたら作る

function is_play_5keys()	return SKINTYPE == const.SKINTYPE.PLAY_5KEYS	end
function is_play_7keys()	return SKINTYPE == const.SKINTYPE.PLAY_7KEYS	end
function is_play_9keys()	return SKINTYPE == const.SKINTYPE.PLAY_9KEYS	end
function is_play_10keys()	return SKINTYPE == const.SKINTYPE.PLAY_10KEYS	end
function is_play_14keys()	return SKINTYPE == const.SKINTYPE.PLAY_14KEYS	end

function convert_7to5()
	if CONVERT then
		return SKINTYPE == const.SKINTYPE.PLAY_7KEYS and CONVERT == const.SKINTYPE.PLAY_5KEYS
	else
		return false
	end
end

function convert_14to10()
	if CONVERT then
		return SKINTYPE == const.SKINTYPE.PLAY_14KEYS and CONVERT == const.SKINTYPE.PLAY_10KEYS
	else
		return false
	end
end

------------------------------------------------------------------------



-- common --------------------------------------------------------------
--[[ TODO: 
--	カスタムイベント関係
--	判定周辺の表記(FAST-SLOW ターゲットスコア)差し替え
--	9BUTTON/24KEYS/48KEYSの対応
--	被りと繰り返しを削減する
--]]

--[[
--	リストに要素を追加する
--]]
local function add_all(list, t)
	if t then
		for i, v in pairs(t) do
			table.insert(list, v)
		end
	end
end

--[[
--	ファイルが存在するかどうか
--	arg	path: skinフォルダからの相対パス 
--]]
local function file_exists(path)
	local status, parts = pcall(function() return loadfile(path) end)
	if status and parts then
		return true
	else
		return false
	end
end

-- 拡張機能をスキンに追加する(dst)
local function add_dstination(luaskin, parts, line)
	if parts.destination then
		local pos = line
		for i, v in pairs(parts.destination) do
			table.insert(luaskin.destination, pos, v)
			pos = pos + 1
		end
	end
end

-- 拡張機能をスキンに追加する
local function add_extension(luaskin, parts)
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
	add_all(luaskin.pmchara,			parts.pmchara)
	add_all(luaskin.customEvents,		parts.customEvents)
	add_all(luaskin.customTimers,		parts.customTimers)
	
	--[[ dst追加位置の指定
	--	prefix	: id			string
	--	postfix	: id			string
	--	line	: テーブル位置	number
	--]]
	
	-- 指定したidの前に追加
	if parts.prefix then
		local line, c = nil, 1
		for i, v in pairs(luaskin.destination) do
			if parts.prefix == v.id then
				line = c
			else
				c = c + 1
			end
		end
		if line then
			add_dstination(luaskin, parts, line)
		else
			add_all(luaskin.destination, parts.destination)
		end
		
	-- 指定したidの後に追加
	elseif parts.postfix then
		local line, c = nil, 1
		for i, v in pairs(luaskin.destination) do
			if parts.postfix == v.id then
				line = c + 1
			else
				c = c + 1
			end
		end
		if line then
			add_dstination(luaskin, parts, line)
		else
			add_all(luaskin.destination, parts.destination)
		end
		
	-- 指定したテーブル位置に追加
	elseif parts.line then
		if parts.line == 0 then parts.line = 1 end
		add_dstination(luaskin, parts, parts.line)
		
	-- 未記入時末尾に追加
	else
		add_all(luaskin.destination, parts.destination)
	end
	
end

-- 拡張機能を読み込む
local function load_extension(luaskin, path)
	local status, parts = pcall(function() return dofile(path .. "/parts.lua").load(luaskin, path) end)
	if status and parts then
		add_extension(luaskin, parts)
	else
		print(SKIN_MSG .. parts)
	end
end

--[[
--	ヘッダに必要なテーブルが存在しないとき追加する
--]]
local function check_header_tbl(luaskin)
	if not luaskin.property	then luaskin.property	= {} end
	if not luaskin.filepath	then luaskin.filepath	= {} end
	if not luaskin.offset	then luaskin.offset		= {} end
	if not luaskin.category	then luaskin.category	= {} end
end

--[[
--	スキンに必要なテーブルが存在しないとき追加する
--]]
local function check_skin_tbl(luaskin)
	if not luaskin.source				then luaskin.source				= {} end
	if not luaskin.font					then luaskin.font				= {} end
	if not luaskin.image				then luaskin.image				= {} end
	if not luaskin.imageset				then luaskin.imageset			= {} end
	if not luaskin.value				then luaskin.value				= {} end
	if not luaskin.text					then luaskin.text				= {} end
	if not luaskin.slider				then luaskin.slider				= {} end
	if not luaskin.hiddenCover			then luaskin.hiddenCover		= {} end
	if not luaskin.liftCover			then luaskin.liftCover			= {} end
	if not luaskin.graph				then luaskin.graph				= {} end
	if not luaskin.judgegraph			then luaskin.judgegraph			= {} end
	if not luaskin.bpmgraph				then luaskin.bpmgraph			= {} end
	if not luaskin.judge				then luaskin.judge				= {} end
	if not luaskin.hiterrorvisualizer	then luaskin.hiterrorvisualizer	= {} end
	if not luaskin.timingvisualizer		then luaskin.timingvisualizer	= {} end
	if not luaskin.pmchara				then luaskin.pmchara			= {} end
	if not luaskin.customEvents			then luaskin.customEvents		= {} end
	if not luaskin.customTimers			then luaskin.customTimers		= {} end
	if not luaskin.destination			then luaskin.destination		= {} end
end

--[[
--	スキン名にタグを追加する
--]]
local function set_skin_name(luaskin, tag)
	luaskin.name = luaskin.name .. tag
end

local function add_category_item(luaskin, name, item)
	for i, v in pairs(luaskin.category) do
		if v.name == name then
			table.insert(luaskin.category[i].item, item)
		end
	end
end

--[[
--	ヘッダの各項目名をカテゴリ名にコピーする
--]]
local function set_category(luaskin)
	for i, v in pairs(luaskin.property) do
		luaskin.property[i].category = v.name
	end
	for i, v in pairs(luaskin.filepath) do
		luaskin.filepath[i].category = v.name
	end
	for i, v in pairs(luaskin.offset) do
		luaskin.offset[i].category = v.name
	end
end

--[[
--	ヘッダに要素を追加する
--]]
local function add_header(luaskin, parts)
	add_all(luaskin.property,	parts.property)
	add_all(luaskin.filepath,	parts.filepath)
	add_all(luaskin.offset,		parts.offset)
	add_all(luaskin.category,	parts.category)
end

--[[
--	 ヘッダプロパティの指定した項目にアイテムを追加する
--]]
local function add_property_item(luaskin, name, item)
	for i, v in pairs(luaskin.property) do
		if v.name == name then
			table.insert(luaskin.property[i].item, item)
		end
	end
end

--[[
--	ヘッダファイルパスに要素を追加する
--]]
local function add_filepath(luaskin, tbl)
	if tbl then
		table.insert(luaskin.filepath, tbl)
	end
end

--[[
--	ヘッダオフセットに要素を追加する
--]]
local function add_offset(luaskin, tbl)
	if tbl then
		table.insert(luaskin.offset, tbl)
	end
end

--[[
--	スキンに要素を追加する
--]]
local function add_parts(luaskin, parts)
	add_all(luaskin.source,			parts.source)
	add_all(luaskin.image,			parts.image)
	add_all(luaskin.imageset,		parts.imageset)
	add_all(luaskin.value,			parts.value)
	add_all(luaskin.destination,	parts.destination)
end

--[[
--	スキンノーツを置き換える
--]]
local function overwrite_note(luaskin, parts)
	luaskin.note.note			= parts.note.note
	luaskin.note.lnend			= parts.note.lnend
	luaskin.note.lnstart		= parts.note.lnstart
	luaskin.note.lnbody			= parts.note.lnbody
	luaskin.note.lnactive		= parts.note.lnactive
	luaskin.note.hcnend			= parts.note.hcnend
	luaskin.note.hcnstart		= parts.note.hcnstart
	luaskin.note.hcnbody		= parts.note.hcnbody
	luaskin.note.hcnactive		= parts.note.hcnactive
	luaskin.note.hcndamage		= parts.note.hcndamage
	luaskin.note.hcnreactive	= parts.note.hcnreactive
	luaskin.note.mine			= parts.note.mine
	luaskin.note.size			= parts.note.size
end

--[[
--	スキンノーツのy座標を調整する
--]]
local function adjust_dst_note(luaskin, size)
	for i, v in pairs(luaskin.note.dst) do
		luaskin.note.dst[i].y = luaskin.note.dst[i].y + size
	end
end

--[[
--	スキンの判定文字を置き換える
--]]
local function overwrite_judge(luaskin, parts)
	luaskin.judge = parts.judge
end

--[[
--	スキンから使用可能なカスタムタイマーidを取得する
--]]
local function get_available_customTimer_id(luaskin)
	local t = {}
	for i = 10000, 19999 do
		table.insert(t, i)
	end
	for i, v1 in pairs(luaskin.customTimers) do
		for i, v2 in pairs(t) do
			if v2 == v1.id then
				table.remove(t, i)
				print(SKIN_MSG .. "not available_customTimer_id = " .. i)
			end
		end
	end
	return t
end

--[[
-- カスタムタイマーidのgetterを生成する
--]]
local function create_customTimer_id(luaskin)
	local customTimer = {
		id = get_available_customTimer_id(luaskin),
		key = 0
	}
	local function get()
		customTimer.key = customTimer.key + 1
		print(SKIN_MSG .. "use_customTimer_id " .. customTimer.id[customTimer.key])
		if customTimer.id[customTimer.key] then
			return customTimer.id[customTimer.key]
		else
			return 19999
		end
	end
	return {
		customTimer = customTimer,
		get = get
	}
end

--[[
--	スキンから使用可能なop番号を取得する
--]]
local function get_available_op(luaskin)
	local t = {}
	for i = 900, 1999 do -- 暫定
		table.insert(t, i)
	end
	for i, v1 in pairs(luaskin.property) do
		for i, v2 in pairs(v1.item) do
			for i, v3 in pairs(t) do
				if v3 == v2.op then
					table.remove(t, i)
				end
			end
		end
	end
	if DEBUG then print(SKIN_MSG .. "available_op " .. table.concat(t, ",")) end
	return t
end

--[[
--	スキンから使用可能なオフセットidを取得する
--]]
local function get_available_id(luaskin)
	local t = {}
	for i = 52, 199 do
		table.insert(t, i)
	end
	for i, v1 in pairs(luaskin.offset) do
		for i, v2 in pairs(t) do
			if v2 == v1.id then
				table.remove(t, i)
			end
		end
	end
	if DEBUG then print(SKIN_MSG .. "available_id " .. table.concat(t, ",")) end
	return t
end

--[[
-- プロパティopのgetterを生成する
--]]
local function create_property_op(luaskin)
	local property = {
		op = get_available_op(luaskin),
		key = 0
	}
	local function get()
		property.key = property.key + 1
		if DEBUG then print(SKIN_MSG .. "use_op " .. property.op[property.key]) end
		if property.op[property.key] then
			return property.op[property.key]
		else
			print(SKIN_MSG .. "op 上限を超えています")
			return 1999
		end
	end
	return {
		property = property,
		get = get
	}
end

--[[
-- オフセットidのgetterを生成する
--]]
local function create_offset_id(luaskin)
	local offset = {
		id = get_available_id(luaskin),
		key = 0
	}
	local function get()
		offset.key = offset.key + 1
		if DEBUG then print(SKIN_MSG .. "use_id " .. offset.id[offset.key]) end
		if offset.id[offset.key] then
			return offset.id[offset.key]
		else
			print(SKIN_MSG .. "id 上限を超えています")
			return 199
		end
	end
	return {
		offset = offset,
		get = get
	}
end

--[[
--	指定したopがonかどうか
--]]
local function option(name, op)
	if skin_config then
		return skin_config.option[name] == op
	end
end

--[[
--	指定したid名のオフセットを取得する
--	return: offset{x, y, w, h, r, a}
--]]
local function get_offset(name)
	if skin_config then
		return {
			x = skin_config.offset[name].x,
			y = skin_config.offset[name].y,
			w = skin_config.offset[name].w,
			h = skin_config.offset[name].h,
			r = skin_config.offset[name].r,
			a = skin_config.offset[name].a
		}
	end
end

--[[
--	スキンからレーンの情報を取得する
--	return:	lane{
--				x_center	各レーンの中心x座標
--				y			各レーンのy座標
--			}
--			lanes{
--				x			1Pレーンのx座標(左端)
--				x2			2Pレーンのx座標(左端)
--				x_center	1Pレーン全体の中心x座標
--				x_center2	2Pレーン全体の中心x座標
--				y			全体のy座標(平均値)
--				w			1Pレーン全体の幅
--				w2			2Pレーン全体の幅
--			}
--]]
local function explore_lane_data(luaskin)
	local lane = {
		x_center	= {},
		y			= {}
	}
	local lanes = {
		x			= 0,
		x2			= 0,
		x_center	= 0,
		x_center2	= 0,
		y			= 0,
		w			= 0,
		w2			= 0
	}
	do
		local tmp, c = {0, 0, 10000}, 6
		if is_play_7keys() or is_play_14keys() then c = 8 end
		if is_play_9keys() then c = 9 end
		for i, v in pairs(luaskin.note.dst) do
			tmp[1] = tmp[1] + v.y
			if tmp[2] <= v.x + v.w then
				tmp[2] = v.x + v.w
			end
			if tmp[3] >= v.x then
				tmp[3] = v.x
			end
			if i == c then
				lanes.x_center = tmp[3] + ((tmp[2] - tmp[3]) / 2)
				lanes.x = tmp[3]
				tmp[2], tmp[3] = 0, 10000
			elseif i == (c * 2) then
				lanes.x_center2 = tmp[3] + ((tmp[2] - tmp[3]) / 2)
				lanes.x2 = tmp[3]
			end
			lane.x_center[i]	= v.x + (v.w / 2)
			lane.y[i]			= v.y
			if DEBUG then print(SKIN_MSG .. "lane.x_center[" .. i .. "] = "	.. lane.x_center[i])	end
			if DEBUG then print(SKIN_MSG .. "lane.y[" .. i .. "] = "		.. lane.y[i])			end
		end
		lanes.y = tmp[1] / #luaskin.note.dst
		if DEBUG then print(SKIN_MSG .. "lanes.y = " .. lanes.y) end
	end
	lanes.w = (lanes.x_center - lanes.x) * 2
	lanes.w2 = (lanes.x_center2 - lanes.x2) * 2
	if mode_modernchic() or mode_generictheme() then
		lanes.y = lanes.y + 12
	end
	return lane, lanes
end

--[[
--	スキンから判定文字の情報を取得する
--	return:	judge{
--				id{}	id
--				index{}	index
--			}
--]]
local function fetch_judge_data(luaskin)
	local judge = {
		id		= {},
		index	= {}
	}
	for i, v in pairs(luaskin.judge) do
		judge.id[i] = v.id
		judge.index[i] = v.index
		if DEBUG then print(SKIN_MSG .. "judge.id[" .. i .. "] = "		.. judge.id[i])		end
		if DEBUG then print(SKIN_MSG .. "judge.index[" .. i .. "] = "	.. judge.index[i])	end
	end
	return judge
end

local function remove_parts(luaskin, pos, count)
	for c = 1, count do table.remove(luaskin, pos) end
end

------------------------------------------------------------------------




-- exclusive -----------------------------------------------------------

--[[
--	7鍵スキンを5鍵で使えるようにする
--	スクラッチが両端どちらかにあること レーンの間隔がそろっていること前提
--]]
local function changed_type_7to5(luaskin, lanes)
	
	local cover = {}
	cover.pos = 0
	cover.line = luaskin.note.dst[2].x - (luaskin.note.dst[1].x + luaskin.note.dst[1].w)
	cover.x = luaskin.note.dst[6].x
	cover.y = lanes.y
	cover.w = luaskin.note.dst[3].x - luaskin.note.dst[1].x - cover.line
	cover.h = 1080 - luaskin.note.dst[1].y
	local bomb_id = {} -- hij_simple用
	for i = 1, 7 do
		for j = 1, 4 do
			table.insert(bomb_id, "bomb"..i..j)
		end
	end
	-- 1鍵とスクラッチの座標を比較して1P/2Pを判断
	local pos = 1
	if luaskin.note.dst[1].x > luaskin.note.dst[8].x then pos = 6 end
	-- ノーツ(レーン)を5鍵分に削減
	for i = 1, 2 do
		if luaskin.note.note				then table.remove(luaskin.note.note, pos)				end
		if luaskin.note.lnend				then table.remove(luaskin.note.lnend, pos)				end
		if luaskin.note.lnstart				then table.remove(luaskin.note.lnstart, pos)			end
		if luaskin.note.lnbody				then table.remove(luaskin.note.lnbody, pos)				end
		if luaskin.note.lnactive			then table.remove(luaskin.note.lnactive, pos)			end
		if luaskin.note.hcnend				then table.remove(luaskin.note.hcnend, pos)				end
		if luaskin.note.hcnstart			then table.remove(luaskin.note.hcnstart, pos)			end
		if luaskin.note.hcnbody				then table.remove(luaskin.note.hcnbody, pos)			end
		if luaskin.note.hcnactive			then table.remove(luaskin.note.hcnactive, pos)			end
		if luaskin.note.hcndamage			then table.remove(luaskin.note.hcndamage, pos)			end
		if luaskin.note.hcnreactive			then table.remove(luaskin.note.hcnreactive, pos)		end
		if luaskin.note.mine				then table.remove(luaskin.note.mine, pos)				end
		if luaskin.note.size				then table.remove(luaskin.note.size, pos)				end
		if luaskin.note.lnbodyActive		then table.remove(luaskin.note.lnbodyActive, pos)		end
		if luaskin.note.hcnbodyActive		then table.remove(luaskin.note.hcnbodyActive, pos)		end
		if luaskin.note.hcnbodyMiss			then table.remove(luaskin.note.hcnbodyMiss, pos)		end
		if luaskin.note.hcnbodyReactive		then table.remove(luaskin.note.hcnbodyReactive, pos)	end
		table.remove(luaskin.note.dst, pos)
	end
	-- スクラッチが右側にある時ボムとキーのタイマーで動いているものを右にずらす
	-- TODO: timer(image, destination)とref(imageset)を書き換える方が不具合出にくいかも
	if pos == 1 then
		cover.x = luaskin.note.dst[1].x - cover.w - cover.line
		-- 白鍵から次の白鍵までの距離分動かす
		local offset_x = luaskin.note.dst[3].x - luaskin.note.dst[1].x
		for i, v in pairs(luaskin.destination) do
			if mode_hij_simple() then
				for i2, v2 in pairs(bomb_id) do
					if v.id == v2 then
						for i3 = 1, #luaskin.destination[i].dst do
							if luaskin.destination[i].dst[i3].x then
								luaskin.destination[i].dst[i3].x = luaskin.destination[i].dst[i3].x + offset_x
							end
						end
					end
				end
			end
			if v.timer and type(v.timer) == "number" and v.timer >= 51 and v.timer <= 57 then
				for i2 = 1, #luaskin.destination[i].dst do
					if luaskin.destination[i].dst[i2].x then
						luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
					end
				end
			end
			if v.timer and type(v.timer) == "number" and v.timer >= 71 and v.timer <= 77 then
				for i2 = 1, #luaskin.destination[i].dst do
					if luaskin.destination[i].dst[i2].x then
						luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
					end
				end
			end
			if v.timer and type(v.timer) == "number" and v.timer >= 101 and v.timer <= 107 then
				for i2 = 1, #luaskin.destination[i].dst do
					if luaskin.destination[i].dst[i2].x then
						luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
					end
				end
			end
			if v.timer and type(v.timer) == "number" and v.timer >= 121 and v.timer <= 127 then
				for i2 = 1, #luaskin.destination[i].dst do
					if luaskin.destination[i].dst[i2].x then
						luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
					end
				end
			end
		end
	end
	for i, v in pairs(luaskin.destination) do
		if v.id == luaskin.note.id then
			cover.pos = i + 1
		end
	end
	--[[
	table.insert(luaskin.destination, cover.pos, {id = -111, loop = 1000, offset = 3, dst = {
		{time = 500, x = cover.x, y = 1080, w = cover.w, h = cover.h, acc = 2, r = 16, g = 16, b = 16, a = 224},
		{time = 1000, y = cover.y}
	}})
	--]]
end

--[[
--	14鍵スキンを10鍵で使えるようにする
--	スクラッチが両端どちらかにあること レーンの間隔がそろっていること前提
--]]
local function changed_type_14to10(luaskin, lanes)
	
	local cover = {}
	cover.pos = 0
	cover.line = luaskin.note.dst[2].x - (luaskin.note.dst[1].x + luaskin.note.dst[1].w)
	cover.x = luaskin.note.dst[6].x
	cover.x2 = luaskin.note.dst[9].x
	cover.y = lanes.y
	cover.w = luaskin.note.dst[3].x - luaskin.note.dst[1].x - cover.line
	cover.h = 1080 - luaskin.note.dst[1].y
	local bomb_id_2p = {} -- hij_simple用
	for i = 1, 7 do
		for j = 1, 4 do
			table.insert(bomb_id_2p, "bomb"..i..j.."_2p")
		end
	end
	local offset_x = luaskin.note.dst[3].x - luaskin.note.dst[1].x
	
	-- ノーツ(レーン)を10鍵分に削減
	local pos = {10, 9, 7, 6}
	for i = 1, #pos do
		if luaskin.note.note				then table.remove(luaskin.note.note, pos[i])			end
		if luaskin.note.lnend				then table.remove(luaskin.note.lnend, pos[i])			end
		if luaskin.note.lnstart				then table.remove(luaskin.note.lnstart, pos[i])			end
		if luaskin.note.lnbody				then table.remove(luaskin.note.lnbody, pos[i])			end
		if luaskin.note.lnactive			then table.remove(luaskin.note.lnactive, pos[i])		end
		if luaskin.note.hcnend				then table.remove(luaskin.note.hcnend, pos[i])			end
		if luaskin.note.hcnstart			then table.remove(luaskin.note.hcnstart, pos[i])		end
		if luaskin.note.hcnbody				then table.remove(luaskin.note.hcnbody, pos[i])			end
		if luaskin.note.hcnactive			then table.remove(luaskin.note.hcnactive, pos[i])		end
		if luaskin.note.hcndamage			then table.remove(luaskin.note.hcndamage, pos[i])		end
		if luaskin.note.hcnreactive			then table.remove(luaskin.note.hcnreactive, pos[i])		end
		if luaskin.note.mine				then table.remove(luaskin.note.mine, pos[i])			end
		if luaskin.note.size				then table.remove(luaskin.note.size, pos[i])			end
		if luaskin.note.lnbodyActive		then table.remove(luaskin.note.lnbodyActive, pos[i])	end
		if luaskin.note.hcnbodyActive		then table.remove(luaskin.note.hcnbodyActive, pos[i])	end
		if luaskin.note.hcnbodyMiss			then table.remove(luaskin.note.hcnbodyMiss, pos[i])		end
		if luaskin.note.hcnbodyReactive		then table.remove(luaskin.note.hcnbodyReactive, pos[i])	end
		table.remove(luaskin.note.dst, pos[i])
	end
	-- スクラッチが右側にある時ボムとキーのタイマーで動いているものを右にずらす
	-- TODO: timer(image, destination)とref(imageset)を書き換える方が不具合出にくいかも
	-- 白鍵から次の白鍵までの距離分動かす
	for i, v in pairs(luaskin.destination) do
		if mode_hij_simple() then
			for i2, v2 in pairs(bomb_id_2p) do
				if v.id == v2 then
					for i3 = 1, #luaskin.destination[i].dst do
						if luaskin.destination[i].dst[i3].x then
							luaskin.destination[i].dst[i3].x = luaskin.destination[i].dst[i3].x + offset_x
						end
					end
				end
			end
		end
		if v.timer and type(v.timer) == "number" and v.timer >= 61 and v.timer <= 67 then
			for i2 = 1, #luaskin.destination[i].dst do
				if luaskin.destination[i].dst[i2].x then
					luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
				end
			end
		end
		if v.timer and type(v.timer) == "number" and v.timer >= 81 and v.timer <= 87 then
			for i2 = 1, #luaskin.destination[i].dst do
				if luaskin.destination[i].dst[i2].x then
					luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
				end
			end
		end
		if v.timer and type(v.timer) == "number" and v.timer >= 111 and v.timer <= 117 then
			for i2 = 1, #luaskin.destination[i].dst do
				if luaskin.destination[i].dst[i2].x then
					luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
				end
			end
		end
		if v.timer and type(v.timer) == "number" and v.timer >= 131 and v.timer <= 137 then
			for i2 = 1, #luaskin.destination[i].dst do
				if luaskin.destination[i].dst[i2].x then
					luaskin.destination[i].dst[i2].x = luaskin.destination[i].dst[i2].x + offset_x
				end
			end
		end
	end
	for i, v in pairs(luaskin.destination) do
		if v.id == luaskin.note.id then
			cover.pos = i + 1
		end
	end
	--[[
	table.insert(luaskin.destination, cover.pos, {id = -111, loop = 1000, offset = 3, dst = {
		{time = 500, x = cover.x, y = 1080, w = cover.w, h = cover.h, acc = 2, r = 16, g = 16, b = 16, a = 224},
		{time = 1000, y = cover.y}
	}})
	table.insert(luaskin.destination, cover.pos, {id = -111, loop = 1000, offset = 3, dst = {
		{time = 500, x = cover.x2, y = 1080, w = cover.w, h = cover.h, acc = 2, r = 16, g = 16, b = 16, a = 224},
		{time = 1000, y = cover.y}
	}})
	--]]
end

--[[
--	スキンの読み込み
--]]
local function load_mcskin()
	if DEBUG then print(SKIN_MSG .. "load_mcskin") end
	if is_play_5keys()	then return require("play5_hw")		end
	if is_play_7keys()	then return require("play7_hw")		end
	if is_play_10keys()	then return require("play10_hw")	end
	if is_play_14keys()	then return require("play14_hw")	end
end

local function load_gtskin()
	if DEBUG then print(SKIN_MSG .. "load_gnskin") end
	if is_play_5keys() then return require("play")(5)	end
	if is_play_7keys() then return require("play")(7)	end
end

local function load_tmskin(header)
	-- TODO: 同じ鍵盤数のスキンが複数用意されていた時の動作を考える
	if DEBUG then print(SKIN_MSG .. "load_tmskin") end
	if		is_play_7keys() and LANESIZE and LANESIZE == "Wide"	then return require("play7wide")
	elseif	is_play_7keys()										then return require("play7main")
	elseif	is_play_14keys()									then return require("play14main")
	end
end

local function load_rgskin()
	if DEBUG then print(SKIN_MSG .. "load_rgskin") end
	if is_play_7keys() then return require("play7main")	end
end

local function load_ssskin()
	if DEBUG then print(SKIN_MSG .. "load_ssskin") end
	if is_play_7keys() then return require("play_7") end
end

local function load_hsskin()
	if DEBUG then print(SKIN_MSG .. "load_hsskin") end
	if is_play_7keys()	then return require("playmain_7")	end
	if is_play_14keys()	then return require("playmain_14")	end
end

local function load_ntskin()
	if DEBUG then print(SKIN_MSG .. "load_ntskin") end
	if is_play_14keys()	then return require("play_14key") end
end

local function load_dpskin()
	if DEBUG then print(SKIN_MSG .. "load_dpskin") end
	if is_play_9keys()	then return require("lua.play9main") end
end

local function load_spskin()
	if DEBUG then print(SKIN_MSG .. "load_spskin") end
	return require("playmain")
end

local function modified_folder_path(list_path)
	if mode_modernchic()	then for k, v in pairs(list_path) do list_path[k] = "../" .. list_path[k]		end end
	if mode_generictheme()	then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
	if mode_type_m()		then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
	if mode_rogan()			then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
	if mode_socialskin()	then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
	if mode_hij_simple()	then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
	if mode_neotm()			then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
	if mode_dotpop()		then for k, v in pairs(list_path) do list_path[k] = "../" .. list_path[k]		end end
	if mode_simple_play()	then for k, v in pairs(list_path) do list_path[k] = "../../" .. list_path[k]	end end
end

--[[
--	ボムの改変
--	要修正: imageにボムを追加するとdst追加行に関係なく最前面に表示される謎の現象が発生している
--	        とりあえず最後尾に追加して表示条件を設定することで対策中
--]]
local function changed_mcbomb(luaskin, parts)
	local pos, c = false, 0
	if is_play_5keys()	then c = 12 end
	if is_play_7keys()	then c = 16 end
	if is_play_10keys()	then c = 24 end
	if is_play_14keys()	then c = 32 end
	for i, v in pairs(luaskin.destination) do
		if v.id == "bomb-1"		then pos = i	end
		if v.id == "fastbomb-1"	then c = c * 2	end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_gtbomb(luaskin, parts)
	local pos, c = false, 0
	if is_play_5keys() then c = 12 end
	if is_play_7keys() then c = 16 end
	for i, v in pairs(luaskin.destination) do
		if v.id == "bomb_1"		then pos = i	end
		if v.id == "fastbomb_1"	then c = c * 2	end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_tmbomb(luaskin, parts)
	if is_play_7keys()	then c = 16 end
	if is_play_14keys()	then c = 32 end
	local pos = false
	for i, v in pairs(luaskin.destination) do if v.id == 110 then pos = i end end
	if pos then remove_parts(luaskin.destination, pos, c) end
	add_parts(luaskin, parts)
end

local function changed_rgbomb(luaskin, parts)
	local pos, c = false, 16
	for i, v in pairs(luaskin.destination) do
		if v.id == "bomb-1"		then pos = i	end
		if v.id == "fastbomb-1"	then c = c * 2	end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_ssbomb(luaskin, parts)
	do
		local pos, c = false, 0
		for i, v in pairs(luaskin.destination) do
			if string.find(v.id, "bomb") then
				if not pos then pos = i end
				c = c + 1
			end
		end
		if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	end
	do
		local pos, c = false, 0
		for i, v in pairs(luaskin.image) do
			if string.find(v.id, "bomb") then
				if not pos then pos = i end
				c = c + 1
			end
		end
		if pos then for i = 1, c do table.remove(luaskin.image, pos) end end
	end
	add_parts(luaskin, parts)
end

local function changed_hsbomb(luaskin, parts)
	do
		local pos, c = false, 0
		for i, v in pairs(luaskin.destination) do
			if string.find(v.id, "bomb") or string.find(v.id, "hold") then
				if not pos then pos = i end
				c = c + 1
			end
		end
		if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	end
	do
		local pos, c = false, 0
		for i, v in pairs(luaskin.image) do
			if string.find(v.id, "bomb") or string.find(v.id, "hold") then
				if not pos then pos = i end
				c = c + 1
			end
		end
		if pos then for i = 1, c do table.remove(luaskin.image, pos) end end
	end
	add_parts(luaskin, parts)
end

local function changed_ntbomb(luaskin, parts)
	do
		local pos, c = false, 0
		for i, v in pairs(luaskin.destination) do
			if string.find(v.id, "bomb") and not string.find(v.id, "fullcombo") then
				if not pos then pos = i end
				c = c + 1
			end
		end
		if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	end
	do
		local pos, c = false, 0
		for i, v in pairs(luaskin.image) do
			if string.find(v.id, "bomb") and not string.find(v.id, "fullcombo") then
				if not pos then pos = i end
				c = c + 1
			end
		end
		if pos then for i = 1, c do table.remove(luaskin.image, pos) end end
	end
	luaskin.imageset = {}
	add_parts(luaskin, parts)
end

local function changed_spbomb(luaskin, parts)
	add_parts(luaskin, parts)
end

--[[
--	フルコンボエフェクトの改変
--]]
local function changed_mc_fceffect(luaskin, parts)
	local pos, flg, c = false, true, 3
	if is_play_10keys() or is_play_14keys then c = 6 end
	for i, v in pairs(luaskin.destination) do
		if v.id == "fc" and flg then pos, flg = i, false end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_gt_fceffect(luaskin, parts)
	local pos, c = false, 5
	for i, v in pairs(luaskin.destination) do
		if v.id == "fullcombo_glow" then pos = i end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_tm_fceffect(luaskin, parts)
	local pos, c = false, 25
	if is_play_14keys() then c = 50 end
	for i, v in pairs(luaskin.destination) do
		if v.id == "FC-header1" then pos = i break end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_rg_fceffect(luaskin, parts)
	local pos, flg, c = false, true, 4
	for i, v in pairs(luaskin.destination) do
		if v.id == "fc_glow" and flg then pos, flg = i, false end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_ss_fceffect(luaskin, parts)
	local pos, c = false, 0
	for i, v in pairs(luaskin.destination) do
		if v.timer == 48 then
			if not pos then pos = i end
			c = c + 1
		end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_hs_fceffect(luaskin, parts)
	local pos, c = false, 0
	for i, v in pairs(luaskin.destination) do
		if v.timer == 48 then
			if not pos then pos = i end
			c = c + 1
		end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_nt_fceffect(luaskin, parts)
	local pos, c = false, 0
	for i, v in pairs(luaskin.destination) do
		if v.timer == 48 then
			if not pos then pos = i end
			c = c + 1
		end
	end
	if pos then for i = 1, c do table.remove(luaskin.destination, pos) end end
	add_parts(luaskin, parts)
end

local function changed_sp_fceffect(luaskin, parts)
	add_parts(luaskin, parts)
end

--[[
--	フィニッシュカバーを追加する
--]]
local function add_cover_fin(luaskin, lanes)
	table.insert(luaskin.image, {id = "hub-finishcover", src = "hub-src-finishcover", x = 0, y = 0, w = -1, h = -1})
	local id = {}
	local pos = {}
	for i = 1, #luaskin.slider do
		if luaskin.slider[i].type == 4 then
			table.insert(id, luaskin.slider[i].id)
		end
	end
	for i = 1, #id do
		for i2, v in pairs(luaskin.destination) do
			if v.id == id[i] then
				table.insert(pos, i2 + 30) -- TODO: 30はてきとう
			end
		end
	end
	table.sort(pos)
	table.insert(luaskin.destination, pos[#pos], {id = "hub-finishcover", filter = 1, stretch = 3, timer = 143, loop = 3000, dst = {
		{time = 2000, x = lanes.x, y = 1080, w = lanes.w, h = 1080 - lanes.y, acc = 2},
		{time = 3000, y = lanes.y}
	}})
	if lanes.x2 > 0 then
		table.insert(luaskin.destination, pos[#pos], {id = "hub-finishcover", filter = 1, stretch = 3, timer = 143, loop = 3000, dst = {
			{time = 2000, x = lanes.x2, y = 1080, w = lanes.w2, h = 1080 - lanes.y, acc = 2},
			{time = 3000, y = lanes.y}
		}})
	end
end

--[[
--	HIDDENカバーを追加する
--]]
local function add_cover_hid(luaskin, lanes)
	table.insert(luaskin.hiddenCover, {id = "hub-hiddencover", src = "hub-src-finishcover", x = 0, y = 0, w = -1, h = -1, disapearLine = lanes.y})
	local pos = 0
	for i, v in pairs(luaskin.destination) do
		if v.id == luaskin.note.id then
			pos = i + 1
		end
	end
	table.insert(luaskin.destination, pos, {id = "hub-hiddencover", filter = 1, stretch = 3, dst = {
		{x = lanes.x, y = lanes.y - (1080 - lanes.y), w = lanes.w, h = 1080 - lanes.y},
	}})
	if lanes.x2 > 0 then
		table.insert(luaskin.destination, pos, {id = "hub-hiddencover", filter = 1, stretch = 3, dst = {
			{x = lanes.x2, y = lanes.y - (1080 - lanes.y), w = lanes.w2, h = 1080 - lanes.y},
		}})
	end
end

--[[
--	LIFTカバーを追加する
--]]
local function add_cover_lift(luaskin, lanes)
	table.insert(luaskin.liftCover, {id = "hub-liftcover", src = "hub-src-liftcover", x = 0, y = 0, w = -1, h = -1, disapearLine = lanes.y})
	local pos = 0
	for i, v in pairs(luaskin.destination) do
		if v.id == luaskin.note.id then
			pos = i + 1
		end
	end
	table.insert(luaskin.destination, pos, {id = "hub-liftcover", filter = 1, stretch = 3, dst = {
		{x = lanes.x, y = lanes.y - (1080 - lanes.y), w = lanes.w, h = 1080 - lanes.y},
	}})
	if lanes.x2 > 0 then
		table.insert(luaskin.destination, pos, {id = "hub-liftcover", filter = 1, stretch = 3, dst = {
			{x = lanes.x2, y = lanes.y - (1080 - lanes.y), w = lanes.w2, h = 1080 - lanes.y},
		}})
	end
end

--[[
--	カバーの改変
--]]
-- SUD+
local function changed_cover_sud(luaskin, f_path, lanes)
	if DEBUG then print(SKIN_MSG .. "changed_skin_suddencover") end
	table.insert(luaskin.source, {id = "hub-src-suddencover", path = f_path})
	local id = {}
	for i = 1, #luaskin.slider do
		if luaskin.slider[i].type == 4 then
			table.insert(id, luaskin.slider[i].id)
			luaskin.slider[i].src = "hub-src-suddencover"
			luaskin.slider[i].x = 0
			luaskin.slider[i].y = 0
			luaskin.slider[i].w = -1
			luaskin.slider[i].h = -1
		end
	end
	for i = 1, #id do
		local c = 1
		for i2, v in pairs(luaskin.destination) do
			if luaskin.destination[i2].id == id[i] then
				luaskin.destination[i2].stretch = 3
				luaskin.destination[i2].filter = 1
				if mode_hij_simple() then
					if v.id ~= id[1] then
						luaskin.destination[i2].draw = function() return false end
					end
					if c == 1 then
						luaskin.destination[i2].dst[1].x = lanes.x
						luaskin.destination[i2].dst[1].w = lanes.w
						c = c + 1
					else
						luaskin.destination[i2].dst[1].x = lanes.x2
						luaskin.destination[i2].dst[1].w = lanes.w2
					end
				end
			end
		end
	end
end

-- HID+
local function changed_cover_hid(luaskin, f_path, lanes)
	table.insert(luaskin.source, {id = "hub-src-hiddencover", path = f_path})
	if not luaskin.hiddenCover[1] then
		add_cover_hid(luaskin, lanes)
	else
		local flg = true
		local id = {}
		for i = 1, #luaskin.hiddenCover do
			table.insert(id, luaskin.hiddenCover[i].id)
			luaskin.hiddenCover[i].src = "hub-src-hiddencover"
			luaskin.hiddenCover[i].x = 0
			luaskin.hiddenCover[i].y = 0
			luaskin.hiddenCover[i].w = -1
			luaskin.hiddenCover[i].h = -1
			luaskin.hiddenCover[i].disapearLine = lanes.y
		end
		for i = 1, #id do
			local c = 1
			for i2, v in pairs(luaskin.destination) do
				if v.id == id[i] then
					flg = false
					luaskin.destination[i2].stretch = 3
					luaskin.destination[i2].filter = 1
					if mode_hij_simple() then
						if v.id ~= id[1] then
							luaskin.destination[i2].draw = function() return false end
						end
						if c == 1 then
							luaskin.destination[i2].dst[1].x = lanes.x
							luaskin.destination[i2].dst[1].w = lanes.w
							c = c + 1
						else
							luaskin.destination[i2].dst[1].x = lanes.x2
							luaskin.destination[i2].dst[1].w = lanes.w2
						end
					end
				end
			end
		end
		if flg then
			local pos = 0
			for i, v in pairs(luaskin.destination) do
				if v.id == luaskin.note.id then
					pos = i + 1
				end
			end
			table.insert(luaskin.destination, pos, {id = luaskin.hiddenCover[1].id, filter = 1, stretch = 3, dst = {
				{x = lanes.x, y = lanes.y - (1080 - lanes.y), w = lanes.w, h = 1080 - lanes.y},
			}})
			if lanes.x2 > 0 then
				table.insert(luaskin.destination, pos, {id = luaskin.hiddenCover[1].id, filter = 1, stretch = 3, dst = {
					{x = lanes.x2, y = lanes.y - (1080 - lanes.y), w = lanes.w2, h = 1080 - lanes.y},
				}})
			end
		end
	end
end

-- LIFT
local function changed_cover_lift(luaskin, f_path, lanes)
	table.insert(luaskin.source, {id = "hub-src-liftcover", path = f_path})
	if mode_type_m() then -- これだけimageで実装してる
		for i, v in pairs(luaskin.image) do
			if v.id == "liftcover" then
				luaskin.image[i].src = "hub-src-liftcover"
				luaskin.image[i].x = 0
				luaskin.image[i].y = 0
				luaskin.image[i].w = -1
				luaskin.image[i].h = -1
			end
		end
		for i, v in pairs(luaskin.destination) do
			if v.id == "liftcover" then
				luaskin.destination[i].stretch = 3
				luaskin.destination[i].filter = 1
			end
		end
	else
		if not luaskin.liftCover[1] then
			add_cover_lift(luaskin, lanes)
		else
			local id = {}
			for i = 1, #luaskin.liftCover do
				table.insert(id, luaskin.liftCover[i].id)
				luaskin.liftCover[i].src = "hub-src-liftcover"
				luaskin.liftCover[i].x = 0
				luaskin.liftCover[i].y = 0
				luaskin.liftCover[i].w = -1
				luaskin.liftCover[i].h = -1
			end
			for i = 1, #id do
				for i2, v in pairs(luaskin.destination) do
					if v.id == id[i] then
						luaskin.destination[i2].stretch = 3
						luaskin.destination[i2].filter = 1
					end
				end
			end
		end
	end
end

-- FINISH
local function changed_cover_fin(luaskin, f_path, lanes)
	table.insert(luaskin.source, {id = "hub-src-finishcover", path = f_path})
	if mode_modernchic() then
		for i, v in pairs(luaskin.image) do
			if v.id == "laneCoverLeft2"
			or v.id == "laneCoverRight2"
			or v.id == "lane_cover2"
			then
				luaskin.image[i].src = "hub-src-finishcover"
				luaskin.image[i].w = -1
				luaskin.image[i].h = -1
			end
		end
		for i, v in pairs(luaskin.destination) do
			if v.id == "laneCoverLeft2"
			or v.id == "laneCoverRight2"
			or v.id == "lane_cover2"
			then
				luaskin.destination[i].stretch = 3
				luaskin.destination[i].filter = 1
			end
		end
	elseif mode_simple_play() then
		for i, v in pairs(luaskin.image) do
			if v.id == "finishcover1"
			or v.id == "finishcover2"
			then
				luaskin.image[i].src = "hub-src-finishcover"
				luaskin.image[i].w = -1
				luaskin.image[i].h = -1
			end
		end
	else
		add_cover_fin(luaskin, lanes)
	end
	
end
------------------------------------------------------------------------




--********************************************************************--
-- ヘッダの読み込み

local header = {}
package.path = PATH_SKIN
if mode_modernchic()	then header = load_mcskin().header end
if mode_generictheme()	then header = load_gtskin().header end
if mode_type_m()		then header = load_tmskin().header end
if mode_rogan()			then header = load_rgskin().header end
if mode_socialskin()	then header = load_ssskin().header end
if mode_hij_simple()	then header = load_hsskin().header end
if mode_neotm()			then header = load_ntskin().header end
if mode_dotpop()		then header = load_dpskin().header end
if mode_simple_play()	then header = load_spskin().header end
package.path = PATH_HUB
check_header_tbl(header)

local property_op	= create_property_op(header)
local offset_id		= create_offset_id(header)

local hub = {
	flg = {
		MC = file_exists("skin/ModernChic/play7_hw.lua"),
		GT = file_exists("skin/GenericTheme-master/play/play.lua"),
		TM = file_exists("skin/TYPE-M/play/play7main.lua"),
		RG = file_exists("skin/Rogan/play/play7main.lua"),
		SS = file_exists("skin/SocialSkin/lua/play_7.lua"),
		HS = file_exists("skin/hij_simple/play/playmain_7.lua")
	},
	l_path = {
		JUDGE_MC	= "modules.judge.modernchic",
		NOTE_MC		= "modules.notes.modernchic",
		BOMB_MC		= "modules.bomb.modernchic",
		FCE_MC		= "modules.effect.fullcombo.modernchic",
		
		JUDGE_GT	= "modules.judge.generictheme",
		NOTE_GT		= "modules.notes.generictheme",
		BOMB_GT		= "modules.bomb.generictheme",
		FCE_GT		= "modules.effect.fullcombo.generictheme",
		
		JUDGE_TM	= "modules.judge.type_m",
		NOTE_TM		= "modules.notes.type_m",
		BOMB_TM		= "modules.bomb.type_m",
		FCE_TM		= "modules.effect.fullcombo.type_m",
		
		JUDGE_RG	= "modules.judge.rogan",
		NOTE_RG		= "modules.notes.rogan",
		BOMB_RG		= "modules.bomb.rogan",
		
		JUDGE_SS	= "modules.judge.socialskin",
		BOMB_SS		= "modules.bomb.socialskin",
		NOTE_SS		= "modules.notes.socialskin",
		
		JUDGE_HS	= "modules.judge.hij",
		
		JUDGE_DXP43		= "modules.judge.oadx+43",
		JUDGE_DXP169	= "modules.judge.oadx+169",
		NOTE_DXPAC		= "modules.notes.oadx+ac",
		NOTE_DXPACW		= "modules.notes.oadx+acw",
		NOTE_DXPCS		= "modules.notes.oadx+cs",
		NOTE_DXPCSW		= "modules.notes.oadx+csw",
		BOMB_DXP43		= "modules.bomb.oadx+43",
		BOMB_DXP169		= "modules.bomb.oadx+169",
		FCE_DXPN		= "modules.effect.fullcombo.oadx+normal",
		
		JUDGE_WM	= "modules.judge.wmix",
		JUDGE_WMAC	= "modules.judge.wmixac",
		NOTE_WM		= "modules.notes.wmix",
		NOTE_WMAC	= "modules.notes.wmixac",
		BOMB_WM		= "modules.bomb.wmix",
		FCE_WM		= "modules.effect.fullcombo.wmix"
	},
	f_path = {
		JUDGE_MC	= "ModernChic/Play/parts/common/judge/*.png|82|",
		NOTE_MC		= "ModernChic/Play/parts/common/notes/*.png|82|",
		MINE_MC		= "ModernChic/Play/parts/common/mine/*.png|82|",
		BOMB_MC		= "ModernChic/Play/parts/common/bomb/*.png|82|",
		FCE_MC		= "ModernChic/Play/parts/common/fullcombo/*.png|82|",
		SYS_SP_MC	= "ModernChic/Play/parts/sp_hw/system.png",
		SYS_DP_MC	= "ModernChic/Play/parts/dp_hw/system.png",
		
		JUDGE_GT	= "GenericTheme-master/play/customize/judge/*.png|82|",
		NOTE_GT		= "GenericTheme-master/play/customize/notes/*.png|82|",
		MINE_GT		= "GenericTheme-master/play/customize/mine/*.png|82|",
		BOMB_GT		= "GenericTheme-master/play/customize/bomb/*.png|82|",
		FCE1_GT		= "GenericTheme-master/play/parts/fullcombo/glow.png",
		FCE2_GT		= "GenericTheme-master/play/parts/fullcombo/ring.png",
		FCE3_GT		= "GenericTheme-master/play/parts/fullcombo/circle.png",
		FCE4_GT		= "GenericTheme-master/play/parts/fullcombo/text.png",
		
		JUDGE_TM	= "TYPE-M/play/judge/*.png|82|",
		NOTE_TM		= "TYPE-M/play/notes/*.png|82|",
		BOMB_TM		= "TYPE-M/play/bomb/*.png|82|",
		FCE_TM		= "TYPE-M/play/fullcombo/*.png|82|",
		
		JUDGE_RG	= "Rogan/play/parts/judge/*.png|82|",
		NOTE_RG		= "Rogan/play/parts/notes/*.png|82|",
		BOMB_RG		= "Rogan/play/parts/bomb/*.png|82|",
		
		PARTS_SS	= "SocialSkin/play/parts/parts.png|82|",
		JUDGE_SS	= "SocialSkin/play/parts/judges/*.png|82|",
		COMBO_SS	= "SocialSkin/play/parts/combo/default.png",
		NOTE_SS		= "SocialSkin/play/parts/lane/notes/normal/*.png|82|",
		WAVE1_SS	= "SocialSkin/play/parts/bombs/wave1/*.png|82|",
		PTCL1_SS	= "SocialSkin/play/parts/bombs/particle1/*.png|82|",
		ANIM1_SS	= "SocialSkin/play/parts/bombs/animation1/*.png|82|",
		WAVE2_SS	= "SocialSkin/play/parts/bombs/wave2/*.png|82|",
		PTCL2_SS	= "SocialSkin/play/parts/bombs/particle2/*.png|82|",
		ANIM2_SS	= "SocialSkin/play/parts/bombs/animation2/*.png|82|",
		
		JUDGE_HS	= "hij_simple/play/judge/*.png|82|",
		
		JUDGE_DXP	= "Hub/parts/OA_DX+/judge/*.png|82|",
		NOTE_DXP	= "Hub/parts/OA_DX+/notes/*.png|821|",
		HCN_DXP		= "Hub/parts/OA_DX+/notes/*.png|822|",
		BOMB_DXP	= "Hub/parts/OA_DX+/bomb/*.png|82|",
		FCE_DXP		= "Hub/parts/OA_DX+/fullcombo/*.png|82|",
		
		JUDGE_WM	= "Hub/parts/WMIX_HD/judge/*.png|82|",
		JUDGE_WMAC	= "Hub/parts/WMIX_HD/judge/ac/*.png|82|",
		NOTE_WM		= "Hub/parts/WMIX_HD/note/*.png|821|",
		HCN_WM		= "Hub/parts/WMIX_HD/note/*.png|822|",
		NOTE_WMAC	= "Hub/parts/WMIX_HD/note/ac/*.png|821|",
		HCN_WMAC	= "Hub/parts/WMIX_HD/note/ac/*.png|822|",
		BOMB_WM		= "Hub/parts/WMIX_HD/bomb/*.png|82|",
		FCE_WM		= "Hub/parts/WMIX_HD/fc/*.png|82|",
		
		COVER_SUD	= "Hub/parts/Hub/cover/*.png|1|",
		COVER_HID	= "Hub/parts/Hub/cover/*.png|2|",
		COVER_LIFT	= "Hub/parts/Hub/cover/*.png|3|",
		COVER_FIN	= "Hub/parts/Hub/cover/*.png|4|",
		
		EX1			= "Hub/extension/*|1|",
		EX2			= "Hub/extension/*|2|",
		EX3			= "Hub/extension/*|3|",
		EX4			= "Hub/extension/*|4|",
		EX5			= "Hub/extension/*|5|",
		EX6			= "Hub/extension/*|6|",
		EX7			= "Hub/extension/*|7|",
		EX8			= "Hub/extension/*|8|",
		EX9			= "Hub/extension/*|9|",
		EX10		= "Hub/extension/*|10|"
	},
	name = {
		P_SELECT_JUDGE	= "判定文字の置換(Hub)",
		P_SELECT_NOTE	= "ノーツの置換(Hub)",
		P_SELECT_BOMB	= "ボムの置換(Hub)",
		P_SELECT_FCE	= "フルコンボエフェクトの置換(Hub)",
		P_SELECT_SUD	= "SUDDENカバーの置換(Hub)",
		P_SELECT_HID	= "HIDDENカバーの置換(Hub)",
		P_SELECT_LIFT	= "LIFTカバーの置換(Hub)",
		P_SELECT_FIN	= "FINISHカバーの置換(Hub)",
		
		P_STD_MC		= "ModernChic規格",
		P_STD_GT		= "GenericTheme規格",
		P_STD_TM		= "TYPE-M規格",
		P_STD_RG		= "Rogan規格",
		P_STD_SS		= "SocialSkin規格",
		P_STD_HS		= "hij_simple規格",
		P_STD_DXP		= "OADX+規格",
		P_STD_DXP43		= "OADX+規格(4:3)",
		P_STD_DXP169	= "OADX+規格(16:9)",
		P_STD_DXPN		= "OADX+規格(NORMAL)",
		P_STD_DXPAC		= "OADX+規格(AC)",
		P_STD_DXPACW	= "OADX+規格(ACWide)",
		P_STD_DXPCS		= "OADX+規格(CS)",
		P_STD_DXPCSW	= "OADX+規格(CSWide)",
		P_STD_WM		= "W-mix規格",
		P_STD_WMW		= "W-mix規格(Wide)",
		P_STD_WMAC		= "W-mix規格(AC)",
		
		F_JUDGE_MC		= "ModernChic判定文字(Hub)",
		F_NOTE_MC		= "ModernChicノーツ(Hub)",
		F_MINE_MC		= "ModernChicマイン(Hub)",
		F_BOMB_MC		= "ModernChicボム(Hub)",
		F_FCE_MC		= "ModernChicフルコンボエフェクト(Hub)",
		
		F_JUDGE_GT		= "GenericTheme判定文字(Hub)",
		F_NOTE_GT		= "GenericThemeノーツ(Hub)",
		F_MINE_GT		= "GenericThemeマイン(Hub)",
		F_BOMB_GT		= "GenericThemeボム(Hub)",
		F_FCE_GT		= "GenericThemeフルコンボエフェクト(Hub)",
		
		F_JUDGE_TM		= "TYPE-M判定文字(Hub)",
		F_NOTE_TM		= "TYPE-Mノーツ(Hub)",
		F_BOMB_TM		= "TYPE-Mボム(Hub)",
		F_FCE_TM		= "TYPE-Mフルコンボエフェクト(Hub)",
		
		F_JUDGE_RG		= "Rogan判定文字(Hub)",
		F_NOTE_RG		= "Roganノーツ(Hub)",
		F_BOMB_RG		= "Roganボム(Hub)",
		F_FCE_RG		= "Roganフルコンボエフェクト(Hub)",
		
		F_JUDGE_SS		= "SocialSkin判定文字(Hub)",
		F_NOTE_SS		= "SocialSkinノーツ normal(Hub)",
		F_WAVE1_SS		= "SocialSkinボム wave1(Hub)",
		F_PTCL1_SS		= "SocialSkinボム particle1(Hub)",
		F_ANIM1_SS		= "SocialSkinボム animation1(Hub)",
		F_WAVE2_SS		= "SocialSkinボム wave2(Hub)",
		F_PTCL2_SS		= "SocialSkinボム particle2(Hub)",
		F_ANIM2_SS		= "SocialSkinボム animation2(Hub)",
		F_FCE_SS		= "SocialSkinフルコンボエフェクト(Hub)",
		
		F_JUDGE_HS		= "hij_simple判定文字(Hub)",
		
		F_SUD_HUB		= "SUDDENカバー(Hub)",
		F_HID_HUB		= "HIDDENカバー(Hub)",
		F_LIFT_HUB		= "LIFTカバー(Hub)",
		F_FIN_HUB		= "FINISHカバー(Hub)",
		
		F_JUDGE_DXP		= "OADX+判定文字(Hub)",
		F_NOTE_DXP		= "OADX+ノーツ(Hub)",
		F_HCN_DXP		= "OADX+ヘルチャージノーツ(Hub)",
		F_BOMB_DXP		= "OADX+ボム(Hub)",
		F_FCE_DXP		= "OADX+フルコンボエフェクト(Hub)",
		
		F_JUDGE_WM		= "W-mix判定文字 Wide(Hub)",
		F_JUDGE_WMAC	= "W-mix判定文字 AC(Hub)",
		F_NOTE_WM		= "W-mixノーツ Wide(Hub)",
		F_HCN_WM		= "W-mixヘルチャージノーツ Wide(Hub)",
		F_NOTE_WMAC		= "W-mixノーツ AC(Hub)",
		F_HCN_WMAC		= "W-mixヘルチャージノーツ AC(Hub)",
		F_BOMB_WM		= "W-mixボム(Hub)",
		F_FCE_WM		= "W-mixフルコンボエフェクト(Hub)",
		
		O_BOMB_MC		= "ModernChicボム表示倍率(Hub)(%)",
		O_BOMB_GT		= "GenericThemeボム表示倍率(Hub)(%)",
		O_BOMB_TM		= "TYPE-Mボム表示倍率(Hub)(%)",
		O_BOMB_RG		= "Roganボム表示倍率(Hub)(%)",
		O_BOMB_SS		= "SocialSkinボム表示倍率(Hub)(%)",
		O_BOMB_DXP		= "OADX+ボム表示倍率(Hub)(%)",
		O_BOMB_WM		= "W-mixボム表示倍率(Hub)(%)",
		
		O_JUDGE_MC		= "ModernChic判定文字表示倍率(Hub)(%)",
		O_JUDGE_GT		= "GenericTheme判定文字表示倍率(Hub)(%)",
		O_JUDGE_TM		= "TYPE-M判定文字表示倍率(Hub)(%)",
		O_JUDGE_RG		= "Rogan判定文字表示倍率(Hub)(%)",
		O_JUDGE_SS		= "SocialSkin判定文字表示倍率(Hub)(%)",
		O_JUDGE_HS		= "hij_simple判定文字表示倍率(Hub)(%)",
		O_JUDGE_DXP		= "OADX+判定文字表示倍率(Hub)(%)",
		O_JUDGE_WM		= "W-mix判定文字表示倍率(Hub)(%)"
	},
	op = {
		JUDGE_DEF	= property_op.get(),
		NOTE_DEF	= property_op.get(),
		BOMB_DEF	= property_op.get(),
		FCE_DEF		= property_op.get(),
		SUD_DEF		= property_op.get(),
		HID_DEF		= property_op.get(),
		LIFT_DEF	= property_op.get(),
		FIN_DEF		= property_op.get(),
		
		SUD_HUB		= property_op.get(),
		HID_HUB		= property_op.get(),
		LIFT_HUB	= property_op.get(),
		FIN_HUB		= property_op.get(),
		
		JUDGE_MC	= property_op.get(),
		NOTE_MC		= property_op.get(),
		BOMB_MC		= property_op.get(),
		FCE_MC		= property_op.get(),
		
		JUDGE_GT	= property_op.get(),
		NOTE_GT		= property_op.get(),
		BOMB_GT		= property_op.get(),
		FCE_GT		= property_op.get(),
		
		JUDGE_TM	= property_op.get(),
		NOTE_TM		= property_op.get(),
		BOMB_TM		= property_op.get(),
		FCE_TM		= property_op.get(),
		
		JUDGE_RG	= property_op.get(),
		NOTE_RG		= property_op.get(),
		BOMB_RG		= property_op.get(),
		FCE_RG		= property_op.get(),
		
		JUDGE_SS	= property_op.get(),
		NOTE_SS		= property_op.get(),
		BOMB_SS		= property_op.get(),
		FCE_SS		= property_op.get(),
		
		JUDGE_HS	= property_op.get(),
		NOTE_HS		= property_op.get(),
		BOMB_HS		= property_op.get(),
		FCE_HS		= property_op.get(),
		
		JUDGE_DXP43		= property_op.get(),
		JUDGE_DXP169	= property_op.get(),
		NOTE_DXPAC		= property_op.get(),
		NOTE_DXPACW		= property_op.get(),
		NOTE_DXPCS		= property_op.get(),
		NOTE_DXPCSW		= property_op.get(),
		BOMB_DXP43		= property_op.get(),
		BOMB_DXP169		= property_op.get(),
		FCE_DXPN		= property_op.get(),
		
		JUDGE_WM	= property_op.get(),
		JUDGE_WMAC	= property_op.get(),
		NOTE_WM		= property_op.get(),
		NOTE_WMAC	= property_op.get(),
		BOMB_WM		= property_op.get(),
		FCE_WM		= property_op.get(),
	},
	id = {
		BOMB_MC		= offset_id.get(),
		BOMB_GT		= offset_id.get(),
		BOMB_TM		= offset_id.get(),
		BOMB_RG		= offset_id.get(),
		BOMB_SS		= offset_id.get(),
		BOMB_HS		= offset_id.get(),
		BOMB_DXP	= offset_id.get(),
		BOMB_WM		= offset_id.get(),
		
		JUDGE_MC	= offset_id.get(),
		JUDGE_GT	= offset_id.get(),
		JUDGE_TM	= offset_id.get(),
		JUDGE_RG	= offset_id.get(),
		JUDGE_SS	= offset_id.get(),
		JUDGE_HS	= offset_id.get(),
		JUDGE_DXP	= offset_id.get(),
		JUDGE_WM	= offset_id.get(),
		
		SEPARATE	= offset_id.get()
	},
	-- 各パーツの座標設定用
	offset = {
		judge = {
			mc = {y = 195, h = 84},
			gt = {y = 182, h = 84},
			tm = {y = 157 - 18 - 4, h = 124}, -- -18 FAST/SLOW表記が判定文字に被っているため
			rg = {y = 242, h = 84},
			ss = {y = 265, h = 54}, --ss = {y = 275.5, h = 31}
			hs = {y = 180, h = 72},
			nt = {y = 108, h = 100}
		},
		note = {
			center	= -12,
			under	= 0,
			wmix	= -14 -- TODO: これだけなぜかずれる
		},
		bomb = {
			mc = 6,
			gt = 6,
			tm = 4,
			rg = 6,
			ss = 1.5,
			hs = 4,
			nt = 5
		}
	}
}
modified_folder_path(hub.f_path)

if mode_modernchic()
or mode_generictheme()
then
	for k, v in pairs(hub.offset.note) do
		hub.offset.note[k] = hub.offset.note[k] + 12
	end
end

local f_pathset = {
	mc = {
		note = {
			hub.f_path.NOTE_MC,
			hub.f_path.MINE_MC
		},
		fce = {
			hub.f_path.FCE_MC,
			hub.f_path.SYS_SP_MC,
			hub.f_path.SYS_DP_MC
		}
	},
	gt = {
		note = {
			hub.f_path.NOTE_GT,
			hub.f_path.MINE_GT
		},
		fce = {
			hub.f_path.FCE1_GT,
			hub.f_path.FCE2_GT,
			hub.f_path.FCE3_GT,
			hub.f_path.FCE4_GT
		}
	},
	ss = {
		bomb = {
			hub.f_path.WAVE1_SS,
			hub.f_path.PTCL1_SS,
			hub.f_path.ANIM1_SS,
			hub.f_path.WAVE2_SS,
			hub.f_path.PTCL2_SS,
			hub.f_path.ANIM2_SS
		},
		judge = {
			hub.f_path.PARTS_SS,
			hub.f_path.JUDGE_SS,
			hub.f_path.COMBO_SS
		}
	},
	dxp = {
		note = {
			hub.f_path.NOTE_DXP,
			hub.f_path.HCN_DXP
		}
	},
	wm = {
		note = {
			hub.f_path.NOTE_WM,
			hub.f_path.HCN_WM
		}
	},
	wmac = {
		note = {
			hub.f_path.NOTE_WMAC,
			hub.f_path.HCN_WMAC
		}
	},
}

hub.header = {
	property = {
		{name = hub.name.P_SELECT_JUDGE,	item = {{name = "OFF", op = hub.op.JUDGE_DEF}},	def = "OFF"},
		{name = hub.name.P_SELECT_NOTE,		item = {{name = "OFF", op = hub.op.NOTE_DEF}},	def = "OFF"},
		{name = hub.name.P_SELECT_BOMB,		item = {{name = "OFF", op = hub.op.BOMB_DEF}},	def = "OFF"},
		{name = hub.name.P_SELECT_FCE,		item = {{name = "OFF", op = hub.op.FCE_DEF}},	def = "OFF"},
		{name = hub.name.P_SELECT_SUD, item = {
			{name = "OFF",	op = hub.op.SUD_DEF},
			{name = "ON",	op = hub.op.SUD_HUB}
		}, def = "OFF"},
		{name = hub.name.P_SELECT_HID, item = {
			{name = "OFF",	op = hub.op.HID_DEF},
			{name = "ON",	op = hub.op.HID_HUB}
		}, def = "OFF"},
		{name = hub.name.P_SELECT_LIFT, item = {
			{name = "OFF",	op = hub.op.LIFT_DEF},
			{name = "ON",	op = hub.op.LIFT_HUB}
		}, def = "OFF"},
		{name = hub.name.P_SELECT_FIN, item = {
			{name = "OFF",	op = hub.op.FIN_DEF},
			{name = "ON",	op = hub.op.FIN_HUB}
		}, def = "OFF"}
	},
	filepath = {
		{name = hub.name.F_SUD_HUB,		path = hub.f_path.COVER_SUD},
		{name = hub.name.F_HID_HUB,		path = hub.f_path.COVER_HID},
		{name = hub.name.F_LIFT_HUB,	path = hub.f_path.COVER_LIFT},
		{name = hub.name.F_FIN_HUB,		path = hub.f_path.COVER_FIN},
		{name = "スロット1(Hub)",		path = hub.f_path.EX1,	def = "off"},
		{name = "スロット2(Hub)",		path = hub.f_path.EX2,	def = "off"},
		{name = "スロット3(Hub)",		path = hub.f_path.EX3,	def = "off"},
		{name = "スロット4(Hub)",		path = hub.f_path.EX4,	def = "off"},
		{name = "スロット5(Hub)",		path = hub.f_path.EX5,	def = "off"},
		{name = "スロット6(Hub)",		path = hub.f_path.EX6,	def = "off"},
		{name = "スロット7(Hub)",		path = hub.f_path.EX7,	def = "off"},
		{name = "スロット8(Hub)",		path = hub.f_path.EX8,	def = "off"},
		{name = "スロット9(Hub)",		path = hub.f_path.EX9,	def = "off"},
		{name = "スロット10(Hub)",		path = hub.f_path.EX10,	def = "off"}
	},
	offset = {
		{key = "settings_extension",	name = "-- 拡張機能 --",	id = hub.id.SEPARATE},
		{key = "settings_hub",			name = "-- Hub設定 --",		id = hub.id.SEPARATE}
	},
	category = {{name = "Hub", item = {
		hub.name.P_SELECT_JUDGE,
		hub.name.P_SELECT_NOTE,
		hub.name.P_SELECT_BOMB,
		hub.name.P_SELECT_FCE,
		hub.name.P_SELECT_SUD,
		hub.name.P_SELECT_HID,
		hub.name.P_SELECT_LIFT,
		hub.name.P_SELECT_FIN
	}}}
}

-- hub.headerにModernChicパーツ情報を追加
local function add_header_modernchic()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_MC, op = hub.op.NOTE_MC})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_MC, op = hub.op.BOMB_MC})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_MC, op = hub.op.JUDGE_MC})
	add_property_item(hub.header, hub.name.P_SELECT_FCE,	{name = hub.name.P_STD_MC, op = hub.op.FCE_MC})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_MC,	path = hub.f_path.JUDGE_MC})
	add_filepath(hub.header, {name = hub.name.F_NOTE_MC,	path = hub.f_path.NOTE_MC})
	add_filepath(hub.header, {name = hub.name.F_MINE_MC,	path = hub.f_path.MINE_MC})
	add_filepath(hub.header, {name = hub.name.F_BOMB_MC,	path = hub.f_path.BOMB_MC})
	add_filepath(hub.header, {name = hub.name.F_FCE_MC,		path = hub.f_path.FCE_MC})
	add_offset(hub.header, {key = "settings_modernchic",		name = "-- ModernChic設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_bomb_modernchic",		name = hub.name.O_BOMB_MC,		id = hub.id.BOMB_MC, x = true})
	add_offset(hub.header, {key = "offset_judge_modernchic",	name = hub.name.O_JUDGE_MC,		id = hub.id.JUDGE_MC, x = true})
	add_category_item(hub.header, "Hub", "-- ModernChic設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_MC)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_MC)
	add_category_item(hub.header, "Hub", hub.name.F_MINE_MC)
	add_category_item(hub.header, "Hub", hub.name.F_BOMB_MC)
	add_category_item(hub.header, "Hub", hub.name.F_FCE_MC)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_MC)
	add_category_item(hub.header, "Hub", hub.name.O_BOMB_MC)
end

-- hub.headerにGenericThemeパーツ情報を追加
local function add_header_generictheme()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_GT, op = hub.op.NOTE_GT})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_GT, op = hub.op.BOMB_GT})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_GT, op = hub.op.JUDGE_GT})
	add_property_item(hub.header, hub.name.P_SELECT_FCE,	{name = hub.name.P_STD_GT, op = hub.op.FCE_GT})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_GT,	path = hub.f_path.JUDGE_GT,	def = "gridgazer"})
	add_filepath(hub.header, {name = hub.name.F_NOTE_GT,	path = hub.f_path.NOTE_GT,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_MINE_GT,	path = hub.f_path.MINE_GT,	def = "red"})
	add_filepath(hub.header, {name = hub.name.F_BOMB_GT,	path = hub.f_path.BOMB_GT,	def = "explosion"})
	add_offset(hub.header, {key = "settings_generictheme",		name = "-- GenericTheme設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_bomb_generictheme",	name = hub.name.O_BOMB_GT,			id = hub.id.BOMB_GT,  x = true})
	add_offset(hub.header, {key = "offset_judge_generictheme",	name = hub.name.O_JUDGE_GT,			id = hub.id.JUDGE_GT, x = true})
	add_category_item(hub.header, "Hub", "-- GenericTheme設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_GT)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_GT)
	add_category_item(hub.header, "Hub", hub.name.F_MINE_GT)
	add_category_item(hub.header, "Hub", hub.name.F_BOMB_GT)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_GT)
	add_category_item(hub.header, "Hub", hub.name.O_BOMB_GT)
end

-- hub.headerにTYPE-Mパーツ情報を追加
local function add_header_type_m()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_TM, op = hub.op.NOTE_TM})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_TM, op = hub.op.BOMB_TM})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_TM, op = hub.op.JUDGE_TM})
	add_property_item(hub.header, hub.name.P_SELECT_FCE,	{name = hub.name.P_STD_TM, op = hub.op.FCE_TM})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_TM,	path = hub.f_path.JUDGE_TM,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_NOTE_TM,	path = hub.f_path.NOTE_TM,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_BOMB_TM,	path = hub.f_path.BOMB_TM,	def = "Type_M"})
	add_filepath(hub.header, {name = hub.name.F_FCE_TM,		path = hub.f_path.FCE_TM,	def = "#Default"})
	add_offset(hub.header, {key = "settings_type_m",		name = "-- TYPE-M設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_bomb_type_m",		name = hub.name.O_BOMB_TM,		id = hub.id.BOMB_TM,  x = true})
	add_offset(hub.header, {key = "offset_judge_type_m",	name = hub.name.O_JUDGE_TM,		id = hub.id.JUDGE_TM, x = true})
	add_category_item(hub.header, "Hub", "-- TYPE-M設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_TM)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_TM)
	add_category_item(hub.header, "Hub", hub.name.F_BOMB_TM)
	add_category_item(hub.header, "Hub", hub.name.F_FCE_TM)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_TM)
	add_category_item(hub.header, "Hub", hub.name.O_BOMB_TM)
end

-- hub.headerにRoganパーツ情報を追加
local function add_header_rogan()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_RG, op = hub.op.NOTE_RG})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_RG, op = hub.op.BOMB_RG})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_RG, op = hub.op.JUDGE_RG})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_RG,	path = hub.f_path.JUDGE_RG,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_NOTE_RG,	path = hub.f_path.NOTE_RG,	def = "simple"})
	add_filepath(hub.header, {name = hub.name.F_BOMB_RG,	path = hub.f_path.BOMB_RG,	def = "default"})
	add_offset(hub.header, {key = "settings_rogan",		name = "-- Rogan設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_bomb_rogan",	name = hub.name.O_BOMB_RG,	id = hub.id.BOMB_RG,  x = true})
	add_offset(hub.header, {key = "offset_judge_rogan",	name = hub.name.O_JUDGE_RG,	id = hub.id.JUDGE_RG, x = true})
	add_category_item(hub.header, "Hub", "-- Rogan設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_RG)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_RG)
	add_category_item(hub.header, "Hub", hub.name.F_BOMB_RG)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_RG)
	add_category_item(hub.header, "Hub", hub.name.O_BOMB_RG)
end

-- hub.headerにSocialSkinパーツ情報を追加
local function add_header_socialskin()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_SS, op = hub.op.NOTE_SS})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_SS, op = hub.op.BOMB_SS})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_SS, op = hub.op.JUDGE_SS})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_SS,	path = hub.f_path.JUDGE_SS,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_NOTE_SS,	path = hub.f_path.NOTE_SS,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_ANIM1_SS,	path = hub.f_path.ANIM1_SS,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_WAVE1_SS,	path = hub.f_path.WAVE1_SS,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_PTCL1_SS,	path = hub.f_path.PTCL1_SS,	def = "default"})
	add_filepath(hub.header, {name = hub.name.F_ANIM2_SS,	path = hub.f_path.ANIM2_SS,	def = "blank"})
	add_filepath(hub.header, {name = hub.name.F_WAVE2_SS,	path = hub.f_path.WAVE2_SS,	def = "blank"})
	add_filepath(hub.header, {name = hub.name.F_PTCL2_SS,	path = hub.f_path.PTCL2_SS,	def = "default"})
	add_offset(hub.header, {key = "settings_socialskin",		name = "-- SocialSkin設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_bomb_socialskin",		name = hub.name.O_BOMB_SS,	id = hub.id.BOMB_SS,  x = true})
	add_offset(hub.header, {key = "offset_judge_socialskin",	name = hub.name.O_JUDGE_SS,	id = hub.id.JUDGE_SS, x = true})
	add_category_item(hub.header, "Hub", "-- SocialSkin設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_SS)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_SS)
	add_category_item(hub.header, "Hub", hub.name.F_ANIM1_SS)
	add_category_item(hub.header, "Hub", hub.name.F_WAVE1_SS)
	add_category_item(hub.header, "Hub", hub.name.F_PTCL1_SS)
	add_category_item(hub.header, "Hub", hub.name.F_ANIM2_SS)
	add_category_item(hub.header, "Hub", hub.name.F_WAVE2_SS)
	add_category_item(hub.header, "Hub", hub.name.F_PTCL2_SS)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_SS)
	add_category_item(hub.header, "Hub", hub.name.O_BOMB_SS)
end

-- hub.headerにhij_simpleパーツ情報を追加
local function add_header_hij_simple()
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_HS, op = hub.op.JUDGE_HS})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_HS,	path = hub.f_path.JUDGE_HS,	def = "default"})
	add_offset(hub.header, {key = "settings_hij_simple",		name = "-- hij_simple設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_judge_hij_simple",	name = hub.name.O_JUDGE_HS,	id = hub.id.JUDGE_HS, x = true})
	add_category_item(hub.header, "Hub", "-- hij_simple設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_HS)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_HS)
end

-- hub.headerにOADX+パーツ情報を追加
local function add_header_oadxp()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_DXPAC,	op = hub.op.NOTE_DXPAC})
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_DXPACW,	op = hub.op.NOTE_DXPACW})
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_DXPCS,	op = hub.op.NOTE_DXPCS})
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_DXPCSW,	op = hub.op.NOTE_DXPCSW})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_DXP43,	op = hub.op.BOMB_DXP43})
	add_property_item(hub.header, hub.name.P_SELECT_BOMB,	{name = hub.name.P_STD_DXP169,	op = hub.op.BOMB_DXP169})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_DXP43,	op = hub.op.JUDGE_DXP43})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_DXP169,	op = hub.op.JUDGE_DXP169})
	add_property_item(hub.header, hub.name.P_SELECT_FCE,	{name = hub.name.P_STD_DXPN, 	op = hub.op.FCE_DXPN})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_DXP,	path = hub.f_path.JUDGE_DXP})
	add_filepath(hub.header, {name = hub.name.F_NOTE_DXP,	path = hub.f_path.NOTE_DXP})
	add_filepath(hub.header, {name = hub.name.F_HCN_DXP,	path = hub.f_path.HCN_DXP})
	add_filepath(hub.header, {name = hub.name.F_BOMB_DXP,	path = hub.f_path.BOMB_DXP})
	add_filepath(hub.header, {name = hub.name.F_FCE_DXP,	path = hub.f_path.FCE_DXP})
	add_offset(hub.header, {key = "settings_oadx+",		name = "-- OADX+設定 --",		id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_bomb_oadx+",	name = hub.name.O_BOMB_DXP,		id = hub.id.BOMB_DXP, x = true})
	add_offset(hub.header, {key = "offset_judge_oadx+",	name = hub.name.O_JUDGE_DXP,	id = hub.id.JUDGE_DXP, x = true})
	add_category_item(hub.header, "Hub", "-- OADX+設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_DXP)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_DXP)
	add_category_item(hub.header, "Hub", hub.name.F_HCN_DXP)
	add_category_item(hub.header, "Hub", hub.name.F_BOMB_DXP)
	add_category_item(hub.header, "Hub", hub.name.F_FCE_DXP)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_DXP)
	add_category_item(hub.header, "Hub", hub.name.O_BOMB_DXP)
end

-- hub.headerにW-mixパーツ情報を追加
local function add_header_wmix()
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_WMW, op = hub.op.NOTE_WM})
	add_property_item(hub.header, hub.name.P_SELECT_NOTE,	{name = hub.name.P_STD_WMAC, op = hub.op.NOTE_WMAC})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_WMW, op = hub.op.JUDGE_WM})
	add_property_item(hub.header, hub.name.P_SELECT_JUDGE,	{name = hub.name.P_STD_WMAC, op = hub.op.JUDGE_WMAC})
	add_property_item(hub.header, hub.name.P_SELECT_FCE,	{name = hub.name.P_STD_WM, op = hub.op.FCE_WM})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_WM,	path = hub.f_path.JUDGE_WM})
	add_filepath(hub.header, {name = hub.name.F_JUDGE_WMAC,	path = hub.f_path.JUDGE_WMAC})
	add_filepath(hub.header, {name = hub.name.F_NOTE_WM,	path = hub.f_path.NOTE_WM})
	add_filepath(hub.header, {name = hub.name.F_HCN_WM,		path = hub.f_path.HCN_WM})
	add_filepath(hub.header, {name = hub.name.F_NOTE_WMAC,	path = hub.f_path.NOTE_WMAC})
	add_filepath(hub.header, {name = hub.name.F_HCN_WMAC,	path = hub.f_path.HCN_WMAC})
	add_filepath(hub.header, {name = hub.name.F_FCE_WM,		path = hub.f_path.FCE_WM})
	add_offset(hub.header, {key = "settings_W-mix",		name = "-- W-mix設定 --",	id = hub.id.SEPARATE})
	add_offset(hub.header, {key = "offset_judge_W-mix",	name = hub.name.O_JUDGE_WM,	id = hub.id.JUDGE_WM, x = true})
	add_category_item(hub.header, "Hub", "-- W-mix設定 --")
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_WM)
	add_category_item(hub.header, "Hub", hub.name.F_JUDGE_WMAC)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_WM)
	add_category_item(hub.header, "Hub", hub.name.F_HCN_WM)
	add_category_item(hub.header, "Hub", hub.name.F_NOTE_WMAC)
	add_category_item(hub.header, "Hub", hub.name.F_HCN_WMAC)
	add_category_item(hub.header, "Hub", hub.name.F_FCE_WM)
	add_category_item(hub.header, "Hub", hub.name.O_JUDGE_WM)
end

-- スキン設定画面の構成
if MODE <= 7 or MODE == 9 then -- TODO:
	if hub.flg.MC and not mode_modernchic()		then add_header_modernchic()	end
	if hub.flg.GT and not mode_generictheme()	then add_header_generictheme()	end
	if hub.flg.TM and not mode_type_m()			then add_header_type_m()		end
	if hub.flg.RG and not mode_rogan()			then add_header_rogan()			end
	if hub.flg.SS and not mode_socialskin()		then add_header_socialskin()	end
	if hub.flg.HS and not mode_hij_simple()		then add_header_hij_simple()	end
	add_header_oadxp()
	add_header_wmix()
end
add_category_item(hub.header, "Hub", "-- Hub設定 --")
add_category_item(hub.header, "Hub", hub.name.F_SUD_HUB)
add_category_item(hub.header, "Hub", hub.name.F_HID_HUB)
add_category_item(hub.header, "Hub", hub.name.F_LIFT_HUB)
add_category_item(hub.header, "Hub", hub.name.F_FIN_HUB)
add_category_item(hub.header, "Hub", "-- 拡張機能 --")
add_category_item(hub.header, "Hub", "スロット1(Hub)")
add_category_item(hub.header, "Hub", "スロット2(Hub)")
add_category_item(hub.header, "Hub", "スロット3(Hub)")
add_category_item(hub.header, "Hub", "スロット4(Hub)")
add_category_item(hub.header, "Hub", "スロット5(Hub)")
add_category_item(hub.header, "Hub", "スロット6(Hub)")
add_category_item(hub.header, "Hub", "スロット7(Hub)")
add_category_item(hub.header, "Hub", "スロット8(Hub)")
add_category_item(hub.header, "Hub", "スロット9(Hub)")
add_category_item(hub.header, "Hub", "スロット10(Hub)")

-- ヘッダに情報を挿入
if convert_7to5() then
	header.type = const.SKINTYPE.PLAY_5KEYS
	set_skin_name(header, " (Hub 7to5)")
elseif convert_14to10() then
	header.type = const.SKINTYPE.PLAY_10KEYS
	set_skin_name(header, " (Hub 14to10)")
else
	set_skin_name(header, " (Hub)")
end
set_category(hub.header)
add_header(header, hub.header)

-- TODO: 仮置き中 他スキンも保存出来るようにしたい
-- simple-play時 スキン構成を読み込む
if mode_simple_play() then
	local function get_skin_category(skintype)
		if		skintype == 0 then return "7keys"
		elseif	skintype == 1 then return "5keys"
		elseif	skintype == 2 then return "14keys"
		elseif	skintype == 3 then return "10keys"
		elseif	skintype == 4 then return "9keys"
		end
		return "error"
	end
	local folder_name = string.sub(tostring(PATH_SKIN), 12, string.len(tostring(PATH_SKIN)) - 13)
	-- スキン構成を読み込む
	local status, parts = pcall(function() return dofile("skin/".. folder_name .. "/system/config/hub" .. get_skin_category(SKINTYPE) .. ".lua") end)
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
	end
end

-- スキン側でのオプション確認用
function is_hub_changed_note()	return not option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_DEF)	end
function is_hub_changed_bomb()	return not option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_DEF)	end
function is_hub_changed_judge()	return not option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_DEF)	end
function is_hub_changed_fce()	return not option(hub.name.P_SELECT_FCE,	hub.op.FCE_DEF)		end
function is_hub_changed_sud()	return not option(hub.name.P_SELECT_SUD,	hub.op.SUD_DEF)		end
function is_hub_changed_hid()	return not option(hub.name.P_SELECT_HID,	hub.op.HID_DEF)		end
function is_hub_changed_lift()	return not option(hub.name.P_SELECT_LIFT,	hub.op.LIFT_DEF)	end
function is_hub_changed_fin()	return not option(hub.name.P_SELECT_FIN,	hub.op.FIN_DEF)		end

local function main()

	-- スキン本体の読み込み
	local skin = {}
	package.path = PATH_SKIN
	if		mode_modernchic()	then skin = load_mcskin().main()
	elseif	mode_generictheme()	then skin = load_gtskin().skin
	elseif	mode_type_m()		then skin = load_tmskin().main()
	elseif	mode_rogan()		then skin = load_rgskin().main()
	elseif	mode_socialskin()	then skin = load_ssskin().main()
	elseif	mode_hij_simple()	then skin = load_hsskin().main()
	elseif	mode_neotm()		then skin = load_ntskin().main()
	elseif	mode_dotpop()		then skin = load_dpskin().main()
	elseif	mode_simple_play()	then skin = load_spskin().main()
	end
	package.path = PATH_HUB
	check_skin_tbl(skin)
	
	-- スキンからレーンの情報を取得
	local lane, lanes = explore_lane_data(skin)
	
	-- スキンから判定文字の情報を取得
	local judge = fetch_judge_data(skin)
	
	-- simple-play時
	if mode_simple_play() then
		local t = get_simple_play_settings()
		lanes.w = t.lanes.w[1]
		if t.lanes.w[2] then
			lanes.w2 = t.lanes.w[2]
		end
		hub.offset.judge.sp = {
			y = t.lanes.judge.y[1] - t.lanes.y[1],
			h = 124
		}
		hub.offset.bomb.sp = t.lanes.judgeline.h / 2
	end
	
	-- ノーツの改変
	local function changed_note(path1, path2, offset) 
		if DEBUG then print(SKIN_MSG .. "changed_skin_note") end
		local parts = require(path1).load(path2)
		add_parts(skin, parts)
		overwrite_note(skin, parts)
		adjust_dst_note(skin, offset)
		-- ノーツの改変は旧型式で行う
		skin.note.lnbodyActive		= nil
		skin.note.hcnbodyActive		= nil
		skin.note.hcnbodyMiss		= nil
		skin.note.hcnbodyReactive	= nil
	end
	
	-- ボムの改変
	local function changed_bomb(path1, path2, name, offset)
		if DEBUG then print(SKIN_MSG .. "changed_skin_bomb") end
		local size = get_offset(name)
		local parts = require(path1).load(path2, lane, lanes, offset, size)
		if		mode_modernchic()	then changed_mcbomb(skin, parts)
		elseif	mode_generictheme()	then changed_gtbomb(skin, parts)
		elseif	mode_type_m()		then changed_tmbomb(skin, parts)
		elseif	mode_rogan()		then changed_rgbomb(skin, parts)
		elseif	mode_socialskin()	then changed_ssbomb(skin, parts)
		elseif	mode_hij_simple()	then changed_hsbomb(skin, parts)
		elseif	mode_neotm()		then changed_ntbomb(skin, parts)
		elseif	mode_simple_play()	then changed_spbomb(skin, parts)
		end
	end
	
	-- 判定文字の改変
	local function changed_judge(path1, path2, name, offset)
		if DEBUG then print(SKIN_MSG .. "changed_skin_judge") end
		local size = get_offset(name)
		local parts = require(path1).load(path2, lanes, judge, offset, size)
		add_parts(skin, parts)
		overwrite_judge(skin, parts)
	end
	
	-- フルコンボエフェクトの改変
	local function changed_fceffect(path1, path2)
		if DEBUG then print(SKIN_MSG .. "changed_skin_fceffect") end
		local parts = require(path1).load(path2, lanes)
		if		mode_modernchic()	then changed_mc_fceffect(skin, parts)
		elseif	mode_generictheme()	then changed_gt_fceffect(skin, parts)
		elseif	mode_type_m()		then changed_tm_fceffect(skin, parts)
		elseif	mode_rogan()		then changed_rg_fceffect(skin, parts)
		elseif	mode_socialskin()	then changed_ss_fceffect(skin, parts)
		elseif	mode_hij_simple()	then changed_hs_fceffect(skin, parts)
		elseif	mode_neotm()		then changed_nt_fceffect(skin, parts)
		elseif	mode_simple_play()	then changed_sp_fceffect(skin, parts)
		end
	end
	
	-- スキン改変の実行
	local function run_changed_parts(offset_bomb, offset_judge)
		print("改変開始")
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_MC)			then changed_note(hub.l_path.NOTE_MC,		f_pathset.mc.note,		hub.offset.note.center) end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_GT)			then changed_note(hub.l_path.NOTE_GT,		f_pathset.gt.note,		hub.offset.note.center) end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_TM)			then changed_note(hub.l_path.NOTE_TM,		hub.f_path.NOTE_TM,		hub.offset.note.under)  end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_RG)			then changed_note(hub.l_path.NOTE_RG,		hub.f_path.NOTE_RG,		hub.offset.note.under)  end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_SS)			then changed_note(hub.l_path.NOTE_SS,		hub.f_path.NOTE_SS,		hub.offset.note.under)  end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_DXPAC)		then changed_note(hub.l_path.NOTE_DXPAC,	f_pathset.dxp.note,		hub.offset.note.center) end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_DXPACW)		then changed_note(hub.l_path.NOTE_DXPACW,	f_pathset.dxp.note,		hub.offset.note.center) end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_DXPCS)		then changed_note(hub.l_path.NOTE_DXPCS,	f_pathset.dxp.note,		hub.offset.note.center) end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_DXPCSW)		then changed_note(hub.l_path.NOTE_DXPCSW,	f_pathset.dxp.note,		hub.offset.note.center) end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_WM)			then changed_note(hub.l_path.NOTE_WM,		f_pathset.wm.note,		hub.offset.note.wmix)   end
		if option(hub.name.P_SELECT_NOTE,	hub.op.NOTE_WMAC)		then changed_note(hub.l_path.NOTE_WMAC,		f_pathset.wmac.note,	hub.offset.note.center) end
		
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_MC)			then changed_bomb(hub.l_path.BOMB_MC,		hub.f_path.BOMB_MC,		hub.name.O_BOMB_MC,		offset_bomb) end
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_GT)			then changed_bomb(hub.l_path.BOMB_GT,		hub.f_path.BOMB_GT,		hub.name.O_BOMB_GT,		offset_bomb) end
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_TM)			then changed_bomb(hub.l_path.BOMB_TM,		hub.f_path.BOMB_TM,		hub.name.O_BOMB_TM,		offset_bomb) end
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_RG)			then changed_bomb(hub.l_path.BOMB_RG,		hub.f_path.BOMB_RG,		hub.name.O_BOMB_RG,		offset_bomb) end
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_SS)			then changed_bomb(hub.l_path.BOMB_SS,		f_pathset.ss.bomb,		hub.name.O_BOMB_SS,		offset_bomb) end
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_DXP43)		then changed_bomb(hub.l_path.BOMB_DXP43,	hub.f_path.BOMB_DXP,	hub.name.O_BOMB_DXP,	offset_bomb) end
		if option(hub.name.P_SELECT_BOMB,	hub.op.BOMB_DXP169)		then changed_bomb(hub.l_path.BOMB_DXP169,	hub.f_path.BOMB_DXP,	hub.name.O_BOMB_DXP,	offset_bomb) end
		
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_MC)		then changed_judge(hub.l_path.JUDGE_MC,		hub.f_path.JUDGE_MC,	hub.name.O_JUDGE_MC,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_GT)		then changed_judge(hub.l_path.JUDGE_GT,		hub.f_path.JUDGE_GT,	hub.name.O_JUDGE_GT,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_TM)		then changed_judge(hub.l_path.JUDGE_TM,		hub.f_path.JUDGE_TM,	hub.name.O_JUDGE_TM,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_RG)		then changed_judge(hub.l_path.JUDGE_RG,		hub.f_path.JUDGE_RG,	hub.name.O_JUDGE_RG,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_SS)		then changed_judge(hub.l_path.JUDGE_SS,		f_pathset.ss.judge,		hub.name.O_JUDGE_SS,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_HS)		then changed_judge(hub.l_path.JUDGE_HS,		hub.f_path.JUDGE_HS,	hub.name.O_JUDGE_HS,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_DXP43)		then changed_judge(hub.l_path.JUDGE_DXP43,	hub.f_path.JUDGE_DXP,	hub.name.O_JUDGE_DXP,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_DXP169)	then changed_judge(hub.l_path.JUDGE_DXP169,	hub.f_path.JUDGE_DXP,	hub.name.O_JUDGE_DXP,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_WM)		then changed_judge(hub.l_path.JUDGE_WM,		hub.f_path.JUDGE_WM,	hub.name.O_JUDGE_WM,	offset_judge) end
		if option(hub.name.P_SELECT_JUDGE,	hub.op.JUDGE_WMAC)		then changed_judge(hub.l_path.JUDGE_WMAC,	hub.f_path.JUDGE_WMAC,	hub.name.O_JUDGE_WM,	offset_judge) end
		
		if option(hub.name.P_SELECT_FCE,	hub.op.FCE_MC)			then changed_fceffect(hub.l_path.FCE_MC,	f_pathset.mc.fce)   end
		if option(hub.name.P_SELECT_FCE,	hub.op.FCE_GT)			then changed_fceffect(hub.l_path.FCE_GT,	f_pathset.gt.fce)   end
		if option(hub.name.P_SELECT_FCE,	hub.op.FCE_TM)			then changed_fceffect(hub.l_path.FCE_TM,	hub.f_path.FCE_TM)  end
		if option(hub.name.P_SELECT_FCE,	hub.op.FCE_DXPN)		then changed_fceffect(hub.l_path.FCE_DXPN,	hub.f_path.FCE_DXP) end
		if option(hub.name.P_SELECT_FCE,	hub.op.FCE_WM)			then changed_fceffect(hub.l_path.FCE_WM,	hub.f_path.FCE_WM)  end
		
		if option(hub.name.P_SELECT_SUD,	hub.op.SUD_HUB)			then changed_cover_sud( skin,	hub.f_path.COVER_SUD,	lanes) end
		if option(hub.name.P_SELECT_HID,	hub.op.HID_HUB)			then changed_cover_hid( skin,	hub.f_path.COVER_HID,	lanes) end
		if option(hub.name.P_SELECT_LIFT,	hub.op.LIFT_HUB)		then changed_cover_lift(skin,	hub.f_path.COVER_LIFT,	lanes) end
		if option(hub.name.P_SELECT_FIN,	hub.op.FIN_HUB)			then changed_cover_fin( skin,	hub.f_path.COVER_FIN,	lanes) end
	end
	if		mode_modernchic()	then run_changed_parts(hub.offset.bomb.mc, hub.offset.judge.mc)
	elseif	mode_generictheme()	then run_changed_parts(hub.offset.bomb.gt, hub.offset.judge.gt)
	elseif	mode_type_m()		then run_changed_parts(hub.offset.bomb.tm, hub.offset.judge.tm)
	elseif	mode_rogan()		then run_changed_parts(hub.offset.bomb.rg, hub.offset.judge.rg)
	elseif	mode_socialskin()	then run_changed_parts(hub.offset.bomb.ss, hub.offset.judge.ss)
	elseif	mode_hij_simple()	then run_changed_parts(hub.offset.bomb.hs, hub.offset.judge.hs)
	elseif	mode_neotm()		then run_changed_parts(hub.offset.bomb.nt, hub.offset.judge.nt)
	elseif	mode_simple_play()	then run_changed_parts(hub.offset.bomb.sp, hub.offset.judge.sp)
	end
	
	-- 拡張機能の追加
	customTimer_id = create_customTimer_id(skin)
	load_extension(skin, skin_config.get_path(hub.f_path.EX1))
	load_extension(skin, skin_config.get_path(hub.f_path.EX2))
	load_extension(skin, skin_config.get_path(hub.f_path.EX3))
	load_extension(skin, skin_config.get_path(hub.f_path.EX4))
	load_extension(skin, skin_config.get_path(hub.f_path.EX5))
	load_extension(skin, skin_config.get_path(hub.f_path.EX6))
	load_extension(skin, skin_config.get_path(hub.f_path.EX7))
	load_extension(skin, skin_config.get_path(hub.f_path.EX8))
	load_extension(skin, skin_config.get_path(hub.f_path.EX9))
	load_extension(skin, skin_config.get_path(hub.f_path.EX10))
	
	-- 7鍵スキンを5鍵用に変換
	if convert_7to5() then changed_type_7to5(skin, lanes) end
	
	-- 14鍵スキンを10鍵用に変換
	if convert_14to10() then changed_type_14to10(skin, lanes) end
	
	return skin
	
end

return {
	header = header,
	main = main
}
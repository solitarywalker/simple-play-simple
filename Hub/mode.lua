local skinlist = {
	"ModernChic",			-- 1
	"GenericTheme%-master",	-- 2
	"TYPE%-M",				-- 3
	"Rogan",				-- 4
	"SocialSkin",			-- 5
	"hij_simple",			-- 6
	"NeoTm_Lua",			-- 7
	"DotPop",				-- 8
	"simple%-play"			-- 9
}

--	ファイルが存在するかどうか
local function file_exists(path)
	local status, parts = pcall(function() return loadfile(path) end)
	if status then
		return true
	else
		return false
	end
end

-- simple-playフォルダ名を取得する
-- beatoraja 0.8.9 から PATH_SKIN (= package.path) に入るスキンディレクトリが
-- 絶対パスになったので、12 文字目固定では取れない。playmain.lua の
-- get_folder_name() と同じ取り方にする。
local function get_sp_folder_name()
	local dir = string.match(tostring(PATH_SKIN), "([^;]+)/%?%.lua$") or ""
	dir = string.gsub(dir, "/system$", "")
	return string.match(dir, "^skin/(.+)$") or string.match(dir, "^.-/skin/(.+)$") or dir
end

-- スキンを識別する
local function find_skin_name(list)
	for i, v in pairs(list) do
		if string.find(PATH_SKIN, v) then
			return i
		end
	end
	-- simple-play改名時
	if file_exists(get_sp_folder_name() .. "/system/modules/hub_id_simple_play_simple.lua") then
		return 9
	end
	-- other
	return -1
end

return find_skin_name(skinlist)
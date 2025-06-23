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
local function get_sp_folder_name()
	return string.sub(tostring(PATH_SKIN), 12, string.len(tostring(PATH_SKIN)) - 13)
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
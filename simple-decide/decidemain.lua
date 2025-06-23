local header = {
	type = 6,
	name = "simple-decide (lua)",
	w = 1920,
	h = 1080,
	scene = 1000,
	input = 1000, -- 決定画面が1000以上表示されていないとプレイスキンでの処理落ちがひどい
	fadeout = 0,
	property = {
		{name = "--プレイ開始時に処理落ちする場合は数字を大きくして下さい--------------------------", item = {{name = "-", op = 990}}},
		{name = "待機時間 wait", item = {
			{name = "1", op = 931},
			{name = "2", op = 932},
			{name = "3", op = 933},
			{name = "4", op = 934},
			{name = "5", op = 935}
		}, def = "1"},
	},
	filepath = {}
}

local function main()
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end
	
	if skin_config.option["待機時間 wait"] == 931 then
		skin.scene, skin.input = 1000, 1000
	elseif skin_config.option["待機時間 wait"] == 932 then
		skin.scene, skin.input = 2000, 2000
	elseif skin_config.option["待機時間 wait"] == 933 then
		skin.scene, skin.input = 3000, 3000
	elseif skin_config.option["待機時間 wait"] == 934 then
		skin.scene, skin.input = 4000, 4000
	elseif skin_config.option["待機時間 wait"] == 935 then
		skin.scene, skin.input = 5000, 5000
	end

	skin.source = {
		{id = "src-load", path = "loading.png"}
	}
	skin.font = {}
	skin.image = {
		{id = "load", src = "src-load", x = 0, y = 0, w = -1, h = -1}
	}
	skin.imageset = {}
	skin.value = {}
	skin.text = {}
	skin.slider = {}
	skin.destination = {
		{id = "load", loop = 200, op = {190}, dst = {
			{time = 0, x = 910, y = 535, w = 101, h = 11, a = 128},
			{time = 200, a = 255}
		}},
		
		{id = -100, loop = skin.scene, stretch = 3, filter = 1, op = {191}, dst = {
			{time = 0, x = -520, y = -270, w = 2880, h = 1620, a = 64, acc = 2},
			{time = skin.scene, x = -440}
		}},
		{id = -100, loop = 200, stretch = 1, filter = 1, op = {191}, dst = {
			{time = 0, x = -480, y = -270, w = 2880, h = 1620, a = 128, acc = 2},
			{time = 200, x = 0, y = 0, w = 1920, h = 1080, a = 255}
		}},
		{id = -110, loop = skin.scene, dst = {
			{time = skin.scene - 200, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = skin.scene, a = 255}
		}}
	}
	
	return skin
end

return {
	header = header,
	main = main
}

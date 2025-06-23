local parts = {}

local function load(path, lanes)
	
	local fc = {
		x = lanes.x_center - 291.5,
		x2 = lanes.x_center2 - 291.5,
		y = lanes.y
	}
	
	parts.source = {{id = "hub-src-tmfullcombo", path = path}}
	
	parts.image = {
		{id = "hub-FC-header1",		src = "hub-src-tmfullcombo", x = 0,		y = 2330,	w = 217,	h = 92 , divy = 2 , cycle = 34},
		{id = "hub-FC-header2",		src = "hub-src-tmfullcombo", x = 218,	y = 2330,	w = 274,	h = 92 , divy = 2 , cycle = 34},
		{id = "hub-FC-upperglow",	src = "hub-src-tmfullcombo", x = 14,	y = 0,		w = 2,		h = 347},
		{id = "hub-FC-main1",		src = "hub-src-tmfullcombo", x = 0,		y = 0,		w = 4,		h = 507},
		{id = "hub-FC-main2",		src = "hub-src-tmfullcombo", x = 5,		y = 0,		w = 1,		h = 482},
		{id = "hub-FC-main3",		src = "hub-src-tmfullcombo", x = 17,	y = 0,		w = 458,	h = 151},
		{id = "hub-FC-main4",		src = "hub-src-tmfullcombo", x = 211,	y = 0,		w = 60,		h = 151},
		{id = "hub-FC-flash1",		src = "hub-src-tmfullcombo", x = 17,	y = 152,	w = 200,	h = 173},
		{id = "hub-FC-flash2",		src = "hub-src-tmfullcombo", x = 17,	y = 152,	w = 400,	h = 173, divx = 2 , cycle = 34},
		{id = "hub-FC-flash3",		src = "hub-src-tmfullcombo", x = 17,	y = 326,	w = 640,	h = 640},
		{id = "hub-FC-ring1",		src = "hub-src-tmfullcombo", x = 476,	y = 0,		w = 368,	h = 304},
		{id = "hub-FC-ring2",		src = "hub-src-tmfullcombo", x = 845,	y = 0,		w = 538,	h = 316},
		{id = "hub-FC-ring3",		src = "hub-src-tmfullcombo", x = 0,		y = 967,	w = 1445,	h = 698},
		{id = "hub-FC-glow",		src = "hub-src-tmfullcombo", x = 418,	y = 152,	w = 27,		h = 155, divyS = 5 , cycle = 83}
	}
	
	parts.destination = {
		{id = "hub-FC-header1", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = -108 + fc.x, y = 674, w = 325, h = 69 , a = 0},
			{time = 683, x = 27 + fc.x, a = 255},
			{time = 850, x = 34 + fc.x, a = 255},
			{time = 1150, x = 49 + fc.x, a = 255},
			{time = 1683, x = 75 + fc.x, a = 255},
			{time = 1850, x = 336 + fc.x, a = 0},
		}},

		{id = "hub-FC-header2", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = 261 + fc.x, y = 620, w = 411, h = 69 , a = 0},
			{time = 683, x = 126 + fc.x, a = 255},
			{time = 850, x = 118 + fc.x, a = 255},
			{time = 1150, x = 103 + fc.x, a = 255},
			{time = 1683, x = 78 + fc.x, a = 255},
			{time = 1850, x = -186 + fc.x, a = 0},
		}},

		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 123 + fc.x, y = 428, w = 3, h = -71 },
			{time = 133, y = 900, h = -520 },
			{time = 266, y = 1530, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 249 + fc.x, y = 375, w = 3, h = -18 },
			{time = 383, x = 249 + fc.x, y = 906, h = -520 },
			{time = 833, x = 249 + fc.x, y = 1587, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 289 + fc.x, y = 389, w = 3, h = -32 },
			{time = 216, y = 888, h = -520 },
			{time = 466, y = 1568, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 83, x = 199 + fc.x, y = 441, w = 3, h = -84 },
			{time = 166, y = 972, h = -520 },
			{time = 250, y = 1503, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 116, x = 424 + fc.x, y = 401, w = 3, h = -44 },
			{time = 283, y = 915, h = -520 },
			{time = 500,  y = 1584, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 183, x = 364 + fc.x, y = 453, w = 3, h = -96 },
			{time = 266, y = 980, h = -520 },
			{time = 350, y = 1505, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 216, x = 313 + fc.x, y = 402, w = 3, h = -45 },
			{time = 383, y = 927, h = -520 },
			{time = 583, y = 1556, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 233, x = 163 + fc.x, y = 426, w = 3, h = -69 },
			{time = 333, y = 899, h = -520 },
			{time = 466, y = 1530, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 250, x = 108 + fc.x, y = 399, w = 3, h = -42 },
			{time = 416, y = 905, h = -520 },
			{time = 633, y = 1562, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 400, x = 199 + fc.x, y = 387, w = 3, h = -30 },
			{time = 616, y = 900, h = -520 },
			{time = 900, y = 1571, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 416, x = 364 + fc.x, y = 423, w = 3, h = -66 },
			{time = 516, y = 899, h = -520 },
			{time = 650,  y = 1533, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 477 + fc.x, y = 419, w = 3, h = -62 },
			{time = 550, y = 896, h = -520 },
			{time = 683, y = 1530, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 153 + fc.x, y = 377, w = 3, h = -20 },
			{time = 750, y = 881, h = -520 },
			{time = 1166, y = 1580, h = -521 },
		}},

		{id = "hub-FC-main1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16,		x = lanes.x,				y = fc.y,		w = lanes.w, h = 0, a = 255 },
			{time = 116,	x = lanes.x,				y = fc.y + 761,	w = lanes.w, h = -761, a = 255 },
			{time = 583,	x = lanes.x_center - 1.5,	y = fc.y + 761,	w = 3, h = -761, a = 255 },
			{time = 833,	x = lanes.x_center - 1.5,	y = fc.y + 761,	w = 3, h = -761, a = 130 },
			{time = 1233,	x = lanes.x_center - 1.5,	y = fc.y + 761,	w = 3, h = -761, a = 0 },
		}},
		{id = "hub-FC-main2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16,		x = lanes.x, y = 1080, w = lanes.w, h = -723, a = 0 },
			{time = 183,	x = lanes.x, y = 1080, w = lanes.w, h = -723, a = 255 },
			{time = 333,	x = lanes.x, y = 1080, w = lanes.w, h = -723, a = 255 },
			{time = 683,	x = lanes.x, y = 1080, w = lanes.w, h = -723, a = 0 },
		}},
		{id = "hub-FC-main3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33,		x = lanes.x_center - ((lanes.w * 1.5903) / 2), y = 245,	w = lanes.w * 1.5903, h = 226, a = 40 },
			{time = 133,	x = lanes.x_center - ((lanes.w * 1.5903) / 2), y = -97,	w = lanes.w * 1.5903, h = 906, a = 255 },
			{time = 516,	x = lanes.x_center - ((lanes.w * 1.5903) / 2), y = 27,	w = lanes.w * 1.5903, h = 659, a = 250 },
			{time = 833,	x = lanes.x_center - ((lanes.w * 1.5903) / 2), y = 131,	w = lanes.w * 1.5903, h = 453, a = 150 },
			{time = 1316,	x = lanes.x_center - ((lanes.w * 1.5903) / 2), y = 131,	w = lanes.w * 1.5903, h = 453, a = 0 },
		}},
		{id = "hub-FC-main4", loop = -1, timer = 48,blend = 2, dst = {
			{time = 366,	x = lanes.x_center - ((lanes.w * 1.6736) / 2), y = 542, w = lanes.w * 1.6736, h = 352, a = 30 },
			{time = 500,	x = lanes.x_center - ((lanes.w * 1.6736) / 2), y = 584, w = lanes.w * 1.6736, h = 271, a = 255 },
			{time = 816,	x = lanes.x_center - ((lanes.w * 1.6736) / 2), y = 680, w = lanes.w * 1.6736, h = 76, a = 100 },
			{time = 1050,	x = lanes.x_center - ((lanes.w * 1.6736) / 2), y = 680, w = lanes.w * 1.6736, h = 76, a = 0 },
		}},

		{id = "hub-FC-flash1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -312 + fc.x, y = -156, w = 1200, h = 1038, a = 255 },
			{time = 116, x = -12 + fc.x, y = 105, w = 600, h = 519, a = 255 },
			{time = 283, x = -12 + fc.x, y = 105, w = 600, h = 519, a = 0 },
			{time = 515, x = -162 + fc.x, y = -25, w = 900, h = 778, a = 0 },
			{time = 516, x = -162 + fc.x, y = -25, w = 900, h = 778, a = 255 },
			{time = 633, x = -12 + fc.x, y = 105, w = 600, h = 519, a = 255 },
			{time = 1016, x = -12 + fc.x, y = 105, w = 600, h = 519, a = 0 },
		}},
		{id = "hub-FC-flash2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -162 + fc.x, y = -25, w = 778, h = 778, a = 0},
			{time = 116, x = -87 + fc.x, y = 47, w = 649, h = 649, a = 255 },
			{time = 283, x = 63 + fc.x, y = 173, w = 390, h = 390, a = 255 },
			{time = 283, x = 138 + fc.x, y = 240, w = 300, h = 260, a = 0 },
		}},
		{id = "hub-FC-flash3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 42 + fc.x, y = 156, w = 480, h = 480, a = 255},
			{time = 183, x = -414 + fc.x, y = -303, w = 1395, h = 1395, a = 255 },
			{time = 350, x = -678 + fc.x, y = -564, w = 1920, h = 1920, a = 0 },
		}},

		{id = "hub-FC-ring1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 148 + fc.x, y = 276, w = 278, h = 230, a = 255 },
			{time = 116, x = 25 + fc.x, y = 174, w = 525, h = 434, a = 255 },
			{time = 350, x = -237 + fc.x, y = -43, w = 1050, h = 867, a = 0 },
			{time = 1015, x = 4 + fc.x, y = 156, w = 552, h = 456, a = 0 },
			{time = 1016, x = 4 + fc.x, y = 156, w = 552, h = 456, a = 255 },
			{time = 1966, x = -237 + fc.x, y = -43, w = 1050, h = 867, a = 0 },
		}},
		{id = "hub-FC-ring2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 516, x = 183 + fc.x, y = 308, w = 210, h = 123, a = 255 },
			{time = 1016, x = -131 + fc.x, y = 122, w = 807, h = 474, a = 255 },
			{time = 1533, x = -291 + fc.x, y = 17, w = 1129, h = 663, a = 0 },
		}},
		{id = "hub-FC-ring3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 583, x = 223 + fc.x, y = 338, w = 135, h = 64, a = 255 },
			{time = 1083, x = -806 + fc.x, y = -267, w = 2168, h = 1047, a = 255 },
			{time = 1533, x = -914 + fc.x, y = -331, w = 2385, h = 1152, a = 0 },
		}}
	}
	
	local dst_dp = {
		{id = "hub-FC-header1", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = -108 + fc.x2, y = 674, w = 325, h = 69 , a = 0},
			{time = 683, x = 27 + fc.x2, a = 255},
			{time = 850, x = 34 + fc.x2, a = 255},
			{time = 1150, x = 49 + fc.x2, a = 255},
			{time = 1683, x = 75 + fc.x2, a = 255},
			{time = 1850, x = 336 + fc.x2, a = 0},
		}},

		{id = "hub-FC-header2", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = 261 + fc.x2, y = 620, w = 411, h = 69 , a = 0},
			{time = 683, x = 126 + fc.x2, a = 255},
			{time = 850, x = 118 + fc.x2, a = 255},
			{time = 1150, x = 103 + fc.x2, a = 255},
			{time = 1683, x = 78 + fc.x2, a = 255},
			{time = 1850, x = -186 + fc.x2, a = 0},
		}},

		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 123 + fc.x2, y = 428, w = 3, h = -71 },
			{time = 133, y = 900, h = -520 },
			{time = 266, y = 1530, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 249 + fc.x2, y = 375, w = 3, h = -18 },
			{time = 383, x = 249 + fc.x2, y = 906, h = -520 },
			{time = 833, x = 249 + fc.x2, y = 1587, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 289 + fc.x2, y = 389, w = 3, h = -32 },
			{time = 216, y = 888, h = -520 },
			{time = 466, y = 1568, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 83, x = 199 + fc.x2, y = 441, w = 3, h = -84 },
			{time = 166, y = 972, h = -520 },
			{time = 250, y = 1503, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 116, x = 424 + fc.x2, y = 401, w = 3, h = -44 },
			{time = 283, y = 915, h = -520 },
			{time = 500,  y = 1584, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 183, x = 364 + fc.x2, y = 453, w = 3, h = -96 },
			{time = 266, y = 980, h = -520 },
			{time = 350, y = 1505, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 216, x = 313 + fc.x2, y = 402, w = 3, h = -45 },
			{time = 383, y = 927, h = -520 },
			{time = 583, y = 1556, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 233, x = 163 + fc.x2, y = 426, w = 3, h = -69 },
			{time = 333, y = 899, h = -520 },
			{time = 466, y = 1530, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 250, x = 108 + fc.x2, y = 399, w = 3, h = -42 },
			{time = 416, y = 905, h = -520 },
			{time = 633, y = 1562, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 400, x = 199 + fc.x2, y = 387, w = 3, h = -30 },
			{time = 616, y = 900, h = -520 },
			{time = 900, y = 1571, h = -520 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 416, x = 364 + fc.x2, y = 423, w = 3, h = -66 },
			{time = 516, y = 899, h = -520 },
			{time = 650,  y = 1533, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 477 + fc.x2, y = 419, w = 3, h = -62 },
			{time = 550, y = 896, h = -520 },
			{time = 683, y = 1530, h = -521 },
		}},
		{id = "hub-FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 153 + fc.x2, y = 377, w = 3, h = -20 },
			{time = 750, y = 881, h = -520 },
			{time = 1166, y = 1580, h = -521 },
		}},

		{id = "hub-FC-main1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16,		x = lanes.x2,				y = 357,	w = lanes.w2, h = 0, a = 255 },
			{time = 116,	x = lanes.x2,				y = 1118,	w = lanes.w2, h = -761, a = 255 },
			{time = 583,	x = lanes.x_center2 - 1.5,	y = 1118,	w = 3, h = -761, a = 255 },
			{time = 833,	x = lanes.x_center2 - 1.5,	y = 1118,	w = 3, h = -761, a = 130 },
			{time = 1233,	x = lanes.x_center2 - 1.5,	y = 1118,	w = 3, h = -761, a = 0 },
		}},
		{id = "hub-FC-main2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16,		x = lanes.x2, y = 1080, w = lanes.w2, h = -723, a = 0 },
			{time = 183,	x = lanes.x2, y = 1080, w = lanes.w2, h = -723, a = 255 },
			{time = 333,	x = lanes.x2, y = 1080, w = lanes.w2, h = -723, a = 255 },
			{time = 683,	x = lanes.x2, y = 1080, w = lanes.w2, h = -723, a = 0 },
		}},
		{id = "hub-FC-main3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33,		x = lanes.x_center2 - ((lanes.w2 * 1.5903) / 2), y = 245,	w = lanes.w2 * 1.5903, h = 226, a = 40 },
			{time = 133,	x = lanes.x_center2 - ((lanes.w2 * 1.5903) / 2), y = -97,	w = lanes.w2 * 1.5903, h = 906, a = 255 },
			{time = 516,	x = lanes.x_center2 - ((lanes.w2 * 1.5903) / 2), y = 27,	w = lanes.w2 * 1.5903, h = 659, a = 250 },
			{time = 833,	x = lanes.x_center2 - ((lanes.w2 * 1.5903) / 2), y = 131,	w = lanes.w2 * 1.5903, h = 453, a = 150 },
			{time = 1316,	x = lanes.x_center2 - ((lanes.w2 * 1.5903) / 2), y = 131,	w = lanes.w2 * 1.5903, h = 453, a = 0 },
		}},
		{id = "hub-FC-main4", loop = -1, timer = 48,blend = 2, dst = {
			{time = 366,	x = lanes.x_center2 - ((lanes.w2 * 1.6736) / 2), y = 542, w = lanes.w2 * 1.6736, h = 352, a = 30 },
			{time = 500,	x = lanes.x_center2 - ((lanes.w2 * 1.6736) / 2), y = 584, w = lanes.w2 * 1.6736, h = 271, a = 255 },
			{time = 816,	x = lanes.x_center2 - ((lanes.w2 * 1.6736) / 2), y = 680, w = lanes.w2 * 1.6736, h = 76, a = 100 },
			{time = 1050,	x = lanes.x_center2 - ((lanes.w2 * 1.6736) / 2), y = 680, w = lanes.w2 * 1.6736, h = 76, a = 0 },
		}},

		{id = "hub-FC-flash1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -312 + fc.x2, y = -156, w = 1200, h = 1038, a = 255 },
			{time = 116, x = -12 + fc.x2, y = 105, w = 600, h = 519, a = 255 },
			{time = 283, x = -12 + fc.x2, y = 105, w = 600, h = 519, a = 0 },
			{time = 515, x = -162 + fc.x2, y = -25, w = 900, h = 778, a = 0 },
			{time = 516, x = -162 + fc.x2, y = -25, w = 900, h = 778, a = 255 },
			{time = 633, x = -12 + fc.x2, y = 105, w = 600, h = 519, a = 255 },
			{time = 1016, x = -12 + fc.x2, y = 105, w = 600, h = 519, a = 0 },
		}},
		{id = "hub-FC-flash2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -162 + fc.x2, y = -25, w = 778, h = 778, a = 0},
			{time = 116, x = -87 + fc.x2, y = 47, w = 649, h = 649, a = 255 },
			{time = 283, x = 63 + fc.x2, y = 173, w = 390, h = 390, a = 255 },
			{time = 283, x = 138 + fc.x2, y = 240, w = 300, h = 260, a = 0 },
		}},
		{id = "hub-FC-flash3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 42 + fc.x2, y = 156, w = 480, h = 480, a = 255},
			{time = 183, x = -414 + fc.x2, y = -303, w = 1395, h = 1395, a = 255 },
			{time = 350, x = -678 + fc.x2, y = -564, w = 1920, h = 1920, a = 0 },
		}},

		{id = "hub-FC-ring1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 148 + fc.x2, y = 276, w = 278, h = 230, a = 255 },
			{time = 116, x = 25 + fc.x2, y = 174, w = 525, h = 434, a = 255 },
			{time = 350, x = -237 + fc.x2, y = -43, w = 1050, h = 867, a = 0 },
			{time = 1015, x = 4 + fc.x2, y = 156, w = 552, h = 456, a = 0 },
			{time = 1016, x = 4 + fc.x2, y = 156, w = 552, h = 456, a = 255 },
			{time = 1966, x = -237 + fc.x2, y = -43, w = 1050, h = 867, a = 0 },
		}},
		{id = "hub-FC-ring2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 516, x = 183 + fc.x2, y = 308, w = 210, h = 123, a = 255 },
			{time = 1016, x = -131 + fc.x2, y = 122, w = 807, h = 474, a = 255 },
			{time = 1533, x = -291 + fc.x2, y = 17, w = 1129, h = 663, a = 0 },
		}},
		{id = "hub-FC-ring3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 583, x = 223 + fc.x2, y = 338, w = 135, h = 64, a = 255 },
			{time = 1083, x = -806 + fc.x2, y = -267, w = 2168, h = 1047, a = 255 },
			{time = 1533, x = -914 + fc.x2, y = -331, w = 2385, h = 1152, a = 0 },
		}}
	}
	
	if is_play_10keys() or is_play_14keys() then
		for i, v in pairs(dst_dp) do
			table.insert(parts.destination, v)
		end
	end
	
	return parts
end

return {
	parts = parts,
	load = load
}
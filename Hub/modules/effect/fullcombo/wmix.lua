local parts = {}

local function load(path, lanes)
	
	parts.source = {
		{id = "hub-src-wmixfc", path = path}
	}
	
	parts.image = {
		{id = "hub-main1",  src = "hub-src-wmixfc", x = 0,    y = 513,  w = 377, h = 687, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-main2",  src = "hub-src-wmixfc", x = 0,    y = 0,    w = 377, h = 482, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-main3",  src = "hub-src-wmixfc", x = 823,  y = 0,    w = 377, h = 482, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-flash1", src = "hub-src-wmixfc", x = 377,  y = 806,  w = 428, h = 188, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-flash2", src = "hub-src-wmixfc", x = 377,  y = 417,  w = 428, h = 383, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-dust1",  src = "hub-src-wmixfc", x = 823,  y = 900,  w = 380, h = 301, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-dust2",  src = "hub-src-wmixfc", x = 823,  y = 900,  w = 380, h = 602, divx = 1, divy = 2, cycle = 160, timer = 0},
		{id = "hub-kira",   src = "hub-src-wmixfc", x = 588,  y = 1000, w = 18,  h = 36,  divx = 1, divy = 2, cycle = 120, timer = 48},
		{id = "hub-arrow",  src = "hub-src-wmixfc", x = 377,  y = 1000, w = 113, h = 80,  divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-petal",  src = "hub-src-wmixfc", x = 610,  y = 1000, w = 115, h = 115, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-light",  src = "hub-src-wmixfc", x = 823,  y = 485,  w = 377, h = 408, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-ring",   src = "hub-src-wmixfc", x = 377,  y = 0,    w = 395, h = 410, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-bar1-1", src = "hub-src-wmixfc", x = 1221, y = 0,    w = 107, h = 121, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-bar1-2", src = "hub-src-wmixfc", x = 1221, y = 126,  w = 180, h = 183, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-bar2-1", src = "hub-src-wmixfc", x = 1221, y = 318,  w = 176, h = 200, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-bar2-2", src = "hub-src-wmixfc", x = 1221, y = 521,  w = 295, h = 298, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-full",   src = "hub-src-wmixfc", x = 1452, y = 896,  w = 120, h = 138, divx = 1, divy = 1, cycle = 0,   timer = 0},
		{id = "hub-combo",  src = "hub-src-wmixfc", x = 1201, y = 896,  w = 210, h = 210, divx = 1, divy = 1, cycle = 0,   timer = 0}
	}

	parts.destination = {
		--[[
		{id = "hub-main1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 16, x = 48, y = 482, w = 377, h = -482, a = 200, angle = 0},
			{time = 2500, x = 48, y = 482, w = 377, h = -687, a = 0, angle = 0},
		}},
		--]]
		{id = "hub-main1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 16, x = 48, y = 0, w = 377, h = 482, a = 200, angle = 0},
			{time = 2500, x = 48, y = -205, w = 377, h = 687, a = 0, angle = 0},
		}},
		{id = "hub-main2", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 48, y = 0, w = 377, h = 482, a = 255, angle = 0},
			{time = 2400, x = 48, y = 0, w = 377, h = 482, a = 0, angle = 0},
		}},
		{id = "hub-main3", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 48, y = 0, w = 377, h = 482, a = 255, angle = 0},
			{time = 1000, x = 231, y = 0, w = 10, h = 482, a = 0, angle = 0},
		}},

		{id = "hub-flash1", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = -56, y = 384, w = 605, h = 188, a = 255, angle = 0},
			{time = 2000, x = -56, y = 294, w = 605, h = 360, a = 0, angle = 0},
		}},
		{id = "hub-flash2", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 23, y = 267, w = 428, h = 383, a = 255, angle = 0},
			{time = 1500, x = -403, y = -112, w = 1284, h = 1149, a = 0, angle = 0},
		}},

		{id = "hub-dust1", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 56, y = 295, w = 380, h = 301, a = 205, angle = 0},
			{time = 2400, x = 56, y = 214, w = 380, h = 301, a = 0, angle = 0},
		}},
		{id = "hub-dust2", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 56, y = 295, w = 380, h = 301, a = 255, angle = 0},
			{time = 2400, x = 56, y = 214, w = 380, h = 301, a = 0, angle = 0},
		}},

		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 16, x = 89, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 800, x = 89, y = 360, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 150, x = 327, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 833, x = 327, y = 317, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 183, x = 251, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1016, x = 251, y = 110, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 233, x = 285, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 916, x = 285, y = 249, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 250, x = 145, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 933, x = 145, y = 263, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 266, x = 316, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1050, x = 316, y = 270, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 283, x = 78, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 900, x = 78, y = 127, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 350, x = 179, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1133, x = 179, y = 297, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 350, x = 290, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1100, x = 290, y = 312, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 383, x = 156, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1166, x = 156, y = 186, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 383, x = 296, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1166, x = 296, y = 245, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 433, x = 275, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 783, x = 275, y = 391, w = 18, h = 18, a = 255, angle = 0},
			{time = 1033, x = 275, y = 291, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 483, x = 332, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 833, x = 332, y = 322, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 500, x = 340, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1183, x = 340, y = -12, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 500, x = 271, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1283, x = 271, y = 40, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 500, x = 286, y = 449, w = 18, h = 18, a = 255, angle = 0},
			{time = 1266, x = 286, y = -15, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 533, x = 148, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1316, x = 148, y = 413, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 566, x = 306, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1266, x = 306, y = 352, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 616, x = 160, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1266, x = 160, y = 384, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 683, x = 208, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1216, x = 208, y = 354, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 700, x = 163, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1050, x = 163, y = 426, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 750, x = 263, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1283, x = 263, y = 279, w = 18, h = 18, a = 255, angle = 0},
		}},
		{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 866, x = 330, y = 451, w = 18, h = 18, a = 255, angle = 0},
			{time = 1216, x = 330, y = 387, w = 18, h = 18, a = 255, angle = 0},
		}},

		{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 700, x = 73, y = 444, w = 113, h = 80, a = 205, angle = 0},
			{time = 900, x = 73, y = -50, w = 113, h = 80, a = 255, angle = 0},
		}},
		{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 825, x = 322, y = 444, w = 113, h = 80, a = 205, angle = 0},
			{time = 1025, x = 322, y = -50, w = 113, h = 80, a = 255, angle = 0},
		}},
		{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 750, x = 1, y = 444, w = 113, h = 80, a = 205, angle = 0},
			{time = 950, x = 1, y = -50, w = 113, h = 80, a = 255, angle = 0},
		}},
		{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 850, x = 1, y = 444, w = 113, h = 80, a = 205, angle = 0},
			{time = 1050, x = 1, y = -50, w = 113, h = 80, a = 205, angle = 0},
		}},
		{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 700, x = 74, y = 444, w = 113, h = 80, a = 205, angle = 0},
			{time = 900, x = 74, y = 132, w = 113, h = 80, a = 205, angle = 0},
			{time = 1200, x = 74, y = 120, w = 113, h = 80, a = 205, angle = 0},
			{time = 1300, x = 74, y = -50, w = 113, h = 80, a = 205, angle = 0},
		}},
		{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 1300, x = 322, y = 444, w = 113, h = 80, a = 205, angle = 0},
			{time = 1400, x = 322, y = 110, w = 113, h = 80, a = 205, angle = 0},
			{time = 1600, x = 322, y = 80, w = 113, h = 80, a = 205, angle = 0},
			{time = 1700, x = 322, y = -50, w = 113, h = 80, a = 205, angle = 0},
		}},

		{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 700, x = 73, y = 444, w = 115, h = 115, a = 205, angle = 0},
			{time = 1400, x = 73, y = -50, w = 115, h = 115, a = 0, angle = 40},
		}},
		{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 825, x = 322, y = 444, w = 115, h = 115, a = 205, angle = 60},
			{time = 1625, x = 322, y = -50, w = 115, h = 115, a = 0, angle = 80},
		}},
		{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 750, x = 1, y = 444, w = 115, h = 115, a = 205, angle = 150},
			{time = 1700, x = 1, y = -50, w = 115, h = 115, a = 0, angle = 170},
		}},
		{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 850, x = 1, y = 444, w = 115, h = 115, a = 205, angle = 210},
			{time = 1850, x = 1, y = -50, w = 115, h = 115, a = 0, angle = 250},
		}},
		{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 700, x = 74, y = 444, w = 115, h = 115, a = 205, angle = 0},
			{time = 900, x = 74, y = 132, w = 115, h = 115, a = 205, angle = 20},
			{time = 1400, x = 74, y = 120, w = 115, h = 115, a = 205, angle = 30},
			{time = 2000, x = 74, y = -50, w = 115, h = 115, a = 0, angle = 40},
		}},
		{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 1300, x = 322, y = 444, w = 115, h = 115, a = 205, angle = 80},
			{time = 1400, x = 322, y = 110, w = 115, h = 115, a = 205, angle = 90},
			{time = 1600, x = 322, y = 80, w = 115, h = 115, a = 205, angle = 100},
			{time = 2200, x = 322, y = -50, w = 115, h = 115, a = 0, angle = 110},
		}},

		{id = "hub-light", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 1100, x = 48, y = 64, w = 377, h = 408, a = 0, angle = 0},
			{time = 1400, x = 48, y = 64, w = 377, h = 408, a = 255, angle = 0},
			{time = 1600, x = 48, y = 64, w = 377, h = 408, a = 155, angle = 0},
			{time = 1800, x = 48, y = 64, w = 377, h = 408, a = 205, angle = 0},
			{time = 2400, x = 48, y = 64, w = 377, h = 408, a = 0, angle = 0},
		}},

		{id = "hub-ring", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 37, y = 276, w = 395, h = 410, a = 255, angle = 0},
			{time = 400, x = -553, y = -332, w = 1580, h = 1640, a = 0, angle = 0},
		}},
		{id = "hub-ring", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 0, x = 37, y = 276, w = 395, h = 410, a = 255, angle = 0},
			{time = 600, x = -165, y = 67, w = 790, h = 820, a = 0, angle = 0},
		}},

		{id = "hub-bar1-1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 375, x = -42, y = -39, w = 107, h = 121, a = 0, angle = 0},
			{time = 575, x = 49, y = 17, w = 107, h = 121, a = 155, angle = 0},
			{time = 1700, x = 49, y = 17, w = 107, h = 121, a = 155, angle = 0},
			{time = 1750, x = 49, y = 17, w = 107, h = 121, a = 0, angle = 0},
			{time = 1800, x = 49, y = 17, w = 107, h = 121, a = 155, angle = 0},
			{time = 1850, x = 49, y = 17, w = 107, h = 121, a = 0, angle = 0},
		}},
		{id = "hub-bar1-2", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 425, x = -117, y = -124, w = 180, h = 183, a = 0, angle = 0},
			{time = 575, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
			{time = 1250, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
			{time = 1300, x = 49, y = 51, w = 180, h = 183, a = 0, angle = 0},
			{time = 1350, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
			{time = 1400, x = 49, y = 51, w = 180, h = 183, a = 0, angle = 0},
			{time = 1450, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
			{time = 1500, x = 49, y = 51, w = 180, h = 183, a = 0, angle = 0},
		}},
		{id = "hub-bar2-1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 350, x = -101, y = -1, w = 176, h = 200, a = 0, angle = 0},
			{time = 550, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
			{time = 700, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
			{time = 1350, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
			{time = 1400, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
			{time = 1450, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
			{time = 1550, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
			{time = 1600, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
			{time = 1700, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
			{time = 1750, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
			{time = 1800, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
		}},
		{id = "hub-bar2-2", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 300, x = -756, y = -54, w = 295, h = 298, a = 0, angle = 0},
			{time = 500, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
			{time = 1000, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
			{time = 1050, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
			{time = 1100, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
			{time = 1150, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
			{time = 1200, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
			{time = 1250, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
			{time = 1300, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
			{time = 1350, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
		}},

		{id = "hub-full", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 500, x = 207, y = -119, w = 120, h = 138, a = 0, angle = 0},
			{time = 600, x = 106, y = 141, w = 120, h = 138, a = 255, angle = 0},
			{time = 1300, x = 106, y = 141, w = 120, h = 138, a = 255, angle = 0},
			{time = 1400, x = -96, y = -119, w = 120, h = 138, a = 0, angle = 0},
		}},
		{id = "hub-combo", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
			{time = 600, x = 365, y = 432, w = 210, h = 210, a = 0, angle = 0},
			{time = 700, x = 71, y = 187, w = 210, h = 210, a = 255, angle = 0},
			{time = 1350, x = 71, y = 187, w = 210, h = 210, a = 255, angle = 0},
			{time = 1450, x = 365, y = 432, w = 210, h = 210, a = 0, angle = 0},
		}},
		{id = "hub-full", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 800, x = 106, y = 141, w = 120, h = 138, a = 0, angle = 0},
			{time = 900, x = 106, y = 141, w = 120, h = 138, a = 255, angle = 0},
			{time = 1000, x = 106, y = 141, w = 120, h = 138, a = 0, angle = 0},
		}},
		{id = "hub-combo", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
			{time = 900, x = 71, y = 187, w = 210, h = 210, a = 0, angle = 0},
			{time = 1000, x = 71, y = 187, w = 210, h = 210, a = 255, angle = 0},
			{time = 1100, x = 71, y = 187, w = 210, h = 210, a = 0, angle = 0},
		}}
	}
	
	-- LR2スキンy座標の反転
	for i1 = 1, #parts.destination do
		for i2 = 1, #parts.destination[i1].dst do
			parts.destination[i1].dst[i2].y = 720 - (parts.destination[i1].dst[i2].y + parts.destination[i1].dst[i2].h) 
		end
	end
	
	local offset = {}
	-- レーンサイズに合わせて拡縮
	offset.size = lanes.w / parts.destination[1].dst[1].w
	for i1 = 1, #parts.destination do
		for i2 = 1, #parts.destination[i1].dst do
			parts.destination[i1].dst[i2].w = parts.destination[i1].dst[i2].w * offset.size
			parts.destination[i1].dst[i2].h = parts.destination[i1].dst[i2].h * offset.size
			parts.destination[i1].dst[i2].x = parts.destination[i1].dst[i2].x * offset.size
			parts.destination[i1].dst[i2].y = parts.destination[i1].dst[i2].y * offset.size
		end
	end
	
	-- 座標を合わせる
	offset.x = lanes.x - parts.destination[1].dst[1].x
	offset.y = lanes.y - (238 * offset.size)
	offset.h = (1080 - lanes.y) / (482 * offset.size)
	for i1 = 1, #parts.destination do
		for i2 = 1, #parts.destination[i1].dst do
			parts.destination[i1].dst[i2].x = parts.destination[i1].dst[i2].x + offset.x
			parts.destination[i1].dst[i2].y = parts.destination[i1].dst[i2].y + offset.y
		end
	end
	
	-- main画像をレーンサイズに拡大
	parts.destination[1].dst[1].h = parts.destination[1].dst[1].h * offset.h
	parts.destination[1].dst[2].h = parts.destination[1].dst[2].h * offset.h
	parts.destination[2].dst[1].h = parts.destination[2].dst[1].h * offset.h
	parts.destination[2].dst[2].h = parts.destination[2].dst[2].h * offset.h
	parts.destination[3].dst[1].h = parts.destination[3].dst[1].h * offset.h
	parts.destination[3].dst[2].h = parts.destination[3].dst[2].h * offset.h
	
	-- DP用
	if is_play_10keys() or is_play_14keys() then
		local dp_dst = {
			--[[
			{id = "hub-main1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 16, x = 48, y = 482, w = 377, h = -482, a = 200, angle = 0},
				{time = 2500, x = 48, y = 482, w = 377, h = -687, a = 0, angle = 0},
			}},
			--]]
			{id = "hub-main1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 16, x = 48, y = 0, w = 377, h = 482, a = 200, angle = 0},
				{time = 2500, x = 48, y = -205, w = 377, h = 687, a = 0, angle = 0},
			}},
			{id = "hub-main2", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 48, y = 0, w = 377, h = 482, a = 255, angle = 0},
				{time = 2400, x = 48, y = 0, w = 377, h = 482, a = 0, angle = 0},
			}},
			{id = "hub-main3", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 48, y = 0, w = 377, h = 482, a = 255, angle = 0},
				{time = 1000, x = 231, y = 0, w = 10, h = 482, a = 0, angle = 0},
			}},

			{id = "hub-flash1", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = -56, y = 384, w = 605, h = 188, a = 255, angle = 0},
				{time = 2000, x = -56, y = 294, w = 605, h = 360, a = 0, angle = 0},
			}},
			{id = "hub-flash2", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 23, y = 267, w = 428, h = 383, a = 255, angle = 0},
				{time = 1500, x = -403, y = -112, w = 1284, h = 1149, a = 0, angle = 0},
			}},

			{id = "hub-dust1", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 56, y = 295, w = 380, h = 301, a = 205, angle = 0},
				{time = 2400, x = 56, y = 214, w = 380, h = 301, a = 0, angle = 0},
			}},
			{id = "hub-dust2", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 56, y = 295, w = 380, h = 301, a = 255, angle = 0},
				{time = 2400, x = 56, y = 214, w = 380, h = 301, a = 0, angle = 0},
			}},

			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 16, x = 89, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 800, x = 89, y = 360, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 150, x = 327, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 833, x = 327, y = 317, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 183, x = 251, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1016, x = 251, y = 110, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 233, x = 285, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 916, x = 285, y = 249, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 250, x = 145, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 933, x = 145, y = 263, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 266, x = 316, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1050, x = 316, y = 270, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 283, x = 78, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 900, x = 78, y = 127, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 350, x = 179, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1133, x = 179, y = 297, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 350, x = 290, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1100, x = 290, y = 312, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 383, x = 156, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1166, x = 156, y = 186, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 383, x = 296, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1166, x = 296, y = 245, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 433, x = 275, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 783, x = 275, y = 391, w = 18, h = 18, a = 255, angle = 0},
				{time = 1033, x = 275, y = 291, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 483, x = 332, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 833, x = 332, y = 322, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 500, x = 340, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1183, x = 340, y = -12, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 500, x = 271, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1283, x = 271, y = 40, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 500, x = 286, y = 449, w = 18, h = 18, a = 255, angle = 0},
				{time = 1266, x = 286, y = -15, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 533, x = 148, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1316, x = 148, y = 413, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 566, x = 306, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1266, x = 306, y = 352, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 616, x = 160, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1266, x = 160, y = 384, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 683, x = 208, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1216, x = 208, y = 354, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 700, x = 163, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1050, x = 163, y = 426, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 750, x = 263, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1283, x = 263, y = 279, w = 18, h = 18, a = 255, angle = 0},
			}},
			{id = "hub-kira", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 866, x = 330, y = 451, w = 18, h = 18, a = 255, angle = 0},
				{time = 1216, x = 330, y = 387, w = 18, h = 18, a = 255, angle = 0},
			}},

			{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 700, x = 73, y = 444, w = 113, h = 80, a = 205, angle = 0},
				{time = 900, x = 73, y = -50, w = 113, h = 80, a = 255, angle = 0},
			}},
			{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 825, x = 322, y = 444, w = 113, h = 80, a = 205, angle = 0},
				{time = 1025, x = 322, y = -50, w = 113, h = 80, a = 255, angle = 0},
			}},
			{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 750, x = 1, y = 444, w = 113, h = 80, a = 205, angle = 0},
				{time = 950, x = 1, y = -50, w = 113, h = 80, a = 255, angle = 0},
			}},
			{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 850, x = 1, y = 444, w = 113, h = 80, a = 205, angle = 0},
				{time = 1050, x = 1, y = -50, w = 113, h = 80, a = 205, angle = 0},
			}},
			{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 700, x = 74, y = 444, w = 113, h = 80, a = 205, angle = 0},
				{time = 900, x = 74, y = 132, w = 113, h = 80, a = 205, angle = 0},
				{time = 1200, x = 74, y = 120, w = 113, h = 80, a = 205, angle = 0},
				{time = 1300, x = 74, y = -50, w = 113, h = 80, a = 205, angle = 0},
			}},
			{id = "hub-arrow", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 1300, x = 322, y = 444, w = 113, h = 80, a = 205, angle = 0},
				{time = 1400, x = 322, y = 110, w = 113, h = 80, a = 205, angle = 0},
				{time = 1600, x = 322, y = 80, w = 113, h = 80, a = 205, angle = 0},
				{time = 1700, x = 322, y = -50, w = 113, h = 80, a = 205, angle = 0},
			}},

			{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 700, x = 73, y = 444, w = 115, h = 115, a = 205, angle = 0},
				{time = 1400, x = 73, y = -50, w = 115, h = 115, a = 0, angle = 40},
			}},
			{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 825, x = 322, y = 444, w = 115, h = 115, a = 205, angle = 60},
				{time = 1625, x = 322, y = -50, w = 115, h = 115, a = 0, angle = 80},
			}},
			{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 750, x = 1, y = 444, w = 115, h = 115, a = 205, angle = 150},
				{time = 1700, x = 1, y = -50, w = 115, h = 115, a = 0, angle = 170},
			}},
			{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 850, x = 1, y = 444, w = 115, h = 115, a = 205, angle = 210},
				{time = 1850, x = 1, y = -50, w = 115, h = 115, a = 0, angle = 250},
			}},
			{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 700, x = 74, y = 444, w = 115, h = 115, a = 205, angle = 0},
				{time = 900, x = 74, y = 132, w = 115, h = 115, a = 205, angle = 20},
				{time = 1400, x = 74, y = 120, w = 115, h = 115, a = 205, angle = 30},
				{time = 2000, x = 74, y = -50, w = 115, h = 115, a = 0, angle = 40},
			}},
			{id = "hub-petal", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 1300, x = 322, y = 444, w = 115, h = 115, a = 205, angle = 80},
				{time = 1400, x = 322, y = 110, w = 115, h = 115, a = 205, angle = 90},
				{time = 1600, x = 322, y = 80, w = 115, h = 115, a = 205, angle = 100},
				{time = 2200, x = 322, y = -50, w = 115, h = 115, a = 0, angle = 110},
			}},

			{id = "hub-light", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 1100, x = 48, y = 64, w = 377, h = 408, a = 0, angle = 0},
				{time = 1400, x = 48, y = 64, w = 377, h = 408, a = 255, angle = 0},
				{time = 1600, x = 48, y = 64, w = 377, h = 408, a = 155, angle = 0},
				{time = 1800, x = 48, y = 64, w = 377, h = 408, a = 205, angle = 0},
				{time = 2400, x = 48, y = 64, w = 377, h = 408, a = 0, angle = 0},
			}},

			{id = "hub-ring", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 37, y = 276, w = 395, h = 410, a = 255, angle = 0},
				{time = 400, x = -553, y = -332, w = 1580, h = 1640, a = 0, angle = 0},
			}},
			{id = "hub-ring", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 0, x = 37, y = 276, w = 395, h = 410, a = 255, angle = 0},
				{time = 600, x = -165, y = 67, w = 790, h = 820, a = 0, angle = 0},
			}},

			{id = "hub-bar1-1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 375, x = -42, y = -39, w = 107, h = 121, a = 0, angle = 0},
				{time = 575, x = 49, y = 17, w = 107, h = 121, a = 155, angle = 0},
				{time = 1700, x = 49, y = 17, w = 107, h = 121, a = 155, angle = 0},
				{time = 1750, x = 49, y = 17, w = 107, h = 121, a = 0, angle = 0},
				{time = 1800, x = 49, y = 17, w = 107, h = 121, a = 155, angle = 0},
				{time = 1850, x = 49, y = 17, w = 107, h = 121, a = 0, angle = 0},
			}},
			{id = "hub-bar1-2", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 425, x = -117, y = -124, w = 180, h = 183, a = 0, angle = 0},
				{time = 575, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
				{time = 1250, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
				{time = 1300, x = 49, y = 51, w = 180, h = 183, a = 0, angle = 0},
				{time = 1350, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
				{time = 1400, x = 49, y = 51, w = 180, h = 183, a = 0, angle = 0},
				{time = 1450, x = 49, y = 51, w = 180, h = 183, a = 155, angle = 0},
				{time = 1500, x = 49, y = 51, w = 180, h = 183, a = 0, angle = 0},
			}},
			{id = "hub-bar2-1", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 350, x = -101, y = -1, w = 176, h = 200, a = 0, angle = 0},
				{time = 550, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
				{time = 700, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
				{time = 1350, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
				{time = 1400, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
				{time = 1450, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
				{time = 1550, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
				{time = 1600, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
				{time = 1700, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
				{time = 1750, x = 49, y = 125, w = 176, h = 200, a = 155, angle = 0},
				{time = 1800, x = 49, y = 125, w = 176, h = 200, a = 0, angle = 0},
			}},
			{id = "hub-bar2-2", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 300, x = -756, y = -54, w = 295, h = 298, a = 0, angle = 0},
				{time = 500, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
				{time = 1000, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
				{time = 1050, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
				{time = 1100, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
				{time = 1150, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
				{time = 1200, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
				{time = 1250, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
				{time = 1300, x = 49, y = 181, w = 295, h = 298, a = 155, angle = 0},
				{time = 1350, x = 49, y = 181, w = 295, h = 298, a = 0, angle = 0},
			}},

			{id = "hub-full", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 500, x = 207, y = -119, w = 120, h = 138, a = 0, angle = 0},
				{time = 600, x = 106, y = 141, w = 120, h = 138, a = 255, angle = 0},
				{time = 1300, x = 106, y = 141, w = 120, h = 138, a = 255, angle = 0},
				{time = 1400, x = -96, y = -119, w = 120, h = 138, a = 0, angle = 0},
			}},
			{id = "hub-combo", filter = 1, blend = 1, loop = -1, timer = 48, dst = {
				{time = 600, x = 365, y = 432, w = 210, h = 210, a = 0, angle = 0},
				{time = 700, x = 71, y = 187, w = 210, h = 210, a = 255, angle = 0},
				{time = 1350, x = 71, y = 187, w = 210, h = 210, a = 255, angle = 0},
				{time = 1450, x = 365, y = 432, w = 210, h = 210, a = 0, angle = 0},
			}},
			{id = "hub-full", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 800, x = 106, y = 141, w = 120, h = 138, a = 0, angle = 0},
				{time = 900, x = 106, y = 141, w = 120, h = 138, a = 255, angle = 0},
				{time = 1000, x = 106, y = 141, w = 120, h = 138, a = 0, angle = 0},
			}},
			{id = "hub-combo", filter = 1, blend = 2, loop = -1, timer = 48, dst = {
				{time = 900, x = 71, y = 187, w = 210, h = 210, a = 0, angle = 0},
				{time = 1000, x = 71, y = 187, w = 210, h = 210, a = 255, angle = 0},
				{time = 1100, x = 71, y = 187, w = 210, h = 210, a = 0, angle = 0},
			}}
		}
		-- LR2スキンy座標の反転
		for i1 = 1, #dp_dst do
			for i2 = 1, #dp_dst[i1].dst do
				dp_dst[i1].dst[i2].y = 720 - (dp_dst[i1].dst[i2].y + dp_dst[i1].dst[i2].h) 
			end
		end
		
		local offset = {}
		-- レーンサイズに合わせて拡縮
		offset.size2 = lanes.w2 / dp_dst[1].dst[1].w
		for i1 = 1, #dp_dst do
			for i2 = 1, #dp_dst[i1].dst do
				dp_dst[i1].dst[i2].w = dp_dst[i1].dst[i2].w * offset.size2
				dp_dst[i1].dst[i2].h = dp_dst[i1].dst[i2].h * offset.size2
				dp_dst[i1].dst[i2].x = dp_dst[i1].dst[i2].x * offset.size2
				dp_dst[i1].dst[i2].y = dp_dst[i1].dst[i2].y * offset.size2
			end
		end
		
		-- 座標を合わせる
		offset.x2 = lanes.x2 - dp_dst[1].dst[1].x
		offset.y2 = lanes.y - (238 * offset.size2)
		offset.h2 = (1080 - lanes.y) / (482 * offset.size2)
		for i1 = 1, #dp_dst do
			for i2 = 1, #dp_dst[i1].dst do
				dp_dst[i1].dst[i2].x = dp_dst[i1].dst[i2].x + offset.x2
				dp_dst[i1].dst[i2].y = dp_dst[i1].dst[i2].y + offset.y2
			end
		end
		
		-- main画像をレーンサイズに拡大
		dp_dst[1].dst[1].h = dp_dst[1].dst[1].h * offset.h2
		dp_dst[1].dst[2].h = dp_dst[1].dst[2].h * offset.h2
		dp_dst[2].dst[1].h = dp_dst[2].dst[1].h * offset.h2
		dp_dst[2].dst[2].h = dp_dst[2].dst[2].h * offset.h2
		dp_dst[3].dst[1].h = dp_dst[3].dst[1].h * offset.h2
		dp_dst[3].dst[2].h = dp_dst[3].dst[2].h * offset.h2
		
		for i, v in pairs(dp_dst) do
			table.insert(parts.destination, v)
		end
		
	end
	
	return parts
	
end

return {
	parts = parts,
	load = load
}
local init = {}

init.skin = {
	source				= {},
	font				= {},
	image				= {},
	imageset			= {},
	value				= {},
	text				= {},
	slider				= {},
	hiddenCover			= {},
	liftCover			= {},
	graph				= {},
	hiterrorvisualizer	= {},
	timingvisualizer	= {},
	judgegraph			= {},
	bpmgraph			= {},
	note = {
		id			= "",
		note		= {},
		lnend		= {},
		lnstart		= {},
		lnbody		= {},
		lnactive	= {},
		hcnend		= {},
		hcnstart	= {},
		hcnbody		= {},
		hcnactive	= {},
		hcndamage	= {},
		hcnreactive	= {},
		mine		= {},
		hidden		= {},
		processed	= {},
		size		= {},
		dst			= {},
		group		= {},
		time		= {},
		bpm			= {},
		stop		= {}
	},
	gauge = {
		nodes = {}
	},
	judge			= {},
	bga				= {},
	pmchara			= {},
	customEvents	= {},
	customTimers	= {},
	destination		= {}
}

init.settings = {
	lane = {
		lane		= {x = {{}, {}}, y = {}, order = {}, w = {}},
		notes		= {x = {{}, {}}, w = {}, h = {}},
		line		= {x = {{}, {}}},
		outline		= {x = {{}, {}}},
		keybeam		= {on = {x = {{}, {}}, w = {{}, {}}}, off = {x = {{}, {}}, w = {{}, {}}}},
		center_x	= {{}, {}}
	},
	lanes = {
		x			= {},
		y			= {},
		w			= {},
		h			= {},
		inside		= {x = {}, y = {}, w = {}, h = {}},
		center_x	= {},
		right_x		= {},
		background	= {},
		barline		= {},
		glow		= {},
		judgeline	= {},
		bomb		= {},
		judge		= {x = {}, y = {}},
		ghost		= {x = {}, y = {}},
		judgedetail	= {x = {}, y = {}}
	
	},
	frame = {
		background			= {},
		bga					= {},
		gauge				= {},
		songprogress		= {},
		songinfo			= {},
		bpm					= {},
		score				= {},
		scorerate			= {},
		diffbest			= {},
		difftarget			= {},
		maxcombo			= {},
		graph				= {},
		judgecount			= {},
		timeleft			= {},
		rankpace			= {},
		mascot				= {},
		movingmascot		= {},
		pmchara				= {},
		timingvisualizer	= {},
		hiterrorvisualizer	= {},
		judgegraph			= {},
		bpmgraph			= {}
	}
}

return init
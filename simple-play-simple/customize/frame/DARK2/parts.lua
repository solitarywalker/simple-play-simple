local parts = {}

local function load(g)
	
	parts.source = {}
	
	parts.font = {}
	
	parts.image = {}
	
	parts.imageset = {}
	
	parts.value = {}
	
	parts.text = {}
	
	parts.slider = {}
	
	parts.graph = {}
	
	parts.hiterrorvisualizer = {}
	
	parts.timingvisualizer = {}
	
	parts.judgegraph = {}
	
	parts.bpmgraph = {}
	
	parts.customEvents = {}
	
	parts.customTimers = {}
	
	parts.destination = {
		-- 背景
		--{id = "sps-background"},
		
		-- 拡張機能(背面)
		{id = "sps-extension1"},
		{id = "sps-extension2"},
		{id = "sps-extension3"},
		{id = "sps-extension4"},
		{id = "sps-extension5"},
		
		-- BGA
		--{id = "sps-bga"},
		
		-- フレーム関連
		--{id = "sps-device"},
		{id = "sps-gauge"},
		--{id = "sps-scoregraph"},
		--{id = "sps-songprogress"},
		--{id = "sps-mascot"}, -- 動くマスコットとぽみゅキャラもここに入ってます
		--{id = "sps-songinfo"},
		--{id = "sps-bpm"},
		--{id = "sps-score"},
		--{id = "sps-scorerate"},
		--{id = "sps-maxcombo"},
		--{id = "sps-diffbest"},
		--{id = "sps-difftarget"},
		--{id = "sps-rankpace"},
		--{id = "sps-judgecount"},
		--{id = "sps-timeleft"},
		
		-- プレイエリア
		--{id = "sps-lanebackground"},
		--{id = "sps-lane"},
		--{id = "sps-glow"},
		{id = "sps-judgeline"},
		--{id = "sps-keybeam"},
		{id = "sps-notes"}, -- 必須
		--{id = "sps-cover"},
		--{id = "sps-coverduration"},
		{id = "sps-bomb"},
		{id = "sps-judge"},
		--{id = "sps-judgedetail"},
		--{id = "sps-ghost"},
		
		--{id = "sps-timingvisualizer"},
		--{id = "sps-hiterrorvisualizer"},
		--{id = "sps-judgegraph"},
		--{id = "sps-bpmgraph"},
		
		-- 拡張機能(前面)
		{id = "sps-extension6"},
		{id = "sps-extension7"},
		{id = "sps-extension8"},
		{id = "sps-extension9"},
		{id = "sps-extension10"},
		
		-- 演出
		--{id = "sps-loading"},
		--{id = "sps-start"},
		--{id = "sps-clear"},
		--{id = "sps-fullcombo"},
		--{id = "sps-failed"},
		--{id = "sps-close"}
	}
	
	return parts
	
end

return {
	parts = parts,
	load = load
}

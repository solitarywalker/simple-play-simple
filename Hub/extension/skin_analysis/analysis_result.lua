-- skin.property ------------------------------------
{name = スキン構成の保存 SaveSkinConfig, {name = OFF, op = {op = 900, },
{name = ON, op = {op = 901, },
def = OFF, category = スキン構成の保存 SaveSkinConfig, },

{name = エラーメッセージ表示 DisplayErrorMessage, {name = OFF, op = {op = 902, },
{name = ON, op = {op = 903, },
def = ON, category = エラーメッセージ表示 DisplayErrorMessage, },

{name = 画面解像度 Resolution, {name = 4K(3840x2160), op = {op = 904, },
{name = WQHD(2560x1440), op = {op = 905, },
{name = FHD(1920x1080), op = {op = 906, },
{name = HD(1280x720), op = {op = 907, },
{name = XGA(1024x768), op = {op = 908, },
{name = SVGA(800x600), op = {op = 909, },
{name = VGA(640x480), op = {op = 910, },
def = FHD(1920x1080), category = 画面解像度 Resolution, },

{name = 判定文字の置換(Hub), {name = OFF, op = {op = 911, },
{name = ModernChic規格, op = {op = 923, },
{name = GenericTheme規格, op = {op = 927, },
{name = TYPE-M規格, op = {op = 931, },
{name = Rogan規格, op = {op = 935, },
{name = SocialSkin規格, op = {op = 939, },
{name = hij_simple規格, op = {op = 943, },
{name = OADX+規格(4:3), op = {op = 947, },
{name = OADX+規格(16:9), op = {op = 948, },
{name = W-mix規格(Wide), op = {op = 956, },
{name = W-mix規格(AC), op = {op = 957, },
def = ModernChic規格, category = 判定文字の置換(Hub), },

{name = ノーツの置換(Hub), {name = OFF, op = {op = 912, },
{name = ModernChic規格, op = {op = 924, },
{name = GenericTheme規格, op = {op = 928, },
{name = TYPE-M規格, op = {op = 932, },
{name = Rogan規格, op = {op = 936, },
{name = SocialSkin規格, op = {op = 940, },
{name = OADX+規格(AC), op = {op = 949, },
{name = OADX+規格(ACWide), op = {op = 950, },
{name = OADX+規格(CS), op = {op = 951, },
{name = OADX+規格(CSWide), op = {op = 952, },
{name = W-mix規格(Wide), op = {op = 958, },
{name = W-mix規格(AC), op = {op = 959, },
def = OFF, category = ノーツの置換(Hub), },

{name = ボムの置換(Hub), {name = OFF, op = {op = 913, },
{name = ModernChic規格, op = {op = 925, },
{name = GenericTheme規格, op = {op = 929, },
{name = TYPE-M規格, op = {op = 933, },
{name = Rogan規格, op = {op = 937, },
{name = SocialSkin規格, op = {op = 941, },
{name = OADX+規格(4:3), op = {op = 953, },
{name = OADX+規格(16:9), op = {op = 954, },
def = OFF, category = ボムの置換(Hub), },

{name = フルコンボエフェクトの置換(Hub), {name = OFF, op = {op = 914, },
{name = ModernChic規格, op = {op = 926, },
{name = GenericTheme規格, op = {op = 930, },
{name = TYPE-M規格, op = {op = 934, },
{name = OADX+規格(NORMAL), op = {op = 955, },
{name = W-mix規格, op = {op = 961, },
def = OFF, category = フルコンボエフェクトの置換(Hub), },

{name = SUDDENカバーの置換(Hub), {name = OFF, op = {op = 915, },
{name = ON, op = {op = 919, },
def = OFF, category = SUDDENカバーの置換(Hub), },

{name = HIDDENカバーの置換(Hub), {name = OFF, op = {op = 916, },
{name = ON, op = {op = 920, },
def = OFF, category = HIDDENカバーの置換(Hub), },

{name = LIFTカバーの置換(Hub), {name = OFF, op = {op = 917, },
{name = ON, op = {op = 921, },
def = OFF, category = LIFTカバーの置換(Hub), },

{name = FINISHカバーの置換(Hub), {name = OFF, op = {op = 918, },
{name = ON, op = {op = 922, },
def = OFF, category = FINISHカバーの置換(Hub), }



-- skin.offset ------------------------------------
{id = 68, key = settings_extension, name = -- 拡張機能 --, category = -- 拡張機能 --, },

{id = 68, key = settings_hub, name = -- Hub設定 --, category = -- Hub設定 --, },

{id = 68, key = settings_modernchic, name = -- ModernChic設定 --, category = -- ModernChic設定 --, },

{x = true, name = ModernChicボム表示倍率(Hub)(%), key = offset_bomb_modernchic, category = ModernChicボム表示倍率(Hub)(%), id = 52, },

{x = true, name = ModernChic判定文字表示倍率(Hub)(%), key = offset_judge_modernchic, category = ModernChic判定文字表示倍率(Hub)(%), id = 60, },

{id = 68, key = settings_generictheme, name = -- GenericTheme設定 --, category = -- GenericTheme設定 --, },

{x = true, name = GenericThemeボム表示倍率(Hub)(%), key = offset_bomb_generictheme, category = GenericThemeボム表示倍率(Hub)(%), id = 53, },

{x = true, name = GenericTheme判定文字表示倍率(Hub)(%), key = offset_judge_generictheme, category = GenericTheme判定文字表示倍率(Hub)(%), id = 61, },

{id = 68, key = settings_type_m, name = -- TYPE-M設定 --, category = -- TYPE-M設定 --, },

{x = true, name = TYPE-Mボム表示倍率(Hub)(%), key = offset_bomb_type_m, category = TYPE-Mボム表示倍率(Hub)(%), id = 54, },

{x = true, name = TYPE-M判定文字表示倍率(Hub)(%), key = offset_judge_type_m, category = TYPE-M判定文字表示倍率(Hub)(%), id = 62, },

{id = 68, key = settings_rogan, name = -- Rogan設定 --, category = -- Rogan設定 --, },

{x = true, name = Roganボム表示倍率(Hub)(%), key = offset_bomb_rogan, category = Roganボム表示倍率(Hub)(%), id = 55, },

{x = true, name = Rogan判定文字表示倍率(Hub)(%), key = offset_judge_rogan, category = Rogan判定文字表示倍率(Hub)(%), id = 63, },

{id = 68, key = settings_socialskin, name = -- SocialSkin設定 --, category = -- SocialSkin設定 --, },

{x = true, name = SocialSkinボム表示倍率(Hub)(%), key = offset_bomb_socialskin, category = SocialSkinボム表示倍率(Hub)(%), id = 56, },

{x = true, name = SocialSkin判定文字表示倍率(Hub)(%), key = offset_judge_socialskin, category = SocialSkin判定文字表示倍率(Hub)(%), id = 64, },

{id = 68, key = settings_hij_simple, name = -- hij_simple設定 --, category = -- hij_simple設定 --, },

{x = true, name = hij_simple判定文字表示倍率(Hub)(%), key = offset_judge_hij_simple, category = hij_simple判定文字表示倍率(Hub)(%), id = 65, },

{id = 68, key = settings_oadx+, name = -- OADX+設定 --, category = -- OADX+設定 --, },

{x = true, name = OADX+ボム表示倍率(Hub)(%), key = offset_bomb_oadx+, category = OADX+ボム表示倍率(Hub)(%), id = 58, },

{x = true, name = OADX+判定文字表示倍率(Hub)(%), key = offset_judge_oadx+, category = OADX+判定文字表示倍率(Hub)(%), id = 66, },

{id = 68, key = settings_W-mix, name = -- W-mix設定 --, category = -- W-mix設定 --, },

{x = true, name = W-mix判定文字表示倍率(Hub)(%), key = offset_judge_W-mix, category = W-mix判定文字表示倍率(Hub)(%), id = 67, }



-- skin.filepath ------------------------------------
{path = "../customize/settings/14keys/*", name = 設定ファイル Settings, def = default.lua, category = 設定ファイル Settings, },

{path = "../customize/font/*.ttf", name = システムフォント Font, def = mgenplus-1c-bold.ttf, category = システムフォント Font, },

{path = "../customize/frame/*", name = フレーム Frame, def = default, category = フレーム Frame, },

{path = "../customize/background/*", name = 背景 Background, def = default.png, category = 背景 Background, },

{path = "../customize/bga/*", name = 汎用BGA/BGI NoBgaImage, def = default.png, category = 汎用BGA/BGI NoBgaImage, },

{path = "../customize/device/*", name = 鍵盤デザイン Device, def = default, category = 鍵盤デザイン Device, },

{path = "../customize/gauge/*", name = グルーブゲージ GrooveGauge, def = default, category = グルーブゲージ GrooveGauge, },

{path = "../customize/scoregraph/*", name = スコアグラフ ScoreGraph, def = default_1p, category = スコアグラフ ScoreGraph, },

{path = "../customize/songprogress/*", name = ソングプログレスバー SongProgress, def = aqua, category = ソングプログレスバー SongProgress, },

{path = "../customize/songinfo/*", name = 楽曲情報 SongInfo, def = default, category = 楽曲情報 SongInfo, },

{path = "../customize/bpm/*", name = BPM Bpm, def = default, category = BPM Bpm, },

{path = "../customize/score/*", name = スコア Score, def = default, category = スコア Score, },

{path = "../customize/scorerate/*", name = スコアレート ScoreRate, def = default, category = スコアレート ScoreRate, },

{path = "../customize/maxcombo/*", name = MAXコンボ MaxCombo, def = default, category = MAXコンボ MaxCombo, },

{path = "../customize/diffbest/*", name = 自己ベストスコア差 DiffBestScore, def = default, category = 自己ベストスコア差 DiffBestScore, },

{path = "../customize/difftarget/*", name = ターゲットスコア差 DiffTargetScore, def = default, category = ターゲットスコア差 DiffTargetScore, },

{path = "../customize/rankpace/*", name = ランクペース RankPace, def = default, category = ランクペース RankPace, },

{path = "../customize/judgecount/*", name = ジャッジカウント JudgeCount, def = default, category = ジャッジカウント JudgeCount, },

{path = "../customize/timeleft/*", name = タイムレフト TimeLeft, def = default, category = タイムレフト TimeLeft, },

{path = "../customize/mascot/*", name = マスコット Mascot, def = off.png, category = マスコット Mascot, },

{path = "../customize/movingmascot/*", name = 動くマスコット MovingMascot, def = off.png, category = 動くマスコット MovingMascot, },

{path = "../customize/pmchara/*", name = ぽみゅキャラ Pmchara, def = off, category = ぽみゅキャラ Pmchara, },

{path = "../customize/timingvisualizer/*", name = タイミングビジュアライザ TimingVisualizer, def = off, category = タイミングビジュアライザ TimingVisualizer, },

{path = "../customize/hiterrorvisualizer/*", name = ヒットエラービジュアライザ HitErrorVisualizer, def = off, category = ヒットエラービジュアライザ HitErrorVisualizer, },

{path = "../customize/judgegraph/*", name = ジャッジグラフ JudgeGraph, def = off, category = ジャッジグラフ JudgeGraph, },

{path = "../customize/bpmgraph/*", name = BPMグラフ BpmGraph, def = off, category = BPMグラフ BpmGraph, },

{path = "../customize/lanebackground/*", name = レーン背景 LaneBackground, def = default.png, category = レーン背景 LaneBackground, },

{path = "../customize/lane/*", name = レーン Lane, def = beat, category = レーン Lane, },

{path = "../customize/glow/*", name = グロー Glow, def = aqua, category = グロー Glow, },

{path = "../customize/judgeline/*", name = 判定ライン JudgeLine, def = red, category = 判定ライン JudgeLine, },

{path = "../customize/notes/*", name = ノーツ notes, def = simple, category = ノーツ notes, },

{path = "../customize/keybeam/*", name = キービーム Keybeam, def = default, category = キービーム Keybeam, },

{path = "../customize/cover/lane/*|1|", name = レーンカバー1P LaneCover1P, def = default.png, category = レーンカバー1P LaneCover1P, },

{path = "../customize/cover/lift/*|1|", name = リフトカバー1P LiftCover1P, def = default.png, category = リフトカバー1P LiftCover1P, },

{path = "../customize/cover/hidden/*|1|", name = HIDDENカバー1P HiddenCover1P, def = default.png, category = HIDDENカバー1P HiddenCover1P, },

{path = "../customize/cover/finish/*|1|", name = フィニッシュカバー1P FinishCover1P, def = default.png, category = フィニッシュカバー1P FinishCover1P, },

{path = "../customize/coverduration/*", name = カバー数値 CoverDuration, def = default, category = カバー数値 CoverDuration, },

{path = "../customize/bomb/*", name = ボム Bomb, def = photonring, category = ボム Bomb, },

{path = "../customize/judge/*", name = 判定文字 Judge, def = default2, category = 判定文字 Judge, },

{path = "../customize/judgedetail/*", name = 判定タイミング JudgeDetail, def = default-fastslow, category = 判定タイミング JudgeDetail, },

{path = "../customize/ghost/*", name = ゴーストスコア GhostScore, def = default-target, category = ゴーストスコア GhostScore, },

{path = "../customize/effect/loading/*", name = ロード中演出 Loading, def = default, category = ロード中演出 Loading, },

{path = "../customize/effect/start/*", name = 開始演出 Start, def = default, category = 開始演出 Start, },

{path = "../customize/effect/clear/*", name = クリア演出 Clear, def = off, category = クリア演出 Clear, },

{path = "../customize/effect/fullcombo/*", name = フルコンボ演出 FullCombo, def = default, category = フルコンボ演出 FullCombo, },

{path = "../customize/effect/failed/*", name = 閉店演出 Failed, def = default, category = 閉店演出 Failed, },

{path = "../customize/effect/close/*", name = 終了演出 Close, def = default, category = 終了演出 Close, },

{path = "../customize/extension/*|1|", name = 拡張機能1 Extension1, def = DPデフォルト用フレーム(仮), category = 拡張機能1 Extension1, },

{path = "../customize/extension/*|2|", name = 拡張機能2 Extension2, def = off, category = 拡張機能2 Extension2, },

{path = "../customize/extension/*|3|", name = 拡張機能3 Extension3, def = off, category = 拡張機能3 Extension3, },

{path = "../customize/extension/*|4|", name = 拡張機能4 Extension4, def = off, category = 拡張機能4 Extension4, },

{path = "../customize/extension/*|5|", name = 拡張機能5 Extension5, def = off, category = 拡張機能5 Extension5, },

{path = "../customize/extension/*|6|", name = 拡張機能6 Extension6, def = off, category = 拡張機能6 Extension6, },

{path = "../customize/extension/*|7|", name = 拡張機能7 Extension7, def = off, category = 拡張機能7 Extension7, },

{path = "../customize/extension/*|8|", name = 拡張機能8 Extension8, def = off, category = 拡張機能8 Extension8, },

{path = "../customize/extension/*|9|", name = 拡張機能9 Extension9, def = off, category = 拡張機能9 Extension9, },

{path = "../customize/extension/*|10|", name = 拡張機能10 Extension10, def = 残りノーツ数表示, category = 拡張機能10 Extension10, },

{path = "../customize/cover/lane/*|2|", name = レーンカバー2P LaneCover2P, def = default.png, category = レーンカバー2P LaneCover2P, },

{path = "../customize/cover/lift/*|2|", name = リフトカバー2P LiftCover2P, def = default.png, category = リフトカバー2P LiftCover2P, },

{path = "../customize/cover/hidden/*|2|", name = HIDDENカバー2P HiddenCover2P, def = default.png, category = HIDDENカバー2P HiddenCover2P, },

{path = "../customize/cover/finish/*|2|", name = フィニッシュカバー2P FinishCover2P, def = default.png, category = フィニッシュカバー2P FinishCover2P, },

{path = "../../Hub/parts/Hub/cover/*.png|1|", name = SUDDENカバー(Hub), category = SUDDENカバー(Hub), def = cp_wizardcloak.png, },

{path = "../../Hub/parts/Hub/cover/*.png|2|", name = HIDDENカバー(Hub), category = HIDDENカバー(Hub), def = cp_wizardcloak.png, },

{path = "../../Hub/parts/Hub/cover/*.png|3|", name = LIFTカバー(Hub), category = LIFTカバー(Hub), def = cp_wizardcloak.png, },

{path = "../../Hub/parts/Hub/cover/*.png|4|", name = FINISHカバー(Hub), category = FINISHカバー(Hub), def = cp_wizardcloak.png, },

{path = "../../Hub/extension/*|1|", name = スロット1(Hub), def = メトロノーム, category = スロット1(Hub), },

{path = "../../Hub/extension/*|2|", name = スロット2(Hub), def = 打鍵音, category = スロット2(Hub), },

{path = "../../Hub/extension/*|3|", name = スロット3(Hub), def = off, category = スロット3(Hub), },

{path = "../../Hub/extension/*|4|", name = スロット4(Hub), def = off, category = スロット4(Hub), },

{path = "../../Hub/extension/*|5|", name = スロット5(Hub), def = off, category = スロット5(Hub), },

{path = "../../Hub/extension/*|6|", name = スロット6(Hub), def = off, category = スロット6(Hub), },

{path = "../../Hub/extension/*|7|", name = スロット7(Hub), def = off, category = スロット7(Hub), },

{path = "../../Hub/extension/*|8|", name = スロット8(Hub), def = off, category = スロット8(Hub), },

{path = "../../Hub/extension/*|9|", name = スロット9(Hub), def = off, category = スロット9(Hub), },

{path = "../../Hub/extension/*|10|", name = スロット10(Hub), def = log, category = スロット10(Hub), },

{path = "../../ModernChic/Play/parts/common/judge/*.png|82|", name = ModernChic判定文字(Hub), category = ModernChic判定文字(Hub), def = Cybanin3000.png, },

{path = "../../ModernChic/Play/parts/common/notes/*.png|82|", name = ModernChicノーツ(Hub), category = ModernChicノーツ(Hub), def = #default.png, },

{path = "../../ModernChic/Play/parts/common/mine/*.png|82|", name = ModernChicマイン(Hub), category = ModernChicマイン(Hub), def = #default.png, },

{path = "../../ModernChic/Play/parts/common/bomb/*.png|82|", name = ModernChicボム(Hub), category = ModernChicボム(Hub), def = clear ring_blue SCUROed..png, },

{path = "../../ModernChic/Play/parts/common/fullcombo/*.png|82|", name = ModernChicフルコンボエフェクト(Hub), category = ModernChicフルコンボエフェクト(Hub), def = #default.png, },

{path = "../../GenericTheme-master/play/customize/judge/*.png|82|", name = GenericTheme判定文字(Hub), def = gridgazer.png, category = GenericTheme判定文字(Hub), },

{path = "../../GenericTheme-master/play/customize/notes/*.png|82|", name = GenericThemeノーツ(Hub), def = default.png, category = GenericThemeノーツ(Hub), },

{path = "../../GenericTheme-master/play/customize/mine/*.png|82|", name = GenericThemeマイン(Hub), def = red.png, category = GenericThemeマイン(Hub), },

{path = "../../GenericTheme-master/play/customize/bomb/*.png|82|", name = GenericThemeボム(Hub), def = explosion.png, category = GenericThemeボム(Hub), },

{path = "../../TYPE-M/play/judge/*.png|82|", name = TYPE-M判定文字(Hub), def = default.png, category = TYPE-M判定文字(Hub), },

{path = "../../TYPE-M/play/notes/*.png|82|", name = TYPE-Mノーツ(Hub), def = default.png, category = TYPE-Mノーツ(Hub), },

{path = "../../TYPE-M/play/bomb/*.png|82|", name = TYPE-Mボム(Hub), def = Type_M.png, category = TYPE-Mボム(Hub), },

{path = "../../TYPE-M/play/fullcombo/*.png|82|", name = TYPE-Mフルコンボエフェクト(Hub), def = #Default.png, category = TYPE-Mフルコンボエフェクト(Hub), },

{path = "../../Rogan/play/parts/judge/*.png|82|", name = Rogan判定文字(Hub), def = default.png, category = Rogan判定文字(Hub), },

{path = "../../Rogan/play/parts/notes/*.png|82|", name = Roganノーツ(Hub), def = simple.png, category = Roganノーツ(Hub), },

{path = "../../Rogan/play/parts/bomb/*.png|82|", name = Roganボム(Hub), def = default.png, category = Roganボム(Hub), },

{path = "../../SocialSkin/play/parts/judges/*.png|82|", name = SocialSkin判定文字(Hub), def = default.png, category = SocialSkin判定文字(Hub), },

{path = "../../SocialSkin/play/parts/lane/notes/normal/*.png|82|", name = SocialSkinノーツ normal(Hub), def = default.png, category = SocialSkinノーツ normal(Hub), },

{path = "../../SocialSkin/play/parts/bombs/animation1/*.png|82|", name = SocialSkinボム animation1(Hub), def = default.png, category = SocialSkinボム animation1(Hub), },

{path = "../../SocialSkin/play/parts/bombs/wave1/*.png|82|", name = SocialSkinボム wave1(Hub), def = default.png, category = SocialSkinボム wave1(Hub), },

{path = "../../SocialSkin/play/parts/bombs/particle1/*.png|82|", name = SocialSkinボム particle1(Hub), def = default.png, category = SocialSkinボム particle1(Hub), },

{path = "../../SocialSkin/play/parts/bombs/animation2/*.png|82|", name = SocialSkinボム animation2(Hub), def = blank.png, category = SocialSkinボム animation2(Hub), },

{path = "../../SocialSkin/play/parts/bombs/wave2/*.png|82|", name = SocialSkinボム wave2(Hub), def = blank.png, category = SocialSkinボム wave2(Hub), },

{path = "../../SocialSkin/play/parts/bombs/particle2/*.png|82|", name = SocialSkinボム particle2(Hub), def = default.png, category = SocialSkinボム particle2(Hub), },

{path = "../../hij_simple/play/judge/*.png|82|", name = hij_simple判定文字(Hub), def = original.png, category = hij_simple判定文字(Hub), },

{path = "../../Hub/parts/OA_DX+/judge/*.png|82|", name = OADX+判定文字(Hub), category = OADX+判定文字(Hub), def = off.png, },

{path = "../../Hub/parts/OA_DX+/notes/*.png|821|", name = OADX+ノーツ(Hub), category = OADX+ノーツ(Hub), def = off.png, },

{path = "../../Hub/parts/OA_DX+/notes/*.png|822|", name = OADX+ヘルチャージノーツ(Hub), category = OADX+ヘルチャージノーツ(Hub), def = off.png, },

{path = "../../Hub/parts/OA_DX+/bomb/*.png|82|", name = OADX+ボム(Hub), category = OADX+ボム(Hub), def = off.png, },

{path = "../../Hub/parts/OA_DX+/fullcombo/*.png|82|", name = OADX+フルコンボエフェクト(Hub), category = OADX+フルコンボエフェクト(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/judge/*.png|82|", name = W-mix判定文字 Wide(Hub), category = W-mix判定文字 Wide(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/judge/ac/*.png|82|", name = W-mix判定文字 AC(Hub), category = W-mix判定文字 AC(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/note/*.png|821|", name = W-mixノーツ Wide(Hub), category = W-mixノーツ Wide(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/note/*.png|822|", name = W-mixヘルチャージノーツ Wide(Hub), category = W-mixヘルチャージノーツ Wide(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/note/ac/*.png|821|", name = W-mixノーツ AC(Hub), category = W-mixノーツ AC(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/note/ac/*.png|822|", name = W-mixヘルチャージノーツ AC(Hub), category = W-mixヘルチャージノーツ AC(Hub), def = off.png, },

{path = "../../Hub/parts/WMIX_HD/fc/*.png|82|", name = W-mixフルコンボエフェクト(Hub), category = W-mixフルコンボエフェクト(Hub), def = off.png, }



-- skin.source ------------------------------------
{id = "src-background", path = "../customize/background/*", },

{id = "src-ex-rate", path = "../customize/extension/判定下レート表示/parts.png", },

{id = "src-ex-dpframe", path = "../customize/extension/DPデフォルト用フレーム(仮)/dpframe.png", },

{id = "src-ex-bgaframe", path = "../customize/extension/BGA枠表示/parts.png", },

{id = "ex-notes-count", path = "../customize/extension/残りノーツ数表示/num.png", },

{id = "src-nobgaimage", path = "../customize/bga/*", },

{id = "src-key-w", path = "../customize/device/*/W.png", },

{id = "src-key-b", path = "../customize/device/*/B.png", },

{id = "src-key-wf", path = "../customize/device/*/WF.png", },

{id = "src-key-bf", path = "../customize/device/*/BF.png", },

{id = "src-sc-base", path = "../customize/device/*/TABLE_BASE.png", },

{id = "src-sc-table", path = "../customize/device/*/TABLE.png", },

{id = "src-sc-record", path = "../customize/device/*/RECORD.png", },

{id = "src-gauge", path = "../customize/gauge/remi-s2/gauge.png", },

{id = "src-number-gauge", path = "../customize/gauge/remi-s2/num.png", },

{id = "src-scoregraph", path = "../customize/scoregraph/CS_1P/parts.png", },

{id = "src-progress", path = "../customize/songprogress/*/parts.png", },

{id = "src-mascot", path = "../customize/mascot/*", },

{id = "src-movingmascot", path = "../customize/movingmascot/*", },

{id = "src-pomyu1p", path = "../customize/pmchara/*", },

{id = "src-bpm", path = "../customize/bpm/default/bpm.png", },

{id = "src-score", path = "../customize/score/*/parts.png", },

{id = "src-scorerate", path = "../customize/scorerate/*/parts.png", },

{id = "src-maxcombo", path = "../customize/maxcombo/*/parts.png", },

{id = "src-difftarget", path = "../customize/difftarget/*/parts.png", },

{id = "src-lanebackground", path = "../customize/lanebackground/*", },

{id = "src-glow", path = "../customize/glow/*/parts.png", },

{id = "src-notes-s", path = "../customize/notes/*/0.png", },

{id = "src-notes-1", path = "../customize/notes/*/1.png", },

{id = "src-notes-2", path = "../customize/notes/*/2.png", },

{id = "src-notes-3", path = "../customize/notes/*/3.png", },

{id = "src-notes-4", path = "../customize/notes/*/4.png", },

{id = "src-notes-5", path = "../customize/notes/*/5.png", },

{id = "src-notes-6", path = "../customize/notes/*/6.png", },

{id = "src-notes-7", path = "../customize/notes/*/7.png", },

{id = "src-notes-8", path = "../customize/notes/*/8.png", },

{id = "src-notes-9", path = "../customize/notes/*/9.png", },

{id = "src-barline", path = "../customize/notes/*/barline.png", },

{id = "src-lanecover1", path = "../customize/cover/lane/*|1|", },

{id = "src-lanecover2", path = "../customize/cover/lane/*|2|", },

{id = "src-liftcover1", path = "../customize/cover/lift/*|1|", },

{id = "src-liftcover2", path = "../customize/cover/lift/*|2|", },

{id = "src-hiddencover1", path = "../customize/cover/hidden/*|1|", },

{id = "src-hiddencover2", path = "../customize/cover/hidden/*|2|", },

{id = "src-finishcover1", path = "../customize/cover/finish/*|1|", },

{id = "src-finishcover2", path = "../customize/cover/finish/*|2|", },

{id = "src-duration", path = "../customize/coverduration/*/DURATION.png", },

{id = "src-bomb-dummy", path = "../customize/bomb/*/dummy.png", },

{id = "src-bomb", path = "../customize/bomb/*/BOMB.png", },

{id = "src-ghost", path = "../customize/ghost/*/GHOST.png", },

{id = "src-ex-rate", path = "../customize/extension/判定下レート表示/parts.png", },

{id = "src-ex-bgaframe", path = "../customize/extension/BGA枠表示/parts.png", },

{id = "src-ex-dpframe", path = "../customize/extension/DPデフォルト用フレーム(仮)/dpframe.png", },

{id = "src-ex-rate", path = "../customize/extension/判定下レート表示/parts.png", },

{id = "src-judgerank", path = "../customize/effect/loading/default/judgerank.png", },

{id = "src-ready", path = "../customize/effect/start/default/ready.png", },

{id = "src-fceffect", path = "../customize/effect/fullcombo/default/fceffect.png", },

{id = "src-fullcombo", path = "../customize/effect/fullcombo/default/fullcombo.png", },

{id = "hub-src-mcjudge", path = "../../ModernChic/Play/parts/common/judge/*.png|82|", }



-- skin.image ------------------------------------
{y = 0, src = "src-background", x = 0, h = -1, id = "ahead-img-src-background", w = -1, },

{y = 0, src = "src-ex-rate", x = 0, h = -1, id = "ahead-img-src-ex-rate", w = -1, },

{y = 0, src = "src-ex-dpframe", x = 0, h = -1, id = "ahead-img-src-ex-dpframe", w = -1, },

{y = 0, src = "src-ex-bgaframe", x = 0, h = -1, id = "ahead-img-src-ex-bgaframe", w = -1, },

{y = 0, src = "ex-notes-count", x = 0, h = -1, id = "ahead-img-ex-notes-count", w = -1, },

{y = 0, src = "src-nobgaimage", x = 0, h = -1, id = "ahead-img-src-nobgaimage", w = -1, },

{y = 0, src = "src-key-w", x = 0, h = -1, id = "ahead-img-src-key-w", w = -1, },

{y = 0, src = "src-key-b", x = 0, h = -1, id = "ahead-img-src-key-b", w = -1, },

{y = 0, src = "src-key-wf", x = 0, h = -1, id = "ahead-img-src-key-wf", w = -1, },

{y = 0, src = "src-key-bf", x = 0, h = -1, id = "ahead-img-src-key-bf", w = -1, },

{y = 0, src = "src-sc-base", x = 0, h = -1, id = "ahead-img-src-sc-base", w = -1, },

{y = 0, src = "src-sc-table", x = 0, h = -1, id = "ahead-img-src-sc-table", w = -1, },

{y = 0, src = "src-sc-record", x = 0, h = -1, id = "ahead-img-src-sc-record", w = -1, },

{y = 0, src = "src-gauge", x = 0, h = -1, id = "ahead-img-src-gauge", w = -1, },

{y = 0, src = "src-number-gauge", x = 0, h = -1, id = "ahead-img-src-number-gauge", w = -1, },

{y = 0, src = "src-scoregraph", x = 0, h = -1, id = "ahead-img-src-scoregraph", w = -1, },

{y = 0, src = "src-progress", x = 0, h = -1, id = "ahead-img-src-progress", w = -1, },

{y = 0, src = "src-mascot", x = 0, h = -1, id = "ahead-img-src-mascot", w = -1, },

{y = 0, src = "src-movingmascot", x = 0, h = -1, id = "ahead-img-src-movingmascot", w = -1, },

{y = 0, src = "src-background", x = 0, h = -1, id = "background", w = -1, },

{y = 0, src = "src-bpm", x = 0, h = -1, id = "ahead-img-src-bpm", w = -1, },

{y = 0, src = "src-score", x = 0, h = -1, id = "ahead-img-src-score", w = -1, },

{y = 0, src = "src-scorerate", x = 0, h = -1, id = "ahead-img-src-scorerate", w = -1, },

{y = 0, src = "src-maxcombo", x = 0, h = -1, id = "ahead-img-src-maxcombo", w = -1, },

{y = 0, src = "src-difftarget", x = 0, h = -1, id = "ahead-img-src-difftarget", w = -1, },

{y = 0, src = "src-lanebackground", x = 0, h = -1, id = "ahead-img-src-lanebackground", w = -1, },

{y = 0, src = "src-glow", x = 0, h = -1, id = "ahead-img-src-glow", w = -1, },

{y = 0, src = "src-notes-s", x = 0, h = -1, id = "ahead-img-src-notes-s", w = -1, },

{y = 0, src = "src-notes-1", x = 0, h = -1, id = "ahead-img-src-notes-1", w = -1, },

{y = 0, src = "src-notes-2", x = 0, h = -1, id = "ahead-img-src-notes-2", w = -1, },

{y = 0, src = "src-notes-3", x = 0, h = -1, id = "ahead-img-src-notes-3", w = -1, },

{y = 0, src = "src-notes-4", x = 0, h = -1, id = "ahead-img-src-notes-4", w = -1, },

{y = 0, src = "src-notes-5", x = 0, h = -1, id = "ahead-img-src-notes-5", w = -1, },

{y = 0, src = "src-notes-6", x = 0, h = -1, id = "ahead-img-src-notes-6", w = -1, },

{y = 0, src = "src-notes-7", x = 0, h = -1, id = "ahead-img-src-notes-7", w = -1, },

{y = 0, src = "src-notes-8", x = 0, h = -1, id = "ahead-img-src-notes-8", w = -1, },

{y = 0, src = "src-notes-9", x = 0, h = -1, id = "ahead-img-src-notes-9", w = -1, },

{y = 0, src = "src-barline", x = 0, h = -1, id = "ahead-img-src-barline", w = -1, },

{y = 0, src = "src-lanecover1", x = 0, h = -1, id = "ahead-img-src-lanecover1", w = -1, },

{y = 0, src = "src-lanecover2", x = 0, h = -1, id = "ahead-img-src-lanecover2", w = -1, },

{y = 0, src = "src-liftcover1", x = 0, h = -1, id = "ahead-img-src-liftcover1", w = -1, },

{y = 0, src = "src-liftcover2", x = 0, h = -1, id = "ahead-img-src-liftcover2", w = -1, },

{y = 0, src = "src-hiddencover1", x = 0, h = -1, id = "ahead-img-src-hiddencover1", w = -1, },

{y = 0, src = "src-hiddencover2", x = 0, h = -1, id = "ahead-img-src-hiddencover2", w = -1, },

{y = 0, src = "src-finishcover1", x = 0, h = -1, id = "ahead-img-src-finishcover1", w = -1, },

{y = 0, src = "src-finishcover2", x = 0, h = -1, id = "ahead-img-src-finishcover2", w = -1, },

{y = 0, src = "src-duration", x = 0, h = -1, id = "ahead-img-src-duration", w = -1, },

{y = 0, src = "src-bomb-dummy", x = 0, h = -1, id = "ahead-img-src-bomb-dummy", w = -1, },

{y = 0, src = "src-bomb", x = 0, h = -1, id = "ahead-img-src-bomb", w = -1, },

{y = 0, src = "src-ghost", x = 0, h = -1, id = "ahead-img-src-ghost", w = -1, },

{y = 0, src = "src-ex-rate", x = 0, h = -1, id = "ahead-img-src-ex-rate", w = -1, },

{y = 0, src = "src-ex-bgaframe", x = 0, h = -1, id = "ahead-img-src-ex-bgaframe", w = -1, },

{y = 0, src = "src-ex-dpframe", x = 0, h = -1, id = "ahead-img-src-ex-dpframe", w = -1, },

{y = 0, src = "src-ex-rate", x = 0, h = -1, id = "ahead-img-src-ex-rate", w = -1, },

{y = 0, src = "src-judgerank", x = 0, h = -1, id = "ahead-img-src-judgerank", w = -1, },

{y = 0, src = "src-ready", x = 0, h = -1, id = "ahead-img-src-ready", w = -1, },

{y = 0, src = "src-fceffect", x = 0, h = -1, id = "ahead-img-src-fceffect", w = -1, },

{y = 0, src = "src-fullcombo", x = 0, h = -1, id = "ahead-img-src-fullcombo", w = -1, },

{y = 0, src = "src-ex-rate", x = 65, h = 17, id = "ex-rate-dot", w = 13, },

{y = 0, src = "src-ex-dpframe", x = 0, h = -1, id = "ex-dpframe", w = -1, },

{y = 0, src = "src-ex-bgaframe", x = 3, h = 3, id = "line1", w = 3, },

{y = 3, src = "src-ex-bgaframe", x = 13, h = 3, id = "line2", w = 3, },

{y = 13, src = "src-ex-bgaframe", x = 3, h = 3, id = "line3", w = 3, },

{y = 3, src = "src-ex-bgaframe", x = 0, h = 3, id = "line4", w = 3, },

{y = 0, src = "src-ex-bgaframe", x = 0, h = 3, id = "corner1", w = 3, },

{y = 0, src = "src-ex-bgaframe", x = 13, h = 3, id = "corner2", w = 3, },

{y = 13, src = "src-ex-bgaframe", x = 13, h = 3, id = "corner3", w = 3, },

{y = 13, src = "src-ex-bgaframe", x = 0, h = 3, id = "corner4", w = 3, },

{y = 0, src = "src-nobgaimage", x = 0, h = -1, id = "no-bga-image", w = -1, },

{y = 0, src = "src-key-w", x = 0, h = -1, id = "key-w", w = -1, },

{y = 0, src = "src-key-b", x = 0, h = -1, id = "key-b", w = -1, },

{y = 0, src = "src-key-wf", x = 0, h = -1, id = "key-wf", w = -1, },

{y = 0, src = "src-key-bf", x = 0, h = -1, id = "key-bf", w = -1, },

{y = 0, src = "src-sc-base", x = 0, h = -1, id = "sc-base", w = -1, },

{y = 0, src = "src-sc-table", x = 0, h = -1, id = "sc-table", w = -1, },

{y = 0, src = "src-sc-record", x = 0, h = -1, id = "sc-record", w = -1, },

{y = 0, src = "src-gauge", x = 0, h = 34, id = "gauge-r1", w = 11, },

{y = 0, src = "src-gauge", x = 24, h = 34, id = "gauge-r2", w = 11, },

{y = 0, src = "src-gauge", x = 12, h = 34, id = "gauge-b1", w = 11, },

{y = 0, src = "src-gauge", x = 36, h = 34, id = "gauge-b2", w = 11, },

{y = 34, src = "src-gauge", x = 0, h = 34, id = "gauge-y1", w = 11, },

{y = 34, src = "src-gauge", x = 24, h = 34, id = "gauge-y2", w = 11, },

{y = 34, src = "src-gauge", x = 12, h = 34, id = "gauge-p1", w = 11, },

{y = 34, src = "src-gauge", x = 36, h = 34, id = "gauge-p2", w = 11, },

{y = 68, src = "src-gauge", x = 0, h = 34, id = "gauge-w1", w = 11, },

{y = 68, src = "src-gauge", x = 24, h = 34, id = "gauge-w2", w = 11, },

{y = 68, src = "src-gauge", x = 12, h = 34, id = "gauge-g1", w = 11, },

{y = 68, src = "src-gauge", x = 36, h = 34, id = "gauge-g2", w = 11, },

{y = 0, src = "src-number-gauge", x = 260, h = 38, id = "par-gauge", w = 16, },

{y = 0, src = "src-scoregraph", x = 0, h = 636, id = "scoregraph-frame", w = 590, },

{y = 122, src = "src-scoregraph", x = 586, h = 2, id = "scoregraph-line", w = 2, },

{y = 0, src = "src-mascot", x = 0, h = -1, id = "mascot", w = -1, },

{y = 0, src = "src-movingmascot", x = 0, h = 271, divx = 8, cycle = 1000, id = "movingmascot", w = 1344, },

{y = 39, src = "src-bpm", x = 0, h = 15, id = "bpm-s", w = 45, },

{y = 0, src = "src-score", x = 0, h = 17, id = "score-s", w = 78, },

{y = 0, src = "src-scorerate", x = 0, h = 17, id = "scorerate-s", w = 65, },

{y = 0, src = "src-scorerate", x = 65, h = 17, id = "scorerate-dot", w = 13, },

{y = 0, src = "src-maxcombo", x = 0, h = 17, id = "maxcombo-s", w = 78, },

{y = 0, src = "src-difftarget", x = 0, h = 17, id = "difftarget-s", w = 65, },

{y = 0, src = "src-lanebackground", x = 0, h = -1, id = "lanebackground", w = -1, },

{y = 0, src = "src-glow", x = 0, h = -1, id = "glow", w = -1, },

{y = 0, src = "src-barline", x = 0, h = -1, id = "section-line", w = -1, },

{y = 0, src = "src-notes-s", x = 0, h = 40, id = "note-s", w = 128, },

{y = 80, src = "src-notes-s", x = 0, h = 40, id = "lns-s", w = 128, },

{y = 40, src = "src-notes-s", x = 0, h = 40, id = "lne-s", w = 128, },

{y = 132, src = "src-notes-s", x = 0, h = 24, cycle = 266, id = "lnb-s", divy = 24, w = 128, },

{y = 120, src = "src-notes-s", x = 0, h = 12, id = "lna-s", w = 128, },

{y = 196, src = "src-notes-s", x = 0, h = 40, id = "hcns-s", w = 128, },

{y = 156, src = "src-notes-s", x = 0, h = 40, id = "hcne-s", w = 128, },

{y = 248, src = "src-notes-s", x = 0, h = 24, cycle = 266, id = "hcnb-s", divy = 24, w = 128, },

{y = 236, src = "src-notes-s", x = 0, h = 12, id = "hcna-s", w = 128, },

{y = 272, src = "src-notes-s", x = 0, h = 24, cycle = 100, id = "hcnr-s", divy = 24, w = 128, },

{y = 248, src = "src-notes-s", x = 0, h = 24, cycle = 266, id = "hcnd-s", divy = 24, w = 128, },

{y = 296, src = "src-notes-s", x = 0, h = 40, id = "mine-s", w = 128, },

{y = 0, src = "src-notes-1", x = 0, h = 40, id = "note-1", w = 128, },

{y = 80, src = "src-notes-1", x = 0, h = 40, id = "lns-1", w = 128, },

{y = 40, src = "src-notes-1", x = 0, h = 40, id = "lne-1", w = 128, },

{y = 132, src = "src-notes-1", x = 0, h = 24, cycle = 266, id = "lnb-1", divy = 24, w = 128, },

{y = 120, src = "src-notes-1", x = 0, h = 12, id = "lna-1", w = 128, },

{y = 196, src = "src-notes-1", x = 0, h = 40, id = "hcns-1", w = 128, },

{y = 156, src = "src-notes-1", x = 0, h = 40, id = "hcne-1", w = 128, },

{y = 248, src = "src-notes-1", x = 0, h = 24, cycle = 266, id = "hcnb-1", divy = 24, w = 128, },

{y = 236, src = "src-notes-1", x = 0, h = 12, id = "hcna-1", w = 128, },

{y = 272, src = "src-notes-1", x = 0, h = 24, cycle = 100, id = "hcnr-1", divy = 24, w = 128, },

{y = 248, src = "src-notes-1", x = 0, h = 24, cycle = 266, id = "hcnd-1", divy = 24, w = 128, },

{y = 296, src = "src-notes-1", x = 0, h = 40, id = "mine-1", w = 128, },

{y = 0, src = "src-notes-2", x = 0, h = 40, id = "note-2", w = 128, },

{y = 80, src = "src-notes-2", x = 0, h = 40, id = "lns-2", w = 128, },

{y = 40, src = "src-notes-2", x = 0, h = 40, id = "lne-2", w = 128, },

{y = 132, src = "src-notes-2", x = 0, h = 24, cycle = 266, id = "lnb-2", divy = 24, w = 128, },

{y = 120, src = "src-notes-2", x = 0, h = 12, id = "lna-2", w = 128, },

{y = 196, src = "src-notes-2", x = 0, h = 40, id = "hcns-2", w = 128, },

{y = 156, src = "src-notes-2", x = 0, h = 40, id = "hcne-2", w = 128, },

{y = 248, src = "src-notes-2", x = 0, h = 24, cycle = 266, id = "hcnb-2", divy = 24, w = 128, },

{y = 236, src = "src-notes-2", x = 0, h = 12, id = "hcna-2", w = 128, },

{y = 272, src = "src-notes-2", x = 0, h = 24, cycle = 100, id = "hcnr-2", divy = 24, w = 128, },

{y = 248, src = "src-notes-2", x = 0, h = 24, cycle = 266, id = "hcnd-2", divy = 24, w = 128, },

{y = 296, src = "src-notes-2", x = 0, h = 40, id = "mine-2", w = 128, },

{y = 0, src = "src-notes-3", x = 0, h = 40, id = "note-3", w = 128, },

{y = 80, src = "src-notes-3", x = 0, h = 40, id = "lns-3", w = 128, },

{y = 40, src = "src-notes-3", x = 0, h = 40, id = "lne-3", w = 128, },

{y = 132, src = "src-notes-3", x = 0, h = 24, cycle = 266, id = "lnb-3", divy = 24, w = 128, },

{y = 120, src = "src-notes-3", x = 0, h = 12, id = "lna-3", w = 128, },

{y = 196, src = "src-notes-3", x = 0, h = 40, id = "hcns-3", w = 128, },

{y = 156, src = "src-notes-3", x = 0, h = 40, id = "hcne-3", w = 128, },

{y = 248, src = "src-notes-3", x = 0, h = 24, cycle = 266, id = "hcnb-3", divy = 24, w = 128, },

{y = 236, src = "src-notes-3", x = 0, h = 12, id = "hcna-3", w = 128, },

{y = 272, src = "src-notes-3", x = 0, h = 24, cycle = 100, id = "hcnr-3", divy = 24, w = 128, },

{y = 248, src = "src-notes-3", x = 0, h = 24, cycle = 266, id = "hcnd-3", divy = 24, w = 128, },

{y = 296, src = "src-notes-3", x = 0, h = 40, id = "mine-3", w = 128, },

{y = 0, src = "src-notes-4", x = 0, h = 40, id = "note-4", w = 128, },

{y = 80, src = "src-notes-4", x = 0, h = 40, id = "lns-4", w = 128, },

{y = 40, src = "src-notes-4", x = 0, h = 40, id = "lne-4", w = 128, },

{y = 132, src = "src-notes-4", x = 0, h = 24, cycle = 266, id = "lnb-4", divy = 24, w = 128, },

{y = 120, src = "src-notes-4", x = 0, h = 12, id = "lna-4", w = 128, },

{y = 196, src = "src-notes-4", x = 0, h = 40, id = "hcns-4", w = 128, },

{y = 156, src = "src-notes-4", x = 0, h = 40, id = "hcne-4", w = 128, },

{y = 248, src = "src-notes-4", x = 0, h = 24, cycle = 266, id = "hcnb-4", divy = 24, w = 128, },

{y = 236, src = "src-notes-4", x = 0, h = 12, id = "hcna-4", w = 128, },

{y = 272, src = "src-notes-4", x = 0, h = 24, cycle = 100, id = "hcnr-4", divy = 24, w = 128, },

{y = 248, src = "src-notes-4", x = 0, h = 24, cycle = 266, id = "hcnd-4", divy = 24, w = 128, },

{y = 296, src = "src-notes-4", x = 0, h = 40, id = "mine-4", w = 128, },

{y = 0, src = "src-notes-5", x = 0, h = 40, id = "note-5", w = 128, },

{y = 80, src = "src-notes-5", x = 0, h = 40, id = "lns-5", w = 128, },

{y = 40, src = "src-notes-5", x = 0, h = 40, id = "lne-5", w = 128, },

{y = 132, src = "src-notes-5", x = 0, h = 24, cycle = 266, id = "lnb-5", divy = 24, w = 128, },

{y = 120, src = "src-notes-5", x = 0, h = 12, id = "lna-5", w = 128, },

{y = 196, src = "src-notes-5", x = 0, h = 40, id = "hcns-5", w = 128, },

{y = 156, src = "src-notes-5", x = 0, h = 40, id = "hcne-5", w = 128, },

{y = 248, src = "src-notes-5", x = 0, h = 24, cycle = 266, id = "hcnb-5", divy = 24, w = 128, },

{y = 236, src = "src-notes-5", x = 0, h = 12, id = "hcna-5", w = 128, },

{y = 272, src = "src-notes-5", x = 0, h = 24, cycle = 100, id = "hcnr-5", divy = 24, w = 128, },

{y = 248, src = "src-notes-5", x = 0, h = 24, cycle = 266, id = "hcnd-5", divy = 24, w = 128, },

{y = 296, src = "src-notes-5", x = 0, h = 40, id = "mine-5", w = 128, },

{y = 0, src = "src-notes-6", x = 0, h = 40, id = "note-6", w = 128, },

{y = 80, src = "src-notes-6", x = 0, h = 40, id = "lns-6", w = 128, },

{y = 40, src = "src-notes-6", x = 0, h = 40, id = "lne-6", w = 128, },

{y = 132, src = "src-notes-6", x = 0, h = 24, cycle = 266, id = "lnb-6", divy = 24, w = 128, },

{y = 120, src = "src-notes-6", x = 0, h = 12, id = "lna-6", w = 128, },

{y = 196, src = "src-notes-6", x = 0, h = 40, id = "hcns-6", w = 128, },

{y = 156, src = "src-notes-6", x = 0, h = 40, id = "hcne-6", w = 128, },

{y = 248, src = "src-notes-6", x = 0, h = 24, cycle = 266, id = "hcnb-6", divy = 24, w = 128, },

{y = 236, src = "src-notes-6", x = 0, h = 12, id = "hcna-6", w = 128, },

{y = 272, src = "src-notes-6", x = 0, h = 24, cycle = 100, id = "hcnr-6", divy = 24, w = 128, },

{y = 248, src = "src-notes-6", x = 0, h = 24, cycle = 266, id = "hcnd-6", divy = 24, w = 128, },

{y = 296, src = "src-notes-6", x = 0, h = 40, id = "mine-6", w = 128, },

{y = 0, src = "src-notes-7", x = 0, h = 40, id = "note-7", w = 128, },

{y = 80, src = "src-notes-7", x = 0, h = 40, id = "lns-7", w = 128, },

{y = 40, src = "src-notes-7", x = 0, h = 40, id = "lne-7", w = 128, },

{y = 132, src = "src-notes-7", x = 0, h = 24, cycle = 266, id = "lnb-7", divy = 24, w = 128, },

{y = 120, src = "src-notes-7", x = 0, h = 12, id = "lna-7", w = 128, },

{y = 196, src = "src-notes-7", x = 0, h = 40, id = "hcns-7", w = 128, },

{y = 156, src = "src-notes-7", x = 0, h = 40, id = "hcne-7", w = 128, },

{y = 248, src = "src-notes-7", x = 0, h = 24, cycle = 266, id = "hcnb-7", divy = 24, w = 128, },

{y = 236, src = "src-notes-7", x = 0, h = 12, id = "hcna-7", w = 128, },

{y = 272, src = "src-notes-7", x = 0, h = 24, cycle = 100, id = "hcnr-7", divy = 24, w = 128, },

{y = 248, src = "src-notes-7", x = 0, h = 24, cycle = 266, id = "hcnd-7", divy = 24, w = 128, },

{y = 296, src = "src-notes-7", x = 0, h = 40, id = "mine-7", w = 128, },

{y = 0, src = "src-notes-8", x = 0, h = 40, id = "note-8", w = 128, },

{y = 80, src = "src-notes-8", x = 0, h = 40, id = "lns-8", w = 128, },

{y = 40, src = "src-notes-8", x = 0, h = 40, id = "lne-8", w = 128, },

{y = 132, src = "src-notes-8", x = 0, h = 24, cycle = 266, id = "lnb-8", divy = 24, w = 128, },

{y = 120, src = "src-notes-8", x = 0, h = 12, id = "lna-8", w = 128, },

{y = 196, src = "src-notes-8", x = 0, h = 40, id = "hcns-8", w = 128, },

{y = 156, src = "src-notes-8", x = 0, h = 40, id = "hcne-8", w = 128, },

{y = 248, src = "src-notes-8", x = 0, h = 24, cycle = 266, id = "hcnb-8", divy = 24, w = 128, },

{y = 236, src = "src-notes-8", x = 0, h = 12, id = "hcna-8", w = 128, },

{y = 272, src = "src-notes-8", x = 0, h = 24, cycle = 100, id = "hcnr-8", divy = 24, w = 128, },

{y = 248, src = "src-notes-8", x = 0, h = 24, cycle = 266, id = "hcnd-8", divy = 24, w = 128, },

{y = 296, src = "src-notes-8", x = 0, h = 40, id = "mine-8", w = 128, },

{y = 0, src = "src-notes-9", x = 0, h = 40, id = "note-9", w = 128, },

{y = 80, src = "src-notes-9", x = 0, h = 40, id = "lns-9", w = 128, },

{y = 40, src = "src-notes-9", x = 0, h = 40, id = "lne-9", w = 128, },

{y = 132, src = "src-notes-9", x = 0, h = 24, cycle = 266, id = "lnb-9", divy = 24, w = 128, },

{y = 120, src = "src-notes-9", x = 0, h = 12, id = "lna-9", w = 128, },

{y = 196, src = "src-notes-9", x = 0, h = 40, id = "hcns-9", w = 128, },

{y = 156, src = "src-notes-9", x = 0, h = 40, id = "hcne-9", w = 128, },

{y = 248, src = "src-notes-9", x = 0, h = 24, cycle = 266, id = "hcnb-9", divy = 24, w = 128, },

{y = 236, src = "src-notes-9", x = 0, h = 12, id = "hcna-9", w = 128, },

{y = 272, src = "src-notes-9", x = 0, h = 24, cycle = 100, id = "hcnr-9", divy = 24, w = 128, },

{y = 248, src = "src-notes-9", x = 0, h = 24, cycle = 266, id = "hcnd-9", divy = 24, w = 128, },

{y = 296, src = "src-notes-9", x = 0, h = 40, id = "mine-9", w = 128, },

{y = 0, src = "src-finishcover1", x = 0, h = -1, id = "finishcover1", w = -1, },

{y = 0, src = "src-finishcover2", x = 0, h = -1, id = "finishcover2", w = -1, },

{y = 0, src = "src-bomb-dummy", x = 0, h = -1, id = "bomb-dummy", w = -1, },

{id = "bomb-1s", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 50, },

{id = "bomb-pg-1s", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 50, },

{id = "hold1s", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 70, },

{id = "hold1s-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 70, },

{id = "bomb-2s", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 60, },

{id = "bomb-pg-2s", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 60, },

{id = "hold2s", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 80, },

{id = "hold2s-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 80, },

{id = "bomb-11", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 51, },

{id = "bomb-pg-11", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 51, },

{id = "hold11", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 71, },

{id = "hold11-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 71, },

{id = "bomb-21", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 61, },

{id = "bomb-pg-21", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 61, },

{id = "hold21", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 81, },

{id = "hold21-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 81, },

{id = "bomb-12", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 52, },

{id = "bomb-pg-12", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 52, },

{id = "hold12", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 72, },

{id = "hold12-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 72, },

{id = "bomb-22", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 62, },

{id = "bomb-pg-22", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 62, },

{id = "hold22", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 82, },

{id = "hold22-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 82, },

{id = "bomb-13", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 53, },

{id = "bomb-pg-13", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 53, },

{id = "hold13", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 73, },

{id = "hold13-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 73, },

{id = "bomb-23", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 63, },

{id = "bomb-pg-23", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 63, },

{id = "hold23", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 83, },

{id = "hold23-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 83, },

{id = "bomb-14", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 54, },

{id = "bomb-pg-14", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 54, },

{id = "hold14", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 74, },

{id = "hold14-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 74, },

{id = "bomb-24", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 64, },

{id = "bomb-pg-24", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 64, },

{id = "hold24", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 84, },

{id = "hold24-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 84, },

{id = "bomb-15", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 55, },

{id = "bomb-pg-15", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 55, },

{id = "hold15", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 75, },

{id = "hold15-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 75, },

{id = "bomb-25", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 65, },

{id = "bomb-pg-25", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 65, },

{id = "hold25", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 85, },

{id = "hold25-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 85, },

{id = "bomb-16", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 56, },

{id = "bomb-pg-16", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 56, },

{id = "hold16", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 76, },

{id = "hold16-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 76, },

{id = "bomb-26", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 66, },

{id = "bomb-pg-26", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 66, },

{id = "hold26", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 86, },

{id = "hold26-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 86, },

{id = "bomb-17", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 57, },

{id = "bomb-pg-17", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 57, },

{id = "hold17", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 77, },

{id = "hold17-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 77, },

{id = "bomb-27", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 67, },

{id = "bomb-pg-27", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 67, },

{id = "hold27", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 87, },

{id = "hold27-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 87, },

{id = "bomb-18", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 58, },

{id = "bomb-pg-18", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 58, },

{id = "hold18", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 78, },

{id = "hold18-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 78, },

{id = "bomb-28", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 68, },

{id = "bomb-pg-28", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 68, },

{id = "hold28", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 88, },

{id = "hold28-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 88, },

{id = "bomb-19", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 59, },

{id = "bomb-pg-19", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 59, },

{id = "hold19", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 79, },

{id = "hold19-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 79, },

{id = "bomb-29", w = 6400, y = 0, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 69, },

{id = "bomb-pg-29", w = 6400, y = 300, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 69, },

{id = "hold29", w = 6400, y = 900, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 500, divy = 1, timer = 89, },

{id = "hold29-b", w = 6400, y = 600, src = "src-bomb", x = 0, h = 300, divx = 16, cycle = 251, divy = 1, timer = 89, },

{y = 0, src = "src-ex-rate", x = 65, h = 17, id = "ex-rate-dot", w = 13, },

{y = 0, src = "src-ex-bgaframe", x = 3, h = 3, id = "line1", w = 3, },

{y = 3, src = "src-ex-bgaframe", x = 13, h = 3, id = "line2", w = 3, },

{y = 13, src = "src-ex-bgaframe", x = 3, h = 3, id = "line3", w = 3, },

{y = 3, src = "src-ex-bgaframe", x = 0, h = 3, id = "line4", w = 3, },

{y = 0, src = "src-ex-bgaframe", x = 0, h = 3, id = "corner1", w = 3, },

{y = 0, src = "src-ex-bgaframe", x = 13, h = 3, id = "corner2", w = 3, },

{y = 13, src = "src-ex-bgaframe", x = 13, h = 3, id = "corner3", w = 3, },

{y = 13, src = "src-ex-bgaframe", x = 0, h = 3, id = "corner4", w = 3, },

{y = 0, src = "src-ex-dpframe", x = 0, h = -1, id = "ex-dpframe", w = -1, },

{y = 0, src = "src-ex-rate", x = 65, h = 17, id = "ex-rate-dot", w = 13, },

{y = 0, src = "src-judgerank", x = 0, h = 24, id = "judge-veryeasy", w = 204, },

{y = 24, src = "src-judgerank", x = 0, h = 24, id = "judge-easy", w = 204, },

{y = 48, src = "src-judgerank", x = 0, h = 24, id = "judge-normal", w = 204, },

{y = 72, src = "src-judgerank", x = 0, h = 24, id = "judge-hard", w = 204, },

{y = 96, src = "src-judgerank", x = 0, h = 24, id = "judge-veryhard", w = 204, },

{y = 0, src = "src-ready", x = 0, h = -1, id = "ready", w = -1, },

{y = 0, src = "src-fceffect", x = 0, h = -1, id = "fc-effect", w = -1, },

{y = 0, src = "src-fullcombo", x = 0, h = -1, id = "fullcombo", w = -1, },

{y = 0, src = "hub-src-mcjudge", x = 0, h = 252, cycle = 120, id = "hub-mcjudgef-pg", divy = 3, w = 227, },

{y = 252, src = "hub-src-mcjudge", x = 0, h = 168, cycle = 80, id = "hub-mcjudgef-gr", divy = 2, w = 227, },

{y = 420, src = "hub-src-mcjudge", x = 0, h = 168, cycle = 80, id = "hub-mcjudgef-gd", divy = 2, w = 227, },

{y = 420, src = "hub-src-mcjudge", x = 227, h = 168, cycle = 80, id = "hub-mcjudgef-bd", divy = 2, w = 227, },

{y = 420, src = "hub-src-mcjudge", x = 454, h = 168, cycle = 80, id = "hub-mcjudgef-pr", divy = 2, w = 227, },

{y = 420, src = "hub-src-mcjudge", x = 454, h = 168, cycle = 80, id = "hub-mcjudgef-ms", divy = 2, w = 227, }



-- skin.imageset ------------------------------------
{id = "bomb1s", ref = 500, bomb-1s, bomb-dummy},

{id = "bombpg1s", ref = 500, bomb-dummy, bomb-pg-1s},

{id = "bomb2s", ref = 510, bomb-2s, bomb-dummy},

{id = "bombpg2s", ref = 510, bomb-dummy, bomb-pg-2s},

{id = "bomb11", ref = 501, bomb-11, bomb-dummy},

{id = "bombpg11", ref = 501, bomb-dummy, bomb-pg-11},

{id = "bomb21", ref = 511, bomb-21, bomb-dummy},

{id = "bombpg21", ref = 511, bomb-dummy, bomb-pg-21},

{id = "bomb12", ref = 502, bomb-12, bomb-dummy},

{id = "bombpg12", ref = 502, bomb-dummy, bomb-pg-12},

{id = "bomb22", ref = 512, bomb-22, bomb-dummy},

{id = "bombpg22", ref = 512, bomb-dummy, bomb-pg-22},

{id = "bomb13", ref = 503, bomb-13, bomb-dummy},

{id = "bombpg13", ref = 503, bomb-dummy, bomb-pg-13},

{id = "bomb23", ref = 513, bomb-23, bomb-dummy},

{id = "bombpg23", ref = 513, bomb-dummy, bomb-pg-23},

{id = "bomb14", ref = 504, bomb-14, bomb-dummy},

{id = "bombpg14", ref = 504, bomb-dummy, bomb-pg-14},

{id = "bomb24", ref = 514, bomb-24, bomb-dummy},

{id = "bombpg24", ref = 514, bomb-dummy, bomb-pg-24},

{id = "bomb15", ref = 505, bomb-15, bomb-dummy},

{id = "bombpg15", ref = 505, bomb-dummy, bomb-pg-15},

{id = "bomb25", ref = 515, bomb-25, bomb-dummy},

{id = "bombpg25", ref = 515, bomb-dummy, bomb-pg-25},

{id = "bomb16", ref = 506, bomb-16, bomb-dummy},

{id = "bombpg16", ref = 506, bomb-dummy, bomb-pg-16},

{id = "bomb26", ref = 516, bomb-26, bomb-dummy},

{id = "bombpg26", ref = 516, bomb-dummy, bomb-pg-26},

{id = "bomb17", ref = 507, bomb-17, bomb-dummy},

{id = "bombpg17", ref = 507, bomb-dummy, bomb-pg-17},

{id = "bomb27", ref = 517, bomb-27, bomb-dummy},

{id = "bombpg27", ref = 517, bomb-dummy, bomb-pg-27},

{id = "bomb18", ref = 508, bomb-18, bomb-dummy},

{id = "bombpg18", ref = 508, bomb-dummy, bomb-pg-18},

{id = "bomb28", ref = 518, bomb-28, bomb-dummy},

{id = "bombpg28", ref = 518, bomb-dummy, bomb-pg-28},

{id = "bomb19", ref = 509, bomb-19, bomb-dummy},

{id = "bombpg19", ref = 509, bomb-dummy, bomb-pg-19},

{id = "bomb29", ref = 519, bomb-29, bomb-dummy},

{id = "bombpg29", ref = 519, bomb-dummy, bomb-pg-29}



-- skin.value ------------------------------------
{id = "ex-rate-n", w = 143, y = 17, digit = 3, src = "src-ex-rate", x = 0, h = 17, divx = 11, ref = 102, },

{id = "ex-rate-ad-n", align = 1, w = 143, y = 17, digit = 2, src = "src-ex-rate", x = 0, h = 17, divx = 11, ref = 103, },

{id = "ex-notes-count-remain", align = 2, w = 180, y = 0, digit = 4, src = "ex-notes-count", x = 0, h = 20, divx = 10, value = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\残りノーツ数表示/parts.lua:17-35, },

{id = "groovegauge", w = 260, y = 0, digit = 3, src = "src-number-gauge", x = 0, h = 38, divx = 10, value = function: @skin\simple-play-simple-ver0.52\system\..\customize\gauge\remi-s2/parts.lua:30-40, },

{id = "now_score", align = 0, w = 200, y = 0, digit = 5, src = "src-scoregraph", x = 590, h = 21, divx = 10, value = function: @skin\simple-play-simple-ver0.52\system\..\customize\scoregraph\CS_1P/parts.lua:22-22, },

{id = "target_score", align = 0, w = 200, y = 0, digit = 5, src = "src-scoregraph", x = 590, h = 21, divx = 10, value = function: @skin\simple-play-simple-ver0.52\system\..\customize\scoregraph\CS_1P/parts.lua:23-23, },

{id = "nowbpm", align = 2, w = 240, y = 0, digit = 4, src = "src-bpm", x = 0, h = 24, divx = 10, ref = 160, },

{id = "minbpm", align = 2, w = 130, y = 24, digit = 4, src = "src-bpm", x = 0, h = 15, divx = 10, ref = 91, },

{id = "maxbpm", align = 2, w = 130, y = 24, digit = 4, src = "src-bpm", x = 0, h = 15, divx = 10, ref = 90, },

{id = "score-n", align = 1, w = 130, y = 17, digit = 5, src = "src-score", x = 0, h = 17, divx = 10, divy = 1, ref = 101, },

{id = "scorerate-n", w = 143, y = 17, digit = 3, src = "src-scorerate", x = 0, h = 17, divx = 11, ref = 102, },

{id = "scorerate-ad-n", align = 1, w = 143, y = 17, digit = 2, src = "src-scorerate", x = 0, h = 17, divx = 11, ref = 103, },

{id = "maxcombo-n", align = 1, w = 130, y = 17, digit = 5, src = "src-maxcombo", x = 0, h = 17, divx = 10, ref = 105, },

{id = "difftarget-n", align = 1, w = 156, y = 17, digit = 5, src = "src-difftarget", x = 0, h = 34, divx = 12, divy = 2, ref = 153, },

{id = "lanecover-white", align = 2, w = 160, y = 0, digit = 4, src = "src-duration", x = 0, h = 26, divx = 10, ref = 14, },

{id = "liftcover-white", align = 2, w = 160, y = 0, digit = 4, src = "src-duration", x = 0, h = 26, divx = 10, ref = 314, },

{id = "duration-green", align = 2, w = 160, y = 26, digit = 4, src = "src-duration", x = 0, h = 26, divx = 10, ref = 313, },

{id = "ghost-mybest", align = 2, w = 216, y = 0, digit = 6, src = "src-ghost", x = 0, h = 40, divx = 12, divy = 2, ref = 152, },

{id = "ex-rate-n", w = 143, y = 17, digit = 3, src = "src-ex-rate", x = 0, h = 17, divx = 11, ref = 102, },

{id = "ex-rate-ad-n", align = 1, w = 143, y = 17, digit = 2, src = "src-ex-rate", x = 0, h = 17, divx = 11, ref = 103, },

{id = "ex-rate-n", w = 143, y = 17, digit = 3, src = "src-ex-rate", x = 0, h = 17, divx = 11, ref = 102, },

{id = "ex-rate-ad-n", align = 1, w = 143, y = 17, digit = 2, src = "src-ex-rate", x = 0, h = 17, divx = 11, ref = 103, },

{id = "hub-mcjudgen-pg", w = 550, y = 0, digit = 6, src = "hub-src-mcjudge", x = 227, h = 252, divx = 10, cycle = 120, divy = 3, ref = 75, },

{id = "hub-mcjudgen-gr", w = 550, y = 252, digit = 6, src = "hub-src-mcjudge", x = 227, h = 168, divx = 10, cycle = 80, divy = 2, ref = 75, },

{id = "hub-mcjudgen-gd", w = 550, y = 252, digit = 6, src = "hub-src-mcjudge", x = 227, h = 168, divx = 10, cycle = 80, divy = 2, ref = 75, },

{id = "hub-mcjudgen-bd", w = 550, y = 252, digit = 6, src = "hub-src-mcjudge", x = 227, h = 168, divx = 10, cycle = 80, divy = 2, ref = 75, },

{id = "hub-mcjudgen-pr", w = 550, y = 252, digit = 6, src = "hub-src-mcjudge", x = 227, h = 168, divx = 10, cycle = 80, divy = 2, ref = 75, },

{id = "hub-mcjudgen-ms", w = 550, y = 252, digit = 6, src = "hub-src-mcjudge", x = 227, h = 168, divx = 10, cycle = 80, divy = 2, ref = 75, }



-- skin.destination ------------------------------------
{id = "ahead-img-src-background", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-rate", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-dpframe", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-bgaframe", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-ex-notes-count", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-nobgaimage", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-key-w", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-key-b", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-key-wf", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-key-bf", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-sc-base", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-sc-table", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-sc-record", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-gauge", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-number-gauge", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-scoregraph", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-progress", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-mascot", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-movingmascot", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "background", dst = {
	{y = 0, a = 255, x = 0, h = 1080, w = 1920, },
},stretch = 3, filter = 1, },

{id = "ahead-img-src-bpm", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-score", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-scorerate", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-maxcombo", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-difftarget", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-lanebackground", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-glow", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-s", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-1", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-2", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-3", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-4", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-5", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-6", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-7", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-8", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-notes-9", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-barline", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-lanecover1", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-lanecover2", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-liftcover1", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-liftcover2", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-hiddencover1", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-hiddencover2", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-finishcover1", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-finishcover2", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-duration", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-bomb-dummy", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-bomb", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ghost", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-rate", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-bgaframe", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-dpframe", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ex-rate", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-judgerank", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-ready", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-fceffect", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ahead-img-src-fullcombo", dst = {
	{y = 0, x = 0, h = 1, w = 1, },
},},

{id = "ex-rate-dot", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:30-30, dst = {
	{y = 330, x = 634.5, h = 17, w = 13, },
},},

{id = "ex-rate-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:31-31, dst = {
	{y = 330, x = 595.5, h = 17, w = 13, },
},},

{id = "ex-rate-ad-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:32-32, dst = {
	{y = 330, x = 647.5, h = 17, w = 13, },
},},

{id = "ex-rate-dot", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:30-30, dst = {
	{y = 330, x = 1285.5, h = 17, w = 13, },
},},

{id = "ex-rate-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:31-31, dst = {
	{y = 330, x = 1246.5, h = 17, w = 13, },
},},

{id = "ex-rate-ad-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:32-32, dst = {
	{y = 330, x = 1298.5, h = 17, w = 13, },
},},

{id = "ex-dpframe", dst = {
	{y = 0, a = 0, x = 0, h = 1080, time = 0, w = 1920, },
	{time = 800, },
	{time = 900, a = 255, },
},loop = 900, },

{id = "line1", dst = {
	{y = 1035, x = 19, h = 3, w = 300, },
},},

{id = "line2", dst = {
	{y = 735, x = 319, h = 300, w = 3, },
},},

{id = "line3", dst = {
	{y = 732, x = 19, h = 3, w = 300, },
},},

{id = "line4", dst = {
	{y = 735, x = 16, h = 300, w = 3, },
},},

{id = "corner1", dst = {
	{y = 1035, x = 16, h = 3, w = 3, },
},},

{id = "corner2", dst = {
	{y = 1035, x = 319, h = 3, w = 3, },
},},

{id = "corner3", dst = {
	{y = 732, x = 319, h = 3, w = 3, },
},},

{id = "corner4", dst = {
	{y = 732, x = 16, h = 3, w = 3, },
},},

{offsets = {3, 32}, id = "ex-notes-count-remain", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\残りノーツ数表示/parts.lua:40-40, dst = {
	{y = 344, x = 598.5, h = 20, w = 18, },
},},

{offsets = {3, 32}, id = "ex-notes-count-remain", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\残りノーツ数表示/parts.lua:40-40, dst = {
	{y = 344, x = 1249.5, h = 20, w = 18, },
},},

{id = -110, dst = {
	{y = 735, x = 19, h = 300, w = 300, },
},},

{id = "bga", dst = {
	{y = 735, a = 255, x = 19, h = 300, w = 300, },
},stretch = 1, filter = 1, },

{op = {170}, filter = 1, id = "no-bga-image", timer = 41, dst = {
	{y = 735, a = 255, x = 19, h = 300, w = 300, },
},stretch = 1, },

{id = -110, dst = {
	{y = 735, a = 0, x = 19, h = 300, w = 300, },
},},

{id = -110, dst = {
	{y = 390, x = 19, h = 300, w = 300, },
},},

{id = "bga", dst = {
	{y = 390, a = 255, x = 19, h = 300, w = 300, },
},stretch = 1, filter = 1, },

{op = {170}, filter = 1, id = "no-bga-image", timer = 41, dst = {
	{y = 390, a = 255, x = 19, h = 300, w = 300, },
},stretch = 1, },

{id = -110, dst = {
	{y = 390, a = 0, x = 19, h = 300, w = 300, },
},},

{id = "key-w", dst = {
	{y = 150, x = 486, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 101, dst = {
	{y = 160, x = 486, h = 100, w = 66, },
},filter = 1, },

{id = "key-b", dst = {
	{y = 150, x = 552, h = 100, time = 0, w = 48, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-bf", timer = 102, dst = {
	{y = 160, x = 552, h = 100, w = 48, },
},filter = 1, },

{id = "key-w", dst = {
	{y = 150, x = 600, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 103, dst = {
	{y = 160, x = 600, h = 100, w = 66, },
},filter = 1, },

{id = "key-b", dst = {
	{y = 150, x = 666, h = 100, time = 0, w = 48, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-bf", timer = 104, dst = {
	{y = 160, x = 666, h = 100, w = 48, },
},filter = 1, },

{id = "key-w", dst = {
	{y = 150, x = 714, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 105, dst = {
	{y = 160, x = 714, h = 100, w = 66, },
},filter = 1, },

{id = "key-b", dst = {
	{y = 150, x = 780, h = 100, time = 0, w = 48, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-bf", timer = 106, dst = {
	{y = 160, x = 780, h = 100, w = 48, },
},filter = 1, },

{id = "key-w", dst = {
	{y = 150, x = 828, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 107, dst = {
	{y = 160, x = 828, h = 100, w = 66, },
},filter = 1, },

{id = "sc-base", dst = {
	{y = 160, x = 378, h = 100, w = 108, },
},stretch = 4, filter = 1, },

{id = "sc-table", dst = {
	{y = 160, x = 324, h = 100, w = 162, },
},stretch = 4, filter = 1, },

{offset = 1, filter = 1, id = "sc-record", dst = {
	{y = 160, x = 324, h = 100, w = 162, },
},stretch = 4, },

{id = "key-w", dst = {
	{y = 150, x = 1026, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 111, dst = {
	{y = 160, x = 1026, h = 100, w = 66, },
},filter = 1, },

{id = "key-b", dst = {
	{y = 150, x = 1092, h = 100, time = 0, w = 48, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-bf", timer = 112, dst = {
	{y = 160, x = 1092, h = 100, w = 48, },
},filter = 1, },

{id = "key-w", dst = {
	{y = 150, x = 1140, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 113, dst = {
	{y = 160, x = 1140, h = 100, w = 66, },
},filter = 1, },

{id = "key-b", dst = {
	{y = 150, x = 1206, h = 100, time = 0, w = 48, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-bf", timer = 114, dst = {
	{y = 160, x = 1206, h = 100, w = 48, },
},filter = 1, },

{id = "key-w", dst = {
	{y = 150, x = 1254, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 115, dst = {
	{y = 160, x = 1254, h = 100, w = 66, },
},filter = 1, },

{id = "key-b", dst = {
	{y = 150, x = 1320, h = 100, time = 0, w = 48, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-bf", timer = 116, dst = {
	{y = 160, x = 1320, h = 100, w = 48, },
},filter = 1, },

{id = "key-w", dst = {
	{y = 150, x = 1368, h = 100, time = 0, w = 66, },
	{time = 100, },
	{time = 200, y = 160, },
},loop = 200, filter = 1, },

{id = "key-wf", timer = 117, dst = {
	{y = 160, x = 1368, h = 100, w = 66, },
},filter = 1, },

{id = "sc-base", dst = {
	{y = 160, x = 1434, h = 100, w = 108, },
},stretch = 4, filter = 1, },

{id = "sc-table", dst = {
	{y = 160, x = 1434, h = 100, w = 162, },
},stretch = 4, filter = 1, },

{offset = 2, filter = 1, id = "sc-record", dst = {
	{y = 160, x = 1434, h = 100, w = 162, },
},stretch = 4, },

{id = "gauge", dst = {
	{y = 100, x = 720, h = 30, w = 480, },
},},

{id = "par-gauge", dst = {
	{y = 214, x = 982, h = 38, w = 16, },
},},

{id = "groovegauge", dst = {
	{y = 214, x = 904, h = 38, w = 26, },
},},

{id = "scoregraph-frame", dst = {
	{y = 567, a = 64, x = -126, h = 636, time = 0, w = 590, },
	{time = 200, a = 255, },
},loop = 200, },

{id = "now_score", dst = {
	{y = 1132, x = 358, h = 21, w = 20, },
},},

{id = "target_score", dst = {
	{y = 1097, x = 358, h = 21, w = 20, },
},},

{id = "graph-now", dst = {
	{y = 573, x = 160, h = 504, w = 68, },
},},

{id = "graph-best-f", dst = {
	{y = 573, x = 262, h = 504, w = 68, },
},},

{id = "graph-best", dst = {
	{y = 573, x = 262, h = 504, w = 68, },
},},

{id = "graph-target-f", dst = {
	{y = 573, x = 364, h = 504, w = 68, },
},},

{id = "graph-target", dst = {
	{y = 573, x = 364, h = 504, w = 68, },
},},

{id = "scoregraph-line", dst = {
	{y = 908, x = -122, h = 2, w = 582, },
},op = {222}, },

{id = "scoregraph-line", dst = {
	{y = 964, x = -122, h = 2, w = 582, },
},op = {221}, },

{id = "scoregraph-line", dst = {
	{y = 1020, x = -122, h = 2, w = 582, },
},op = {220}, },

{id = "song-progress", dst = {
	{y = 260, a = 0, x = 323, h = 64, time = 0, w = 64, acc = 2, },
	{time = 500, a = 255, },
	{time = 1200, y = 1000, },
},loop = 1200, blend = 2, },

{loop = 0, id = "song-progress", timer = 140, dst = {
	{y = 1000, a = 255, x = 323, h = 64, time = 0, w = 64, },
	{time = 1000, a = 0, },
},blend = 2, },

{id = "mascot", dst = {
	{y = 317, x = 1655, h = 271, time = 0, w = 168, },
	{time = 2000, },
},loop = 2000, stretch = 9, },

{id = "movingmascot", dst = {
	{y = 317, x = 1655, h = 271, time = 0, w = 168, },
	{time = 2000, },
},loop = 2000, },

{id = "pmchara", dst = {
	{y = 317, x = 1655, h = 271, w = 167, },
},},

{id = "bpm-s", dst = {
	{y = 74, x = 937, h = 15, w = 45, },
},},

{id = "nowbpm", dst = {
	{y = 44, x = 911, h = 24, w = 24, },
},},

{id = "minbpm", dst = {
	{y = 44, x = 859, h = 15, w = 13, },
},},

{id = "maxbpm", dst = {
	{y = 44, x = 1007, h = 15, w = 13, },
},},

{id = "score-s", dst = {
	{y = 90, x = 496, h = 17, w = 78, },
},},

{id = "score-n", dst = {
	{y = 90, x = 574, h = 17, w = 13, },
},},

{id = "scorerate-s", dst = {
	{y = 116, x = 496, h = 17, w = 65, },
},},

{id = "scorerate-dot", dst = {
	{y = 116, x = 600, h = 17, w = 13, },
},},

{id = "scorerate-n", dst = {
	{y = 116, x = 561, h = 17, w = 13, },
},},

{id = "scorerate-ad-n", dst = {
	{y = 116, x = 613, h = 17, w = 13, },
},},

{id = "maxcombo-s", dst = {
	{y = 64, x = 496, h = 17, w = 78, },
},},

{id = "maxcombo-n", dst = {
	{y = 64, x = 574, h = 17, w = 13, },
},},

{id = "difftarget-s", dst = {
	{y = 275, x = 1603, h = 17, w = 65, },
},},

{id = "difftarget-n", dst = {
	{y = 275, x = 1668, h = 17, w = 13, },
},},

{id = "lanebackground", dst = {
	{y = 263, a = 255, x = 378, h = 817, w = 513, },
},stretch = 3, filter = 1, },

{id = "lanebackground", dst = {
	{y = 263, a = 255, x = 1029, h = 817, w = 513, },
},stretch = 3, filter = 1, },

{offset = 3, id = "glow", timer = 40, dst = {
	{y = 263, a = 63.75, x = 378, h = 36, w = 513, },
},blend = 2, },

{offset = 3, id = "glow", timer = 140, dst = {
	{y = 263, a = 255, x = 378, h = 36, time = 0, w = 513, },
	{time = 1000, a = 0, },
},blend = 2, },

{offset = 3, id = "glow", timer = 40, dst = {
	{y = 263, a = 63.75, x = 1029, h = 36, w = 513, },
},blend = 2, },

{offset = 3, id = "glow", timer = 140, dst = {
	{y = 263, a = 255, x = 1029, h = 36, time = 0, w = 513, },
	{time = 1000, a = 0, },
},blend = 2, },

{id = "notes", },

{loop = 1300, filter = 1, id = "lanecover1", dst = {
	{y = 2160, x = 378, h = 817, time = 0, w = 513, acc = 2, },
	{time = 1300, y = 1080, },
},stretch = 3, },

{loop = 1300, filter = 1, id = "lanecover2", dst = {
	{y = 2160, x = 1029, h = 817, time = 0, w = 513, acc = 2, },
	{time = 1300, y = 1080, },
},stretch = 3, },

{id = "liftcover1", dst = {
	{y = -554, x = 378, h = 817, w = 513, },
},stretch = 3, filter = 1, },

{id = "liftcover2", dst = {
	{y = -554, x = 1029, h = 817, w = 513, },
},stretch = 3, filter = 1, },

{id = "hiddencover1", dst = {
	{y = -554, x = 378, h = 817, w = 513, },
},stretch = 3, filter = 1, },

{id = "hiddencover2", dst = {
	{y = -554, x = 1029, h = 817, w = 513, },
},stretch = 3, filter = 1, },

{loop = 1000, filter = 1, id = "finishcover1", timer = 143, dst = {
	{y = 1080, x = 378, h = 817, time = 0, w = 513, acc = 2, },
	{time = 1000, y = 263, },
},stretch = 3, },

{loop = 1000, filter = 1, id = "finishcover2", timer = 143, dst = {
	{y = 1080, x = 1029, h = 817, time = 0, w = 513, acc = 2, },
	{time = 1000, y = 263, },
},stretch = 3, },

{id = "lanecover-white", offset = 4, dst = {
	{y = 1086, x = 554.5, h = 26, w = 16, },
},op = {270}, },

{id = "liftcover-white", offset = 3, dst = {
	{y = 228, x = 554.5, h = 26, w = 16, },
},op = {270, 272}, },

{id = "duration-green", offset = 4, dst = {
	{y = 1086, x = 650.5, h = 26, w = 16, },
},op = {270}, },

{id = "duration-green", offset = 3, dst = {
	{y = 228, x = 650.5, h = 26, w = 16, },
},op = {270, 272}, },

{id = "lanecover-white", offset = 4, dst = {
	{y = 1086, x = 1205.5, h = 26, w = 16, },
},op = {270}, },

{id = "liftcover-white", offset = 3, dst = {
	{y = 228, x = 1205.5, h = 26, w = 16, },
},op = {270, 272}, },

{id = "duration-green", offset = 4, dst = {
	{y = 1086, x = 1301.5, h = 26, w = 16, },
},op = {270}, },

{id = "duration-green", offset = 3, dst = {
	{y = 228, x = 1301.5, h = 26, w = 16, },
},op = {270, 272}, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb11", timer = 51, dst = {
	{y = 114.5, x = 319, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg11", timer = 51, dst = {
	{y = 114.5, x = 319, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold11", timer = 71, dst = {
	{y = 114.5, x = 319, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold11-b", timer = 71, dst = {
	{y = 114.5, x = 319, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb21", timer = 61, dst = {
	{y = 114.5, x = 859, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg21", timer = 61, dst = {
	{y = 114.5, x = 859, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold21", timer = 81, dst = {
	{y = 114.5, x = 859, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold21-b", timer = 81, dst = {
	{y = 114.5, x = 859, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb12", timer = 52, dst = {
	{y = 114.5, x = 376, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg12", timer = 52, dst = {
	{y = 114.5, x = 376, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold12", timer = 72, dst = {
	{y = 114.5, x = 376, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold12-b", timer = 72, dst = {
	{y = 114.5, x = 376, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb22", timer = 62, dst = {
	{y = 114.5, x = 916, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg22", timer = 62, dst = {
	{y = 114.5, x = 916, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold22", timer = 82, dst = {
	{y = 114.5, x = 916, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold22-b", timer = 82, dst = {
	{y = 114.5, x = 916, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb13", timer = 53, dst = {
	{y = 114.5, x = 433, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg13", timer = 53, dst = {
	{y = 114.5, x = 433, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold13", timer = 73, dst = {
	{y = 114.5, x = 433, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold13-b", timer = 73, dst = {
	{y = 114.5, x = 433, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb23", timer = 63, dst = {
	{y = 114.5, x = 973, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg23", timer = 63, dst = {
	{y = 114.5, x = 973, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold23", timer = 83, dst = {
	{y = 114.5, x = 973, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold23-b", timer = 83, dst = {
	{y = 114.5, x = 973, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb14", timer = 54, dst = {
	{y = 114.5, x = 490, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg14", timer = 54, dst = {
	{y = 114.5, x = 490, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold14", timer = 74, dst = {
	{y = 114.5, x = 490, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold14-b", timer = 74, dst = {
	{y = 114.5, x = 490, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb24", timer = 64, dst = {
	{y = 114.5, x = 1030, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg24", timer = 64, dst = {
	{y = 114.5, x = 1030, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold24", timer = 84, dst = {
	{y = 114.5, x = 1030, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold24-b", timer = 84, dst = {
	{y = 114.5, x = 1030, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb15", timer = 55, dst = {
	{y = 114.5, x = 547, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg15", timer = 55, dst = {
	{y = 114.5, x = 547, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold15", timer = 75, dst = {
	{y = 114.5, x = 547, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold15-b", timer = 75, dst = {
	{y = 114.5, x = 547, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb25", timer = 65, dst = {
	{y = 114.5, x = 1087, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg25", timer = 65, dst = {
	{y = 114.5, x = 1087, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold25", timer = 85, dst = {
	{y = 114.5, x = 1087, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold25-b", timer = 85, dst = {
	{y = 114.5, x = 1087, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb16", timer = 56, dst = {
	{y = 114.5, x = 604, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg16", timer = 56, dst = {
	{y = 114.5, x = 604, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold16", timer = 76, dst = {
	{y = 114.5, x = 604, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold16-b", timer = 76, dst = {
	{y = 114.5, x = 604, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb26", timer = 66, dst = {
	{y = 114.5, x = 1144, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg26", timer = 66, dst = {
	{y = 114.5, x = 1144, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold26", timer = 86, dst = {
	{y = 114.5, x = 1144, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold26-b", timer = 86, dst = {
	{y = 114.5, x = 1144, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb17", timer = 57, dst = {
	{y = 114.5, x = 661, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg17", timer = 57, dst = {
	{y = 114.5, x = 661, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold17", timer = 77, dst = {
	{y = 114.5, x = 661, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold17-b", timer = 77, dst = {
	{y = 114.5, x = 661, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb27", timer = 67, dst = {
	{y = 114.5, x = 1201, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg27", timer = 67, dst = {
	{y = 114.5, x = 1201, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold27", timer = 87, dst = {
	{y = 114.5, x = 1201, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold27-b", timer = 87, dst = {
	{y = 114.5, x = 1201, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb1s", timer = 50, dst = {
	{y = 114.5, x = 232, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg1s", timer = 50, dst = {
	{y = 114.5, x = 232, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold1s", timer = 70, dst = {
	{y = 114.5, x = 232, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold1s-b", timer = 70, dst = {
	{y = 114.5, x = 232, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bomb2s", timer = 60, dst = {
	{y = 114.5, x = 1288, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "bombpg2s", timer = 60, dst = {
	{y = 114.5, x = 1288, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{filter = 1, offsets = {3}, id = "hold2s", timer = 80, dst = {
	{y = 114.5, x = 1288, h = 300, time = 0, w = 400, },
},blend = 2, },

{loop = -1, filter = 1, offsets = {3}, id = "hold2s-b", timer = 80, dst = {
	{y = 114.5, x = 1288, h = 300, time = 0, w = 400, },
	{time = 250, },
},blend = 2, },

{id = "judge1", },

{id = "judge2", },

{loop = -1, offsets = {3, 32, 33}, id = "ghost-mybest", timer = 46, dst = {
	{y = 600, x = 580.5, h = 20, time = 0, w = 18, },
	{time = 500, },
},},

{loop = -1, offsets = {3, 32, 33}, id = "ghost-mybest", timer = 47, dst = {
	{y = 600, x = 1231.5, h = 20, time = 0, w = 18, },
	{time = 500, },
},},

{id = "hiterrorvisualizer", dst = {
	{y = 230, a = 168, x = 489, h = 12, w = 402, },
},},

{id = "bpmgraph", dst = {
	{y = 160, a = 168, x = 489, h = 60, w = 402, },
},},

{id = "ex-rate-dot", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:30-30, dst = {
	{y = 330, x = 634.5, h = 17, w = 13, },
},},

{id = "ex-rate-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:31-31, dst = {
	{y = 330, x = 595.5, h = 17, w = 13, },
},},

{id = "ex-rate-ad-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:32-32, dst = {
	{y = 330, x = 647.5, h = 17, w = 13, },
},},

{id = "ex-rate-dot", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:30-30, dst = {
	{y = 330, x = 1285.5, h = 17, w = 13, },
},},

{id = "ex-rate-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:31-31, dst = {
	{y = 330, x = 1246.5, h = 17, w = 13, },
},},

{id = "ex-rate-ad-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:32-32, dst = {
	{y = 330, x = 1298.5, h = 17, w = 13, },
},},

{id = "line1", dst = {
	{y = 1035, x = 19, h = 3, w = 300, },
},},

{id = "line2", dst = {
	{y = 735, x = 319, h = 300, w = 3, },
},},

{id = "line3", dst = {
	{y = 732, x = 19, h = 3, w = 300, },
},},

{id = "line4", dst = {
	{y = 735, x = 16, h = 300, w = 3, },
},},

{id = "corner1", dst = {
	{y = 1035, x = 16, h = 3, w = 3, },
},},

{id = "corner2", dst = {
	{y = 1035, x = 319, h = 3, w = 3, },
},},

{id = "corner3", dst = {
	{y = 732, x = 319, h = 3, w = 3, },
},},

{id = "corner4", dst = {
	{y = 732, x = 16, h = 3, w = 3, },
},},

{id = "ex-dpframe", dst = {
	{y = 0, a = 0, x = 0, h = 1080, time = 0, w = 1920, },
	{time = 800, },
	{time = 900, a = 255, },
},loop = 900, },

{id = "ex-rate-dot", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:30-30, dst = {
	{y = 330, x = 634.5, h = 17, w = 13, },
},},

{id = "ex-rate-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:31-31, dst = {
	{y = 330, x = 595.5, h = 17, w = 13, },
},},

{id = "ex-rate-ad-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:32-32, dst = {
	{y = 330, x = 647.5, h = 17, w = 13, },
},},

{id = "ex-rate-dot", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:30-30, dst = {
	{y = 330, x = 1285.5, h = 17, w = 13, },
},},

{id = "ex-rate-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:31-31, dst = {
	{y = 330, x = 1246.5, h = 17, w = 13, },
},},

{id = "ex-rate-ad-n", timer = 41, draw = function: @skin\simple-play-simple-ver0.52\system\..\customize\extension\判定下レート表示/parts.lua:32-32, dst = {
	{y = 330, x = 1298.5, h = 17, w = 13, },
},},

{id = -111, dst = {
	{y = 263, a = 0, x = 378, h = 817, time = 600, w = 513, acc = 1, },
	{a = 32, time = 650, acc = 2, },
	{time = 950, a = 0, },
},loop = 950, },

{loop = 800, op = {80}, filter = 1, offsets = {3}, id = "load-music-title", dst = {
	{y = 298, a = 0, x = 384, h = 36, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {80}, filter = 1, offsets = {3}, id = "load-music-genre", dst = {
	{y = 362, a = 0, x = 384, h = 16, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {80}, filter = 1, offsets = {3}, id = "load-music-artist", dst = {
	{y = 386, a = 0, x = 384, h = 16, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {80}, filter = 1, offsets = {3}, id = "load-table", dst = {
	{y = 410, a = 0, x = 384, h = 16, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {1080}, filter = 1, offsets = {3}, id = "load-music-title", dst = {
	{y = 298, a = 0, x = 384, h = 36, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {1080}, filter = 1, offsets = {3}, id = "load-music-genre", dst = {
	{y = 362, a = 0, x = 384, h = 16, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {1080}, filter = 1, offsets = {3}, id = "load-music-artist", dst = {
	{y = 386, a = 0, x = 384, h = 16, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = 800, op = {1080}, filter = 1, offsets = {3}, id = "load-table", dst = {
	{y = 410, a = 0, x = 384, h = 16, time = 650, w = 501, },
	{time = 800, a = 128, },
},},

{loop = -1, filter = 1, offsets = {3}, id = "load-music-title", timer = 40, dst = {
	{y = 298, a = 128, x = 384, h = 36, time = 0, w = 501, acc = 2, },
	{time = 800, a = 0, },
},},

{loop = -1, filter = 1, offsets = {3}, id = "load-music-genre", timer = 40, dst = {
	{y = 362, a = 128, x = 384, h = 16, time = 0, w = 501, acc = 2, },
	{time = 800, a = 0, },
},},

{loop = -1, filter = 1, offsets = {3}, id = "load-music-artist", timer = 40, dst = {
	{y = 386, a = 128, x = 384, h = 16, time = 0, w = 501, acc = 2, },
	{time = 800, a = 0, },
},},

{loop = -1, filter = 1, offsets = {3}, id = "load-table", timer = 40, dst = {
	{y = 410, a = 128, x = 384, h = 16, time = 0, w = 501, acc = 2, },
	{time = 800, a = 0, },
},},

{loop = 200, op = {80, 184}, offsets = {3}, id = "judge-veryeasy", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 183}, offsets = {3}, id = "judge-easy", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 182}, offsets = {3}, id = "judge-normal", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 181}, offsets = {3}, id = "judge-hard", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 180}, offsets = {3}, id = "judge-veryhard", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {184, 1080}, offsets = {3}, id = "judge-veryeasy", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {183, 1080}, offsets = {3}, id = "judge-easy", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {182, 1080}, offsets = {3}, id = "judge-normal", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {181, 1080}, offsets = {3}, id = "judge-hard", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {180, 1080}, offsets = {3}, id = "judge-veryhard", dst = {
	{y = 272, a = 0, x = 683, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = -1, op = {184}, offsets = {3}, id = "judge-veryeasy", timer = 40, dst = {
	{y = 276, a = 255, x = 683, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {183}, offsets = {3}, id = "judge-easy", timer = 40, dst = {
	{y = 276, a = 255, x = 683, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {182}, offsets = {3}, id = "judge-normal", timer = 40, dst = {
	{y = 276, a = 255, x = 683, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {181}, offsets = {3}, id = "judge-hard", timer = 40, dst = {
	{y = 276, a = 255, x = 683, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {180}, offsets = {3}, id = "judge-veryhard", timer = 40, dst = {
	{y = 276, a = 255, x = 683, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{id = -111, dst = {
	{y = 263, a = 0, x = 1029, h = 817, time = 600, w = 513, acc = 1, },
	{a = 32, time = 650, acc = 2, },
	{time = 950, a = 0, },
},loop = 950, },

{loop = 200, op = {80}, filter = 1, offsets = {3}, id = -100, dst = {
	{y = 302, a = 0, x = 1093.125, h = 384.75, time = 0, w = 384.75, },
	{time = 200, a = 255, },
},stretch = 1, },

{loop = -1, filter = 1, offsets = {3}, id = -100, timer = 40, dst = {
	{y = 302, a = 255, x = 1093.125, h = 384.75, time = 0, w = 384.75, },
	{time = 500, a = 0, },
},stretch = 1, },

{loop = 200, op = {80, 184}, offsets = {3}, id = "judge-veryeasy", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 183}, offsets = {3}, id = "judge-easy", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 182}, offsets = {3}, id = "judge-normal", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 181}, offsets = {3}, id = "judge-hard", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {80, 180}, offsets = {3}, id = "judge-veryhard", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {184, 1080}, offsets = {3}, id = "judge-veryeasy", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {183, 1080}, offsets = {3}, id = "judge-easy", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {182, 1080}, offsets = {3}, id = "judge-normal", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {181, 1080}, offsets = {3}, id = "judge-hard", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = 200, op = {180, 1080}, offsets = {3}, id = "judge-veryhard", dst = {
	{y = 272, a = 0, x = 1334, h = 24, time = 0, w = 204, },
	{y = 276, a = 255, time = 200, },
},},

{loop = -1, op = {184}, offsets = {3}, id = "judge-veryeasy", timer = 40, dst = {
	{y = 276, a = 255, x = 1334, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {183}, offsets = {3}, id = "judge-easy", timer = 40, dst = {
	{y = 276, a = 255, x = 1334, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {182}, offsets = {3}, id = "judge-normal", timer = 40, dst = {
	{y = 276, a = 255, x = 1334, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {181}, offsets = {3}, id = "judge-hard", timer = 40, dst = {
	{y = 276, a = 255, x = 1334, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{loop = -1, op = {180}, offsets = {3}, id = "judge-veryhard", timer = 40, dst = {
	{y = 276, a = 255, x = 1334, h = 24, time = 0, w = 204, },
	{time = 500, a = 0, },
},},

{offset = 3, loop = -1, id = "ready", timer = 40, dst = {
	{y = 420, a = 0, x = 472.5, h = 36, time = 0, w = 324, },
	{time = 100, a = 255, },
	{time = 800, },
	{y = 402, a = 0, time = 1000, },
},},

{offset = 3, loop = -1, id = "ready", timer = 40, dst = {
	{y = 420, a = 0, x = 1123.5, h = 36, time = 0, w = 324, },
	{time = 100, a = 255, },
	{time = 800, },
	{y = 402, a = 0, time = 1000, },
},},

{loop = -1, id = "fc-effect", timer = 48, dst = {
	{y = 260, a = 128, x = 375, h = 820, time = 0, w = 519, },
	{y = 360, a = 0, time = 2100, },
},stretch = 3, blend = 2, },

{id = "fullcombo", timer = 48, dst = {
	{y = 420, a = 0, x = 454.5, h = 36, time = 550, w = 360, },
	{time = 650, a = 255, },
	{time = 1600, },
	{y = 402, a = 0, time = 1800, },
},loop = -1, },

{loop = -1, id = "fc-effect", timer = 48, dst = {
	{y = 260, a = 128, x = 1026, h = 820, time = 0, w = 519, },
	{y = 360, a = 0, time = 2100, },
},stretch = 3, blend = 2, },

{id = "fullcombo", timer = 48, dst = {
	{y = 420, a = 0, x = 1105.5, h = 36, time = 550, w = 360, },
	{time = 650, a = 255, },
	{time = 1600, },
	{y = 402, a = 0, time = 1800, },
},loop = -1, },

{id = -110, timer = 2, dst = {
	{y = 0, a = 0, x = 0, h = 1080, time = 0, w = 1920, },
	{time = 500, a = 255, },
},loop = 500, },

{id = "error-1", dst = {
	{y = 1058, x = 0, h = 20, r = 255, b = 60, w = 20, g = 200, },
},}



-- skin.judge ------------------------------------
{loop = -1, filter = 1, offsets = {3, 32}, id = "hub-mcjudgef-pg", timer = 46, dst = {
	{y = 401, x = 513, h = 84, time = 0, w = 227, },
	{time = 500, },
},},

{loop = -1, filter = 1, offsets = {3, 32}, id = "hub-mcjudgef-gr", timer = 46, dst = {
	{y = 401, x = 513, h = 84, time = 0, w = 227, },
	{time = 500, },
},},

{loop = -1, filter = 1, offsets = {3, 32}, id = "hub-mcjudgef-gd", timer = 46, dst = {
	{y = 401, x = 513, h = 84, time = 0, w = 227, },
	{time = 500, },
},},

{loop = -1, filter = 1, offsets = {3, 32}, id = "hub-mcjudgef-bd", timer = 46, dst = {
	{y = 401, x = 513, h = 84, time = 0, w = 227, },
	{time = 500, },
},},

{loop = -1, filter = 1, offsets = {3, 32}, id = "hub-mcjudgef-pr", timer = 46, dst = {
	{y = 401, x = 513, h = 84, time = 0, w = 227, },
	{time = 500, },
},},

{loop = -1, filter = 1, offsets = {3, 32}, id = "hub-mcjudgef-ms", timer = 46, dst = {
	{y = 401, x = 513, h = 84, time = 0, w = 227, },
	{time = 500, },
},}{loop = -1, filter = 1, id = "hub-mcjudgen-pg", timer = 46, dst = {
	{y = 0, x = 237, h = 84, time = 0, w = 55, },
	{time = 500, },
},},

{loop = -1, filter = 1, id = "hub-mcjudgen-gr", timer = 46, dst = {
	{y = 0, x = 237, h = 84, time = 0, w = 55, },
	{time = 500, },
},},

{loop = -1, filter = 1, id = "hub-mcjudgen-gd", timer = 46, dst = {
	{y = 0, x = 237, h = 84, time = 0, w = 55, },
	{time = 500, },
},},

{loop = -1, filter = 1, id = "hub-mcjudgen-bd", timer = 46, dst = {
	{y = 0, x = 237, h = 84, time = 0, w = 55, },
	{time = 500, },
},},

{loop = -1, filter = 1, id = "hub-mcjudgen-pr", timer = 46, dst = {
	{y = 0, x = 237, h = 84, time = 0, w = 55, },
	{time = 500, },
},},

{loop = -1, filter = 1, id = "hub-mcjudgen-ms", timer = 46, dst = {
	{y = 0, x = 237, h = 84, time = 0, w = 55, },
	{time = 500, },
},}
<<<<<<< HEAD
/datum/asset/simple/tgui
	keep_local_name = TRUE
=======
/datum/asset_pack/simple/tgui
	// debug server requires unmangled names to target
	do_not_mangle = TRUE
	// do not separate for debugging purposes
	do_not_separate = TRUE
>>>>>>> 275a3f223 (fix tgui assets, removes some unused tgui files, updates tgui dependencies (#6641))
	assets = list(
		"tgui.bundle.js" = file("tgui/public/tgui.bundle.js"),
		"tgui.bundle.css" = file("tgui/public/tgui.bundle.css"),
	)

<<<<<<< HEAD
/datum/asset/simple/tgui_panel
	keep_local_name = TRUE
=======
/datum/asset_pack/simple/tgui_panel
	// debug server requires unmangled names to target
	do_not_mangle = TRUE
	// do not separate for debugging purposes
	do_not_separate = TRUE
>>>>>>> 275a3f223 (fix tgui assets, removes some unused tgui files, updates tgui dependencies (#6641))
	assets = list(
		"tgui-panel.bundle.js" = file("tgui/public/tgui-panel.bundle.js"),
		"tgui-panel.bundle.css" = file("tgui/public/tgui-panel.bundle.css"),
	)

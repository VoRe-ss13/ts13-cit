// Helper tool to see fishing probabilities with different setups
/datum/admins/proc/fishing_calculator()
	set name = "Fishing Calculator"
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	owner.open_fishing_calculator()

/client/proc/open_fishing_calculator()
	var/datum/fishing_calculator/ui = new
	ui.ui_interact(mob)

/datum/fishing_calculator
	var/list/current_table

/datum/fishing_calculator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "FishingCalculator")
		ui.open()

/datum/fishing_calculator/ui_state()
	return GLOB.always_state

/datum/fishing_calculator/on_ui_close(mob/user, datum/tgui/ui, embedded)
	qdel(src)

/datum/fishing_calculator/ui_static_data(mob/user, datum/tgui/ui)
	. = ..()
	.["rod_types"] = typesof(/obj/item/fishing_rod)
	.["hook_types"] = typesof(/obj/item/fishing_hook)
	.["line_types"] = typesof(/obj/item/fishing_line)
	.["spot_types"] = subtypesof(/datum/fish_source)

/datum/fishing_calculator/ui_data(mob/user, datum/tgui/ui)
	return list("info" = current_table)

/datum/fishing_calculator/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	var/mob/user = usr
	switch(action)
		if("recalc")
			var/rod_type = text2path(params["rod"])
			var/bait_type = text2path(params["bait"])
			var/hook_type = text2path(params["hook"])
			var/line_type = text2path(params["line"])
			var/spot_type = text2path(params["spot"]) || params["spot"] //can be also key from presets

			//validate here against nonsense values
			var/datum/fish_source/spot = fetch_fish_source(spot_type)

			var/obj/item/fishing_rod/temporary_rod = new rod_type
			if(bait_type)
				temporary_rod.bait = new bait_type
			if(hook_type)
				temporary_rod.hook = new hook_type
			if(line_type)
				temporary_rod.line = new line_type
			var/result_table = list()
			var/modified_table = spot.get_modified_fish_table(temporary_rod,user)
			for(var/result_type in spot.fish_table) // through this not modified to display 0 chance ones too
				var/list/info = list()
				info["result"] = result_type
				info["weight"] = modified_table[result_type] || 0
				info["difficulty"] = spot.calculate_difficulty(result_type,temporary_rod, user)
				info["count"] = spot.fish_counts[result_type] || "Infinite"
				result_table += list(info)
			current_table = result_table
			qdel(temporary_rod)
			return TRUE

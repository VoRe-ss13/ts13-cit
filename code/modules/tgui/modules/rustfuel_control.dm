/datum/tgui_module_old/rustfuel_control
	name = "Fuel Injector Control"
	tgui_id = "RustFuelControl"

	var/fuel_tag = ""

/datum/tgui_module_old/rustfuel_control/ui_act(action, list/params, datum/tgui/ui)
	if(..())
		return TRUE

	switch(action)
		if("toggle_active")
			var/obj/machinery/fusion_fuel_injector/FI = locate(params["fuel"]) in GLOB.fuel_injectors
			if(!istype(FI))
				return FALSE

			if(FI.injecting)
				FI.StopInjecting()
			else
				FI.BeginInjecting()

			return TRUE

		if("set_tag")
			var/new_ident = sanitize_istext(input("Enter a new ident tag.", "Gyrotron Control", fuel_tag) as null|text)
			if(new_ident)
				fuel_tag = new_ident

/datum/tgui_module_old/rustfuel_control/ui_data(mob/user, datum/tgui/ui)
	var/list/data = list()
	var/list/fuels = list()

	for(var/obj/machinery/fusion_fuel_injector/FI in GLOB.fuel_injectors)
		if(FI.id_tag == fuel_tag)
			fuels.Add(list(list(
				"name" = FI.name,
				"active" = FI.injecting,
				"fuel_type" = (FI.cur_assembly ? FI.cur_assembly.fuel_type : "NONE"),
				"fuel_amt" = (FI.cur_assembly ? "[FI.cur_assembly.percent_depleted * 100]%" : "NONE"),
				"deployed" = FI.anchored,
				"x" = FI.x,
				"y" = FI.y,
				"z" = FI.z,
				"ref" = "\ref[FI]"
			)))

	data["fuels"] = fuels
	return data

/datum/tgui_module_old/rustfuel_control/ntos
	ntos = TRUE

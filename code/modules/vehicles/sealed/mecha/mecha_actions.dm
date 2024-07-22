//AEIOU
//
//THIS FILE CONTAINS THE CODE TO ADD THE HUD BUTTONS AND THE MECH ACTIONS THEMSELVES.
//
//
// I better get some free food for this..



//
/// Adding the buttons things to the player. The interactive, top left things, at least at time of writing.
/// If you want it to be only for a special mech, you have to go and make an override like in the durand mech.
//

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/obj/mecha/proc/GrantActions(mob/living/user, human_occupant = 0)
	if(human_occupant)
		eject_action.grant(user, src)
	internals_action.grant(user, src)
	cycle_action.grant(user, src)
	lights_action.grant(user, src)
	stats_action.grant(user, src)
	strafing_action.grant(user, src)//The defaults.

	if(defence_mode_possible)
		defence_action.grant(user, src)
	if(overload_possible)
		overload_action.grant(user, src)
	if(smoke_possible)
		smoke_action.grant(user, src)
	if(zoom_possible)
		zoom_action.grant(user, src)
	if(thrusters_possible)
		thrusters_action.grant(user, src)
	if(phasing_possible)
		phasing_action.grant(user, src)
	if(switch_dmg_type_possible)
		switch_damtype_action.grant(user, src)
	if(cloak_possible)
		cloak_action.grant(user, src)

/obj/mecha/proc/RemoveActions(mob/living/user, human_occupant = 0)
	if(human_occupant)
		eject_action.remove(user, src)
	internals_action.remove(user, src)
	cycle_action.remove(user, src)
	lights_action.remove(user, src)
	stats_action.remove(user, src)
	strafing_action.remove(user, src)

	defence_action.remove(user, src)
	smoke_action.remove(user, src)
	zoom_action.remove(user, src)
	thrusters_action.remove(user, src)
	phasing_action.remove(user, src)
	switch_damtype_action.remove(user, src)
	overload_action.remove(user, src)
	cloak_action.remove(user, src)
=======
/obj/vehicle/sealed/mecha/proc/GrantActions(mob/living/user, human_occupant = 0)
	for(var/datum/action/action in list(
		internals_action,
		cycle_action,
		lights_action,
		stats_action,
		strafing_action,
		defence_mode_possible && defence_action,
		overload_possible && overload_action,
		smoke_possible && smoke_action,
		zoom_possible && zoom_action,
		thrusters_possible && thrusters_action,
		phasing_possible && phasing_action,
		switch_dmg_type_possible && switch_damtype_action,
		cloak_possible && cloak_action,
	))
		action.grant(user.actions_controlled)

/obj/vehicle/sealed/mecha/proc/RemoveActions(mob/living/user, human_occupant = 0)
	for(var/datum/action/action in list(
		internals_action,
		cycle_action,
		lights_action,
		stats_action,
		strafing_action,
		defence_action,
		smoke_action,
		zoom_action,
		thrusters_action,
		phasing_action,
		switch_damtype_action,
		overload_action,
		cloak_action,
	))
		action.revoke(user.actions_controlled)
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm


//
////BUTTONS STUFF
//

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha
	check_flags = ACTION_CHECK_RESTRAINED | ACTION_CHECK_STUNNED | ACTION_CHECK_ALIVE
	button_icon = 'icons/effects/actions_mecha.dmi'
	var/obj/mecha/chassis
=======
/datum/action/mecha
	check_mobility_flags = MOBILITY_CAN_USE
	button_icon = 'icons/screen/actions/mecha.dmi'
	target_type = /obj/vehicle/sealed/mecha
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm

// todo: this is shitcode
/datum/action/innate/mecha/grant(mob/living/T, obj/mecha/M)
	if(M)
		chassis = M
	..()


/datum/action/innate/mecha/mech_toggle_lights
	name = "Toggle Lights"
	button_icon_state = "mech_lights_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_toggle_lights/Activate()
=======
/datum/action/mecha/mech_toggle_lights/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.lights()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_lights_[chassis.lights ? "off" : "on"]"
	button.UpdateIcon()
	chassis.lights()



/datum/action/innate/mecha/mech_toggle_internals
	name = "Toggle Internal Airtank Usage"
	button_icon_state = "mech_internals_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_toggle_internals/Activate()
=======
/datum/action/mecha/mech_toggle_internals/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_internals_[chassis.use_internal_tank ? "off" : "on"]"
	button.UpdateIcon()
	chassis.internal_tank()



/datum/action/innate/mecha/mech_view_stats
	name = "View stats"
	button_icon_state = "mech_view_stats"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_view_stats/Activate()
	chassis.view_stats()



/datum/action/innate/mecha/mech_eject
	name = "Eject From Mech"
	button_icon_state = "mech_eject"

/datum/action/innate/mecha/mech_eject/Activate()
	chassis.go_out()



/datum/action/innate/mecha/strafe
	name = "Toggle Mech Strafing"
	button_icon_state = "mech_strafe_off"

/datum/action/innate/mecha/strafe/Activate()
=======
/datum/action/mecha/mech_view_stats/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.view_stats()

/datum/action/mecha/strafe
	name = "Toggle Mech Strafing"
	button_icon_state = "mech_strafe_off"

/datum/action/mecha/strafe/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.strafing()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_strafe_[chassis.strafing ? "off" : "on"]"
	button.UpdateIcon()
	chassis.strafing()



/datum/action/innate/mecha/mech_defence_mode
	name = "Toggle Mech defence mode"
	button_icon_state = "mech_defense_mode_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_defence_mode/Activate()
=======
/datum/action/mecha/mech_defence_mode/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.defence_mode()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_defense_mode_[chassis.defence_mode ? "off" : "on"]"
	button.UpdateIcon()
	chassis.defence_mode()



/datum/action/innate/mecha/mech_overload_mode
	name = "Toggle Mech Leg Overload"
	button_icon_state = "mech_overload_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_overload_mode/Activate()
=======
/datum/action/mecha/mech_overload_mode/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.overload()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_overload_[chassis.overload ? "off" : "on"]"
	button.UpdateIcon()
	chassis.overload()



/datum/action/innate/mecha/mech_smoke
	name = "Toggle Mech Smoke"
	button_icon_state = "mech_smoke_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_smoke/Activate()
	//button_icon_state = "mech_smoke_[chassis.smoke ? "off" : "on"]"
	//button.UpdateIcon()	//Dual colors notneeded ATM
=======
/datum/action/mecha/mech_smoke/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	chassis.smoke()



/datum/action/innate/mecha/mech_zoom
	name = "Toggle Mech Zoom"
	button_icon_state = "mech_zoom_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_zoom/Activate()
=======
/datum/action/mecha/mech_zoom/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.zoom()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_zoom_[chassis.zoom ? "off" : "on"]"
	button.UpdateIcon()
	chassis.zoom()



/datum/action/innate/mecha/mech_toggle_thrusters
	name = "Toggle Mech thrusters"
	button_icon_state = "mech_thrusters_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_toggle_thrusters/Activate()
=======
/datum/action/mecha/mech_toggle_thrusters/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
	chassis.thrusters()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_thrusters_[chassis.thrusters ? "off" : "on"]"
	button.UpdateIcon()
	chassis.thrusters()



/datum/action/innate/mecha/mech_cycle_equip	//I'll be honest, i don't understand this part, buuuuuut it works!
	name = "Cycle Equipment"
	button_icon_state = "mech_cycle_equip_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_cycle_equip/Activate()
=======
/datum/action/mecha/mech_cycle_equip/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return

	var/obj/vehicle/sealed/mecha/chassis = target
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm

	var/list/available_equipment = list()
	available_equipment = chassis.equipment

	if(chassis.weapons_only_cycle)
		available_equipment = chassis.weapon_equipment

	if(available_equipment.len == 0)
		chassis.occupant_message("No equipment available.")
		return
	if(!chassis.selected)
		chassis.selected = available_equipment[1]
		chassis.occupant_message("You select [chassis.selected]")
		send_byjax(chassis.occupant_legacy,"exosuit.browser","eq_list",chassis.get_equipment_list())
		button_icon_state = "mech_cycle_equip_on"
		button.UpdateIcon()
		return
	var/number = 0
	for(var/A in available_equipment)
		number++
		if(A == chassis.selected)
			if(available_equipment.len == number)
				chassis.selected = null
				chassis.occupant_message("You switch to no equipment")
				button_icon_state = "mech_cycle_equip_off"
			else
				chassis.selected = available_equipment[number+1]
				chassis.occupant_message("You switch to [chassis.selected]")
				button_icon_state = "mech_cycle_equip_on"
<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
			send_byjax(chassis.occupant,"exosuit.browser","eq_list",chassis.get_equipment_list())
			button.UpdateIcon()
=======
			send_byjax(chassis.occupant_legacy,"exosuit.browser","eq_list",chassis.get_equipment_list())
			update_buttons()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
			return



/datum/action/innate/mecha/mech_switch_damtype
	name = "Reconfigure arm microtool arrays"
	button_icon_state = "mech_damtype_brute"


<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_switch_damtype/Activate()


=======
/datum/action/mecha/mech_switch_damtype/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return

	var/obj/vehicle/sealed/mecha/chassis = target
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_damtype_[chassis.damtype]"
	playsound(src, 'sound/mecha/mechmove01.ogg', 50, 1)
	button.UpdateIcon()
	chassis.query_damtype()



/datum/action/innate/mecha/mech_toggle_phasing
	name = "Toggle Mech phasing"
	button_icon_state = "mech_phasing_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_toggle_phasing/Activate()
=======
/datum/action/mecha/mech_toggle_phasing/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_phasing_[chassis.phasing ? "off" : "on"]"
	button.UpdateIcon()
	chassis.phasing()



/datum/action/innate/mecha/mech_toggle_cloaking
	name = "Toggle Mech phasing"
	button_icon_state = "mech_phasing_off"

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm
/datum/action/innate/mecha/mech_toggle_cloaking/Activate()
=======
/datum/action/mecha/mech_toggle_cloaking/invoke_target(obj/vehicle/sealed/mecha/target, datum/event_args/actor/actor)
	. = ..()
	if(.)
		return
	var/obj/vehicle/sealed/mecha/chassis = target
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	button_icon_state = "mech_phasing_[chassis.cloaked ? "off" : "on"]"
	button.UpdateIcon()
	chassis.toggle_cloaking()



/////
/////
/////		ACTUAL MECANICS FOR THE ACTIONS
/////		OVERLOAD, DEFENCE, SMOKE
/////
/////

<<<<<<< HEAD:code/game/mecha/mecha_actions.dm

/obj/mecha/verb/toggle_defence_mode()
=======
/obj/vehicle/sealed/mecha/verb/toggle_defence_mode()
>>>>>>> 912e379ff (vehicle mechs - preliminary (#6606)):code/modules/vehicles/sealed/mecha/mecha_actions.dm
	set category = "Exosuit Interface"
	set name = "Toggle defence mode"
	set src = usr.loc
	set popup_menu = 0
	defence_mode()

/obj/vehicle/sealed/mecha/proc/defence_mode()
	if(usr!=src.occupant_legacy)
		return
	playsound(src, 'sound/mecha/duranddefencemode.ogg', 50, 1)
	defence_mode = !defence_mode
	if(defence_mode)
		deflect_chance = defence_deflect
		src.occupant_message("<font color='blue'>You enable [src] defence mode.</font>")
	else
		deflect_chance = initial(deflect_chance)
		src.occupant_message("<font color='red'>You disable [src] defence mode.</font>")
	src.log_message("Toggled defence mode.")
	return



/obj/vehicle/sealed/mecha/verb/toggle_overload()
	set category = "Exosuit Interface"
	set name = "Toggle leg actuators overload"
	set src = usr.loc
	set popup_menu = 0
	overload()

/obj/vehicle/sealed/mecha/proc/overload()
	if(usr.stat == 1)//No manipulating things while unconcious.
		return
	if(usr!=src.occupant_legacy)
		return
	if(integrity < initial(integrity) - initial(integrity)/3)//Same formula as in movement, just beforehand.
		src.occupant_message("<font color='red'>Leg actuators damage critical, unable to engage overload.</font>")
		overload = 0	//Just to be sure
		return
	if(overload)
		overload = 0
		step_energy_drain = initial(step_energy_drain)
		src.occupant_message("<font color='blue'>You disable leg actuators overload.</font>")
	else
		overload = 1
		step_energy_drain = step_energy_drain*overload_coeff
		src.occupant_message("<font color='red'>You enable leg actuators overload.</font>")
	src.log_message("Toggled leg actuators overload.")
	playsound(src, 'sound/mecha/mechanical_toggle.ogg', 50, 1)
	return


/obj/vehicle/sealed/mecha/verb/toggle_smoke()
	set category = "Exosuit Interface"
	set name = "Activate Smoke"
	set src = usr.loc
	set popup_menu = 0
	smoke()

/obj/vehicle/sealed/mecha/proc/smoke()
	if(usr!=src.occupant_legacy)
		return

	if(smoke_reserve < 1)
		src.occupant_message("<font color='red'>You don't have any smoke left in stock!</font>")
		return

	if(smoke_ready)
		smoke_reserve--	//Remove ammo
		src.occupant_message("<font color='red'>Smoke fired. [smoke_reserve] usages left.</font>")

		var/datum/effect_system/smoke_spread/smoke = new /datum/effect_system/smoke_spread()
		smoke.attach(src)
		smoke.set_up(10, 0, usr.loc)
		smoke.start()
		playsound(src, 'sound/effects/smoke.ogg', 50, 1, -3)

		smoke_ready = 0
		spawn(smoke_cooldown)
			smoke_ready = 1
	return



/obj/vehicle/sealed/mecha/verb/toggle_zoom()
	set category = "Exosuit Interface"
	set name = "Zoom"
	set src = usr.loc
	set popup_menu = 0
	zoom()

/obj/vehicle/sealed/mecha/proc/zoom()//This could use improvements but maybe later.
	if(usr!=src.occupant_legacy)
		return
	if(src.occupant_legacy.client)
		var/client/myclient = src.occupant_legacy.client
		src.zoom = !src.zoom
		src.log_message("Toggled zoom mode.")
		src.occupant_message("<font color='[src.zoom?"blue":"red"]'>Zoom mode [zoom?"en":"dis"]abled.</font>")
		if(zoom)
			myclient.set_temporary_view(GLOB.max_client_view_x + 5, GLOB.max_client_view_y + 5)
			src.occupant_legacy << sound('sound/mecha/imag_enh.ogg',volume=50)
		else
			myclient.reset_temporary_view()
	return



/obj/vehicle/sealed/mecha/verb/toggle_thrusters()
	set category = "Exosuit Interface"
	set name = "Toggle thrusters"
	set src = usr.loc
	set popup_menu = 0
	thrusters()

/obj/vehicle/sealed/mecha/proc/thrusters()
	if(usr!=src.occupant_legacy)
		return
	if(src.occupant_legacy)
		if(get_charge() > 0)
			thrusters = !thrusters
			src.log_message("Toggled thrusters.")
			src.occupant_message("<font color='[src.thrusters?"blue":"red"]'>Thrusters [thrusters?"en":"dis"]abled.</font>")
	return



/obj/vehicle/sealed/mecha/verb/switch_damtype()
	set category = "Exosuit Interface"
	set name = "Change melee damage type"
	set src = usr.loc
	set popup_menu = 0
	query_damtype()

/obj/vehicle/sealed/mecha/proc/query_damtype()
	if(usr!=src.occupant_legacy)
		return
	var/new_damtype = alert(src.occupant_legacy,"Melee Damage Type",null,"Brute","Fire","Toxic")
	switch(new_damtype)
		if("Brute")
			damtype = "brute"
			src.occupant_message("Your exosuit's hands form into fists.")
		if("Fire")
			damtype = "fire"
			src.occupant_message("A torch tip extends from your exosuit's hand, glowing red.")
		if("Toxic")
			damtype = "tox"
			src.occupant_message("A bone-chillingly thick plasteel needle protracts from the exosuit's palm.")
	src.occupant_message("Melee damage type switched to [new_damtype]")
	return



/obj/vehicle/sealed/mecha/verb/toggle_phasing()
	set category = "Exosuit Interface"
	set name = "Toggle phasing"
	set src = usr.loc
	set popup_menu = 0
	phasing()

/obj/vehicle/sealed/mecha/proc/phasing()
	if(usr!=src.occupant_legacy)
		return
	phasing = !phasing
	send_byjax(src.occupant_legacy,"exosuit.browser","phasing_command","[phasing?"Dis":"En"]able phasing")
	src.occupant_message("<font color=\"[phasing?"#00f\">En":"#f00\">Dis"]abled phasing.</font>")
	return


/obj/vehicle/sealed/mecha/verb/toggle_cloak()
	set category = "Exosuit Interface"
	set name = "Toggle cloaking"
	set src = usr.loc
	set popup_menu = 0
	toggle_cloaking()

/obj/vehicle/sealed/mecha/proc/toggle_cloaking()
	if(usr!=src.occupant_legacy)
		return

	if(cloaked)
		uncloak()
	else
		cloak()

	src.occupant_message("<font color=\"[cloaked?"#00f\">En":"#f00\">Dis"]abled cloaking.</font>")
	return

/obj/vehicle/sealed/mecha/verb/toggle_weapons_only_cycle()
	set category = "Exosuit Interface"
	set name = "Toggle weapons only cycling"
	set src = usr.loc
	set popup_menu = 0
	set_weapons_only_cycle()

/obj/vehicle/sealed/mecha/proc/set_weapons_only_cycle()
	if(usr!=src.occupant_legacy)
		return
	weapons_only_cycle = !weapons_only_cycle
	src.occupant_message("<font color=\"[weapons_only_cycle?"#00f\">En":"#f00\">Dis"]abled weapons only cycling.</font>")
	return

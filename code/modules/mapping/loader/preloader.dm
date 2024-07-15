// global datum that will preload variables on atoms instanciation
GLOBAL_REAL_VAR(use_preloader) = FALSE
GLOBAL_REAL(preloader, /datum/map_preloader) = new

/// Preloader datum
/datum/map_preloader
	parent_type = /datum
	//* Vars set for load cycle
	var/loading_orientation
	//* Vars set per atom
	var/list/attributes
<<<<<<< HEAD:code/modules/mapping/loader/preloader.dm
	var/target_path
	var/turn_angle
	var/swap_x
	var/swap_y
	var/swap_xy

/world/proc/preloader_setup(list/the_attributes, path, turn_angle, swap_x, swap_y, swap_xy)
	if(length(the_attributes) || turn_angle)
		global.use_preloader = TRUE
		var/datum/map_preloader/preloader_local = global.preloader
		preloader_local.attributes = the_attributes
		preloader_local.target_path = path
		preloader_local.turn_angle = turn_angle
		preloader_local.swap_x = swap_x
		preloader_local.swap_y = swap_y
		preloader_local.swap_xy = swap_xy
=======

// todo: OPTIMIZE THE SHIT OUT OF ALL OF THIS
// because citrp is so quirky and funny we now call this for every fucking atom
// this is not good
// this means that we really need to optimize this to not just be attributes.
// maybe we can get all the swap stuff compounded down? who knows lol
// fucked.

/world/proc/preloader_setup(list/the_attributes, path)
	global.dmm_preloader_active = TRUE
	global.dmm_preloader_target = path
	var/datum/dmm_preloader/preloader_local = global.dmm_preloader
	preloader_local.attributes = the_attributes
>>>>>>> 98436ee38 (Fix hovering fire alarms, refactor DMM rotation code (#6589)):code/modules/mapping/dmm_suite/dmm_preloader.dm

/world/proc/preloader_load(atom/what)
	global.use_preloader = FALSE
	var/datum/map_preloader/preloader_local = global.preloader
	for(var/attribute in preloader_local.attributes)
		var/value = preloader_local.attributes[attribute]
		if(islist(value))
			value = deep_copy_list(value)
		#ifdef TESTING
		if(what.vars[attribute] == value)
			var/message = "<font color=green>[what.type]</font> at [AREACOORD(what)] - <b>VAR:</b> <font color=red>[attribute] = [isnull(value) ? "null" : (isnum(value) ? value : "\"[value]\"")]</font>"
			log_mapping("DIRTY VAR: [message]")
			GLOB.dirty_vars += message
		#endif
		what.vars[attribute] = value

	// handle post processing, so things like directions on subtypes don't break.
	// only do everything if necessary.
	var/datum/dmm_context/loading_context_local = preloader_local.loading_context
	var/turn_angle = loading_context_local.loaded_orientation_turn_angle
	if(turn_angle && what.preloading_dir(loading_context_local))
		var/multi_tile = ismovable(what) && ((what:bound_width > WORLD_ICON_SIZE) || (what:bound_height > WORLD_ICON_SIZE)) && (what.appearance_flags & TILE_MOVER)
		var/invert_x = loading_context_local.loaded_orientation_invert_x
		var/invert_y = loading_context_local.loaded_orientation_invert_y
		var/swap_xy = loading_context_local.loaded_orientation_swap_xy

		if(multi_tile)
			// normal multi tile rotation can only handle things that are 'centered' on their bound width/height
			// if something needs to change that every rotation, it needs to override preloading_dir
			var/atom/movable/casted = what
			// deal with their bounds
			var/bx = casted.bound_x
			var/by = casted.bound_y
			if(invert_y)			//same order of operations as the load rotation, mirror and then x/y swapping.
				by = -by
			if(invert_x)
				bx = -bx
			if(swap_xy)
				var/obx = bx
				bx = by
				by = obx
				var/obw = casted.bound_width
				casted.bound_width = casted.bound_height
				casted.bound_height = obw
			casted.bound_x = bx
			casted.bound_y = by
			// not a pixel mover, we can assume it's multiples of world icon size
			var/dx = round((casted.bound_width / WORLD_ICON_SIZE) - (casted.bound_x / (WORLD_ICON_SIZE / 2)) - 1)
			var/dy = round((casted.bound_height / WORLD_ICON_SIZE) - (casted.bound_y / (WORLD_ICON_SIZE / 2)) - 1)
			casted.x -= dx * ((invert_x ^ swap_xy)? 1 : 0)
			casted.y -= dy * ((invert_y ^ swap_xy)? 1 : 0)

		what.dir = turn(what.dir, turn_angle)
		var/px = what.pixel_x
		var/py = what.pixel_y
		if(invert_y)			//same order of operations as the load rotation, mirror and then x/y swapping.
			py = -py
		if(invert_x)
			px = -px
		if(swap_xy)
			var/opx = px
			px = py
			py = opx
		what.pixel_x = px
		what.pixel_y = py

<<<<<<< HEAD:code/modules/mapping/loader/preloader.dm
/area/template_noop
	name = "Area Passthrough"
	icon = 'icons/mapping/helpers/maploader_objects.dmi'
	icon_state = "area_noop"
=======
	what.preloading_instance(loading_context_local)
>>>>>>> 98436ee38 (Fix hovering fire alarms, refactor DMM rotation code (#6589)):code/modules/mapping/dmm_suite/dmm_preloader.dm

/turf/template_noop
	name = "Turf Passthrough"
	icon = 'icons/mapping/helpers/maploader_objects.dmi'
	icon_state = "turf_noop"

/*		No sane way to implement.
/atom/template_block
	name = "Block Maploader Annihilation"
	icon = 'icons/mapping/helpers/maploader_objects.dmi'
	icon_state = "no_annihilate"

/turf/template_block
	name = "Block Maploader Annihilation"
	icon = 'icons/mapping/helpers/maploader_objects.dmi'
	icon_state = "no_annihilate"
*/

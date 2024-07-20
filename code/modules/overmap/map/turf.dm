
/turf/overmap
	icon = 'icons/turf/space.dmi'
	icon_state = "map"
	permit_ao = FALSE
//	initialized = FALSE	// TODO - Fix unsimulated turf initialization so this override is not necessary!

/turf/overmap/edge
	opacity = TRUE
	density = TRUE
	var/map_is_to_my
	var/turf/overmap/edge/wrap_buddy

<<<<<<< HEAD
/turf/overmap/edge/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/turf/overmap/edge/LateInitialize()
	//This could be done by using the (LEGACY_MAP_DATUM).overmap_size much faster, HOWEVER, doing it programatically to 'find'
	//  the edges this way allows for 'sub overmaps' elsewhere and whatnot.
	for(var/side in GLOB.alldirs) //The order of this list is relevant: It should definitely break on finding a cardinal FIRST.
		var/turf/T = get_step(src, side)
		if(T?.type == /turf/overmap) //Not a wall, not something else, EXACTLY a flat map turf.
			map_is_to_my = side
			break

	if(map_is_to_my)
		var/turf/T = get_step(src, map_is_to_my)	// Should be a normal map turf
		while(istype(T, /turf/overmap))
			T = get_step(T, map_is_to_my)	// Could be a wall if the map is only 1 turf big
			if(istype(T, /turf/overmap/edge))
				wrap_buddy = T
				break

/turf/overmap/edge/Destroy()
	wrap_buddy = null
=======
	/// stores a reference to our overmap for wrap purposes
	///
	/// todo: is this a good method? it works for now but i hate storing turf vars...
	var/datum/overmap/overmap

	/// used for collisions
	var/wrap_sign_x
	/// used for collisions
	var/wrap_sign_y

/turf/overmap/edge/initialize_overmap(datum/overmap/map)
	name = "border"
	overmap = map
>>>>>>> b8c5f9db2 (overmaps - physics (#6594))
	return ..()

/turf/overmap/edge/Bumped(var/atom/movable/AM)
	if(wrap_buddy?.map_is_to_my)
		AM.forceMove(get_step(wrap_buddy, wrap_buddy.map_is_to_my))
	else
		. = ..()

/turf/overmap/Initialize(mapload)
	. = ..()
	name = "[x]-[y]"
	var/list/numbers = list()

	if(x == 1 || x == (LEGACY_MAP_DATUM).overmap_size)
		numbers += list("[round(y/10)]","[round(y%10)]")
		if(y == 1 || y == (LEGACY_MAP_DATUM).overmap_size)
			numbers += "-"
	if(y == 1 || y == (LEGACY_MAP_DATUM).overmap_size)
		numbers += list("[round(x/10)]","[round(x%10)]")

<<<<<<< HEAD
	for(var/i = 1 to numbers.len)
		var/image/I = image('icons/effects/numbers.dmi',numbers[i])
		I.pixel_x = 5*i - 2
		I.pixel_y = world.icon_size/2 - 3
		if(y == 1)
			I.pixel_y = 3
			I.pixel_x = 5*i + 4
		if(y == (LEGACY_MAP_DATUM).overmap_size)
			I.pixel_y = world.icon_size - 9
			I.pixel_x = 5*i + 4
		if(x == 1)
			I.pixel_x = 5*i - 2
		if(x == (LEGACY_MAP_DATUM).overmap_size)
			I.pixel_x = 5*i + 2
		add_overlay(I)
=======
	if(x == lower_left_x - 1)
		if(y == lower_left_y - 1)
			wrap_sign_y = 1
		wrap_sign_x = 1
	else if(x == upper_right_x + 1)
		if(y == upper_right_y + 1)
			wrap_sign_y = -1
		wrap_sign_x = -1
	if(y == lower_left_y - 1)
		if(x == upper_right_x + 1)
			wrap_sign_x = -1
		wrap_sign_y = 1
	else if(y == upper_right_y + 1)
		if(x == lower_left_x - 1)
			wrap_sign_x = 1
		wrap_sign_y = -1

	if(number)
		maptext = MAPTEXT_CENTER("[number]")

/turf/overmap/edge/Enter(atom/movable/mover, atom/oldloc)
	if(istype(mover, /obj/overmap))
		return FALSE
	return ..()

/turf/overmap/edge/Bumped(atom/movable/bumped_atom)
	. = ..()
	if(istype(bumped_atom, /obj/overmap/entity))
		var/obj/overmap/entity/entity = bumped_atom
		// bounce them off
		elastic_collision(entity)

/turf/overmap/edge/proc/elastic_collision(obj/overmap/entity/entity)
	if(wrap_sign_x != 0 && (wrap_sign_x > 0 != entity.vel_x > 0))
		if(wrap_sign_y != 0 && (wrap_sign_y > 0 != entity.vel_y > 0))
			entity.set_velocity(-entity.vel_x, -entity.vel_y)
			entity.bump_handled = TRUE
		else
			entity.set_velocity(-entity.vel_x, null)
			entity.bump_handled = TRUE
	else if(wrap_sign_y != 0 && (wrap_sign_y > 0 != entity.vel_y > 0))
		entity.set_velocity(null, -entity.vel_y)
		entity.bump_handled = TRUE

//! LEGACY BELOW
>>>>>>> b8c5f9db2 (overmaps - physics (#6594))

/turf/overmap/Destroy()
	for(var/obj/overmap/entity/visitable/ship/entity in loc)
		Exited(entity)
	return ..()

/turf/overmap/Entered(var/atom/movable/O, var/atom/oldloc)
	..()
	if(istype(O, /obj/overmap/entity/visitable/ship))
		GLOB.overmap_event_handler.on_turf_entered(src, O, oldloc)

/turf/overmap/Exited(var/atom/movable/O, var/atom/newloc)
	..()
	if(istype(O, /obj/overmap/entity/visitable/ship))
		GLOB.overmap_event_handler.on_turf_exited(src, O, newloc)

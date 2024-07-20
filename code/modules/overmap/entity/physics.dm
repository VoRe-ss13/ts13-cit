/**
 * (re)initialize physics
 */
/obj/overmap/entity/proc/initialize_physics()
	vel_x = vel_y = 0
	deactivate_physics()
	reset_cached_pos()

/obj/overmap/entity/proc/reset_cached_pos()
	if(!overmap)
		pos_x = pos_y = 0
		return
	pos_x = OVERMAP_PIXEL_TO_DIST((x - overmap.lower_left_x) * WORLD_ICON_SIZE + step_x + bound_x + bound_width * 0.5)
	pos_y = OVERMAP_PIXEL_TO_DIST((y - overmap.lower_left_y) * WORLD_ICON_SIZE + step_y + bound_y + bound_height * 0.5)

// legacy ticking hook
/obj/overmap/entity/process(delta_time)
	physics_tick(delta_time)

/obj/overmap/entity/proc/physics_tick(dt)
<<<<<<< HEAD
	// todo: proper overmaps physics, take diff from overmap south/west
	var/new_position_x = pos_x + vel_x * dt
	var/new_position_y = pos_y + vel_y * dt

	var/new_pos_pix_x = OVERMAP_DIST_TO_PIXEL(new_position_x)
	var/new_pos_pix_y = OVERMAP_DIST_TO_PIXEL(new_position_y)

	// For simplicity we assume that you can't travel more than one turf per tick.  That would be hella-fast.
	var/new_turf_x = CEILING(new_pos_pix_x / WORLD_ICON_SIZE, 1)
	var/new_turf_y = CEILING(new_pos_pix_y / WORLD_ICON_SIZE, 1)

	var/new_pixel_x = MODULUS(new_pos_pix_x, WORLD_ICON_SIZE) - (WORLD_ICON_SIZE / 2) - 1
	var/new_pixel_y = MODULUS(new_pos_pix_y, WORLD_ICON_SIZE) - (WORLD_ICON_SIZE / 2) - 1

	var/new_loc = locate(new_turf_x, new_turf_y, z)

	pos_x = new_position_x
	pos_y = new_position_y

	if(new_loc != loc)
		var/turf/old_loc = loc
		Move(new_loc, NORTH, dt * 10)
		if(get_dist(old_loc, loc) > 1)
			pixel_x = new_pixel_x
			pixel_y = new_pixel_y
			return
	// todo: actual animations
	animate(src, pixel_x = new_pixel_x, pixel_y = new_pixel_y, time = 8, flags = ANIMATION_END_NOW)
=======
	if(!overmap || !isturf(loc))
		initialize_physics()
		return // what are we doing
	// amount should move
	var/ddx = vel_x * dt
	var/ddy = vel_y * dt
	// how much to move
	var/msx = OVERMAP_DIST_TO_PIXEL(ddx)
	var/msy = OVERMAP_DIST_TO_PIXEL(ddy)
	// update pos x/y without calling reset as reset is expensive
	pos_x += ddx
	pos_y += ddy
	// move
	var/old_loc = loc
	if(!Move(loc, dir, step_x + msx, step_y + msy))
		if(!bump_handled)
			initialize_physics()
			stack_trace("failed to move")
	else if(old_loc != loc)
		Moved(old_loc, NONE)
>>>>>>> b8c5f9db2 (overmaps - physics (#6594))

/obj/overmap/entity/proc/adjust_velocity(vx, vy)
	if(!isnull(vx))
		vel_x += vx
	if(isnull(vy))
		vel_y += vy

	if(QUANTIZE_OVERMAP_DISTANCE(vel_x) || QUANTIZE_OVERMAP_DISTANCE(vel_y))
		activate_physics()
	else
		deactivate_physics()

	update_icon() // legacy

/obj/overmap/entity/proc/set_velocity(vx, vy)
	if(!isnull(vx))
		vel_x = vx
	if(isnull(vy))
		vel_y = vy

	if(QUANTIZE_OVERMAP_DISTANCE(vel_x) || QUANTIZE_OVERMAP_DISTANCE(vel_y))
		activate_physics()
	else
		deactivate_physics()

	update_icon() // legacy

/obj/overmap/entity/proc/update_velocity_ticking()
	var/should_be_moving = is_moving()
	if(is_moving && !should_be_moving)
		deactivate_physics()
	else if(!is_moving && should_be_moving)
		activate_physics()

/obj/overmap/entity/proc/activate_physics()
	if(is_moving)
		return
	is_moving = TRUE
	SSovermap_physics.moving += src

/obj/overmap/entity/proc/deactivate_physics()
	if(!is_moving)
		return
	is_moving = FALSE
	SSovermap_physics.moving -= src

/**
 * check if we're moving, used to determine if we need to start ticking
 */
/obj/overmap/entity/proc/is_moving()
	return QUANTIZE_OVERMAP_DISTANCE(vel_x) || QUANTIZE_OVERMAP_DISTANCE(vel_y)

/**
 * gets our movement (non-angular) speed
 */
/obj/overmap/entity/proc/get_speed()
	return sqrt(vel_x ** 2 + vel_y ** 2)

/**
 * get clockwise of N degrees heading of our cardinal velocity
 */
/obj/overmap/entity/proc/get_heading()
	return (arctan(vel_y, vel_x) + 360) % 360

/**
 * gets distance in overmap distance to other entity
 */
/obj/overmap/entity/proc/entity_overmap_distance(obj/overmap/entity/other)
	. = sqrt((src.pos_x - other.pos_x) ** 2 + (src.pos_y - other.pos_y) ** 2)

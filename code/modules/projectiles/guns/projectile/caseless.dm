/obj/item/gun/ballistic/caseless/prototype
	name = "prototype caseless rifle"
	desc = "This experimental rifle is the efforts of NanoTrasen's R&D division, made manifest. Uses 5mm solid-phoron caseless rounds, obviously."
	icon_state = "caseless"
	item_state = "caseless"
	w_class = WEIGHT_CLASS_BULKY
	regex_this_caliber = /datum/ammo_caliber/a5mm
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 3)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = null // R&D builds this. Starts unloaded.
	allowed_magazines = list(/obj/item/ammo_magazine/m5mmcaseless)
	one_handed_penalty = 15

/obj/item/gun/ballistic/caseless/prototype/update_icon_state()
	. = ..()
	if(ammo_magazine)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-empty"

/obj/item/gun/ballistic/caseless/prototype/loaded
	magazine_type = /obj/item/ammo_magazine/m5mmcaseless

<<<<<<< HEAD
/obj/item/gun/ballistic/caseless/usmc
	name = "M41A Pulse Rifle"
	desc = "A relic dating back to the Xenomorph Wars and the former primary battle rifle of the  United Solar Marine Corps. Loads using 10x24mm caseless Magazines"
	icon_state = "usmc"
	item_state = "usmc"
	w_class = WEIGHT_CLASS_BULKY
	caliber = "10mmCL"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m10x24mm/small
	allowed_magazines = list(/obj/item/ammo_magazine/m10x24mm/small, /obj/item/ammo_magazine/m10x24mm/med, /obj/item/ammo_magazine/m10x24mm/large)
	recoil = 0
	firemodes = list(
		list(mode_name="semiauto",      	burst=1, 	fire_delay=0,    move_delay=null,	burst_accuracy=null, dispersion=null),
		list(mode_name="4-round bursts", 	burst=4, 	fire_delay=null, move_delay=6, 	burst_accuracy=list(0,-5,-10,-15), dispersion=list(0.0, 0.2, 0.4, 0.6)),//Small damage countered by tight spread.
		)
=======
/obj/item/gun/ballistic/caseless/pellet
	name = "pellet gun"
	desc = "An air powered rifle that shoots near harmless pellets. Used for recreation in enviroments where firearm ownership is restricted."
	icon_state = "pellet"
	item_state = "pellet"
	wielded_item_state = "pellet-wielded"
	regex_this_caliber = /datum/ammo_caliber/pellet
	fire_sound = 'sound/weapons/tap.ogg'
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/p_pellet
	load_method = SINGLE_CASING
>>>>>>> 002dda4bf (projectiles v8 - ammo & magazines (#6637))

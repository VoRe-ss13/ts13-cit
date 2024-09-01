<<<<<<< HEAD
//
//	This file overrides settings on upstream simple animals to turn on vore behavior
//

/*
## For anything that previously inhertited from: /mob/living/simple_mob/hostile/vore ##

  	vore_active = 1
  	icon = 'icons/mob/vore.dmi'

## For anything that previously inhertied from: /mob/living/simple_mob/hostile/vore/large ##

	vore_active = 1
	icon = 'icons/mob/vore64x64.dmi'
	old_x = -16
	old_y = -16
	pixel_x = -16
	pixel_y = -16
	vore_pounce_chance = 50
*/

//
// Okay! Here we go!
//

/mob/living/simple_mob/animal/space/alien
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenohunter"
	icon_living = "xenohunter"
	icon_dead = "xenohunter-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

/mob/living/simple_mob/animal/space/alien/drone
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenodrone"
	icon_living = "xenodrone"
	icon_dead = "xenodrone-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

/mob/living/simple_mob/animal/space/alien/sentinel
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenosentinel"
	icon_living = "xenosentinel"
	icon_dead = "xenosentinel-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

/mob/living/simple_mob/animal/space/alien/queen
	vore_active = 1
	icon = 'icons/mob/vore.dmi'
	icon_state = "xenoqueen"
	icon_living = "xenoqueen"
	icon_dead = "xenoqueen-dead"
	icon_gib = "gibbed-a"
	vore_icons = SA_ICON_LIVING

/mob/living/simple_mob/animal/space/alien/queen/empress
	vore_active = 1
	icon = 'icons/mob/vore64x64.dmi'
	icon_state = "queen_s"
	icon_living = "queen_s"
	icon_dead = "queen_dead"
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	base_pixel_x = -16

	vore_capacity = 3
	vore_pounce_chance = 75

/mob/living/simple_mob/animal/space/alien/sentinel/praetorian
	icon = 'icons/mob/vore64x64.dmi'
	vore_icons = SA_ICON_LIVING | SA_ICON_REST

/mob/living/simple_mob/animal/space/alien/queen/empress/mother
	vore_icons = FALSE

=======
>>>>>>> 2f758a135 (completely removes simplemob automated vore support (#6714))
/mob/living/simple_mob/animal/space/bear
	icon = 'icons/mob/vore.dmi'
	icon_state = "spacebear"
	icon_living = "spacebear"
	icon_dead = "spacebear-dead"
	icon_gib = "bear-gib"

/mob/living/simple_mob/animal/space/bear/hudson
	name = "Hudson"

/mob/living/simple_mob/animal/space/bear/brown
	icon = 'icons/mob/vore.dmi'
	name = "brown bear"
	icon_state = "brownbear"
	icon_living = "brownbear"
	icon_dead = "brownbear-dead"
	icon_gib = "bear-gib"

/mob/living/simple_mob/animal/space/carp
	icon = 'icons/mob/vore.dmi'

/mob/living/simple_mob/animal/space/carp/large
/mob/living/simple_mob/animal/space/carp/large/huge
/mob/living/simple_mob/animal/space/carp/holographic

/mob/living/simple_mob/animal/space/carp/holographic

/mob/living/simple_mob/animal/passive/mouse
	faction = "mouse" //Giving mice a faction so certain mobs can get along with them.

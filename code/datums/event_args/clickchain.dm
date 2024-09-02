/**
<<<<<<< HEAD
 * used to hold data about a click action
=======
 * used to hold data about a click (melee/ranged/other) action
 *
 * the click may be real or fake.
 *
 * * This is required for item swings / interaction, usually, not just base /event_args/actor.
>>>>>>> 2533caefd (combat code overhaul + projectiles v8: impact handling (#6579))
 */
/datum/event_args/actor/clickchain
	/// a_intent
	var/intent
	/// click params
	var/list/params
	/// target atom
	var/atom/target

<<<<<<< HEAD
/datum/event_args/actor/clickchain/New(mob/performer, mob/initiator, atom/target, intent, list/params)
=======
	//* Attack Data *//

	/// Overall damage multiplier
	///
	/// todo: implement; needs slight clickchain/melee overhaul
	///
	/// * Allowed to be changed by shieldcalls and other intercepts
	var/damage_multiplier = 1

/datum/event_args/actor/clickchain/New(mob/performer, mob/initiator, atom/target, list/params, intent)
>>>>>>> 2533caefd (combat code overhaul + projectiles v8: impact handling (#6579))
	..()
	src.target = target
	src.intent = isnull(intent)? performer.a_intent : intent
	src.params = isnull(params)? list() : params

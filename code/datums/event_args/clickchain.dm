/**
<<<<<<< HEAD
 * used to hold data about a click action
=======
 * used to hold data about a click (melee/ranged/other) action
 *
 * the click may be real or fake.
 *
 * * clickchain flags are deliberately not stored in here; you're supposed to modify and return them a ton, so it's inefficient to put it in here.
 * * This is required for item swings / interaction, usually, not just base /event_args/actor.
>>>>>>> f26c79e34 (item interaction API (#6721))
 */
/datum/event_args/actor/clickchain
	/// a_intent
	var/intent
	/// click params
	var/list/params
	/// target atom
	var/atom/target

/datum/event_args/actor/clickchain/New(mob/performer, mob/initiator, atom/target, intent, list/params)
	..()
	src.target = target
	src.intent = isnull(intent)? performer.a_intent : intent
	src.params = isnull(params)? list() : params

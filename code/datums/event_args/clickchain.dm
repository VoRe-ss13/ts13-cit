/**
 * used to hold data about a click action
 */
/datum/event_args/actor/clickchain
<<<<<<< HEAD
	/// a_intent
=======
	/// optional: attack intent
>>>>>>> 48e5ea649 (Action button refactor (#6557))
	var/intent
	/// click params
	var/list/params
	/// target atom
	var/atom/target

/datum/event_args/actor/clickchain/New(mob/performer, mob/initiator, atom/target, list/params, intent)
	..()
	src.target = target
<<<<<<< HEAD
	src.intent = isnull(intent)? performer.a_intent : intent
	src.params = isnull(params)? list() : params
=======
	src.params = params || list()
	src.intent = intent

/datum/event_args/actor/clickchain/clone()
	var/datum/event_args/actor/clickchain/cloned = new(performer, initiator, target, params, intent)
	return cloned
>>>>>>> 48e5ea649 (Action button refactor (#6557))

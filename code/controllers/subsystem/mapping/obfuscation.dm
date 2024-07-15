//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

/**
 * Obfuscation module
 *
<<<<<<< HEAD
 * Allows for generating arbitrary obfuscation IDs from static mapload time IDs, that are deterministic within a round.
 */
/datum/controller/subsystem/mapping
	/// "secret" key
	var/obfuscation_secret
	/// subtly obfuscated id lookup
	var/list/obfuscation_cache

/datum/controller/subsystem/mapping/PreInit(recovering)
	. = ..()
	if(!obfuscation_secret)
		obfuscation_secret = md5(GUID())
	obfuscation_cache = recovering? ((istype(SSmapping) && SSmapping.obfuscation_cache) || list()) : list()
=======
 * todo: should this be mapping? this is a lot more important than just mapping
 *
 * * Generates **mangled** IDs; these are either persistently-unique or round-local IDs that are separate per map / map template.
 * * Generates **obfuscated** IDs; these are mangled and obfuscated IDs that are safe to reveal to players.
 *
 * Mangling keys are based on the **load instance** the mapping subsystem is in.
 * * It is crucial to call these ID transformation procs during preloading_instance(), not Initialize().
 * * It is usually already too late by the time Initialize() fires.
 * * By default, /datum/map (not /datum/map_level), /datum/map_template, /datum/shuttle_template are the three things that form new mangling boundaries/contexts.
 */
/datum/controller/subsystem/mapping
	/// used to ensure global-ness
	//  todo: should this be here? this is used literally everywhere
	var/static/round_global_descriptor
	/// round-local hash storage for specific map ids
	var/static/round_local_mangling_cache = list()
	/// round-local hash storage for specific map ids, reverse lookup
	var/static/round_local_mangling_reverse_cache = list()
	/// round-local hash storage for obfuscated ids
	var/static/round_local_obfuscation_cache = list()
	/// round-local hash storage for obfuscated ids, reverse lookup
	var/static/round_local_obfuscation_reverse_cache = list()
>>>>>>> b0cec39d8 (overmaps 1 - generation & spatial (#6550))

/**
 * Generates an obfuscated but constant ID for an original ID for cases where you don't want players codediving for an ID.
 * This is slightly more expensive but is unique for an id/idtype combo, meaning it's safe to reveal - use in cases where you want to allow a player to reverse engineer,
 * but want them to find out ICly rather than codedive for an ID
 *
 * Both original and id_type are CASE INSENSITIVE.
 */
/datum/controller/subsystem/mapping/proc/get_obfuscated_id(original, id_type = "$any")
	if(!original)
		return	// no.
	return md5("[obfuscation_secret]%[lowertext(original)]%[lowertext(id_type)]")

/**
 * more expensive obfuscation: just 4 random hexadecimals at the end.
 * each given id should output the same resulting id.
 * do not abuse this, we do cache this in memory.
 *
 * use in cases where you want a player-readable id that can be recovered
 */
/datum/controller/subsystem/mapping/proc/subtly_obfuscated_id(original, id_type = "$any")
	if(isnull(obfuscation_cache[id_type]?[original]))
		LAZYINITLIST(obfuscation_cache[id_type])
		obfuscation_cache[id_type][original] = "[original]_[num2text(rand(0, (16 ** 4) - 1), 4, 16)]"
	return obfuscation_cache[id_type][original]

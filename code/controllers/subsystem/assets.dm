SUBSYSTEM_DEF(assets)
	name = "Assets"
	init_order = INIT_ORDER_ASSETS
	subsystem_flags = SS_NO_FIRE
	var/list/datum/asset_cache_item/cache = list()
	var/list/preload = list()
	var/datum/asset_transport/transport = new()

/datum/controller/subsystem/assets/OnConfigLoad()
	var/newtransporttype = /datum/asset_transport
	switch (CONFIG_GET(string/asset_transport))
		if ("webroot")
			newtransporttype = /datum/asset_transport/webroot

	if (newtransporttype == transport.type)
		return

	var/datum/asset_transport/newtransport = new newtransporttype ()
	if (newtransport.validate_config())
		transport = newtransport
	transport.Load()

<<<<<<< HEAD
/datum/controller/subsystem/assets/Initialize(timeofday)
	for(var/type in typesof(/datum/asset))
		var/datum/asset/A = type
		if(type == initial(A.abstract_type))
=======
	set_transport_to(newtransport)

/datum/controller/subsystem/assets/proc/reload_transport()
	set_transport_to(new transport.type)

/datum/controller/subsystem/assets/proc/set_transport_to(datum/asset_transport/new_transport)
	QDEL_NULL(transport)
	transport = new_transport

	// unload all asset packs
	for(var/datum/asset_pack/pack in asset_packs)
		pack.unload()
	// unload all dynamic items
	for(var/name in dynamic_asset_items_by_name)
		var/datum/asset_item/dynamic/item = dynamic_asset_items_by_name[name]
		if(!istype(item))
>>>>>>> 275a3f223 (fix tgui assets, removes some unused tgui files, updates tgui dependencies (#6641))
			continue
		if(initial(A.lazy))
			continue
		load_asset_datum(type)

	transport.Initialize(cache)

	return ..()

/datum/controller/subsystem/assets/Recover()
	cache = SSassets.cache
	preload = SSassets.preload

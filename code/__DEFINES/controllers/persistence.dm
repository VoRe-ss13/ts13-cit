//? Object Storage System - Groups

/// default group for null groups
#define OBJECT_PERSISTENCE_GROUP_NONE ""
/// group for map persistence key
#define OBJECT_PERSISTENCE_GROUP_FOR_MAP_KEY(_key) "map_[_key]"

<<<<<<< HEAD
//? Object Storage System - Character Types
=======
/// default string for null groups
#define PERSISTENCE_DEFAULT_NULL_GROUP ""
/// check if an /obj has some form of persistence
#define OBJ_HAS_PERSISTENCE_ENABLED(OBJ) (OBJ.persist_static_id || OBJ.persist_dynamic_id)
/// check if an /obj is eligible at all for mass persistence
#define OBJ_MASS_PERSIST_SANITY_CHECK(OBJ) (OBJ_HAS_PERSIST_ENABLED(OBJ) && !(OBJ.obj_persist_status & (OBJ_PERSIST_STATUS_NO_THANK_YOU)))
/// sentinel id; set this if you want something to persist but generate its own dynamic id
/// instead of setting one manually
#define PERSISTENCE_DYNAMIC_ID_AUTOSET "!autoset"
/// map id if a level is standalone
#define PERSISTENCE_MAP_ID_STANDALONE "!standalone"
>>>>>>> 6037dd194 (shuttles/storytellers - maploader injections and context (#6464))

/// /datum/character_data/human
#define OBJECT_PERSISTENCE_CHARACTER_TYPE_HUMAN "human"

//? legacy below

// Direct filename paths

#define PERSISTENCE_FILE_BUNKER_PASSTHROUGH				"data/persistence/bunker_passthrough.json"

// Filenames for putting under directories

#define PERSISTENCE_FILENAME_OBJECTS					"objects.json"

// Directories

#define PERSISTENCE_MAP_ROOT_DIRECTORY					"data/persistence/maps"


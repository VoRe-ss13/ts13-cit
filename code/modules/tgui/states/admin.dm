/**
 * tgui state: admin_state
 *
 * Checks that the user is an admin, end-of-story.
 *
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

GLOBAL_DATUM_INIT(admin_state, /datum/ui_state/admin_state, new)

/datum/ui_state/admin_state/can_use_topic(src_object, mob/user)
	if(check_rights(R_ADMIN, FALSE, user.client))
		return UI_INTERACTIVE
	return UI_CLOSE

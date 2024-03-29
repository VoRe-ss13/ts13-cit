/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY"
	icon_state = "balaclava"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "bandblack", SLOT_ID_LEFT_HAND = "bandblack")
	inv_hide_flags = HIDEFACE|BLOCKHAIR
	body_cover_flags = FACE|HEAD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/balaclava/tactical
	name = "green balaclava"
	desc = "Designed to both hide identities and keep your face comfy and warm."
	icon_state = "swatclava"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "bandgreen", SLOT_ID_LEFT_HAND = "bandgreen")
	inv_hide_flags = HIDEFACE|BLOCKHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	inv_hide_flags = HIDEFACE|BLOCKHAIR
	body_cover_flags = HEAD|FACE
	w_class = WEIGHT_CLASS_SMALL
	siemens_coefficient = 3.0

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"

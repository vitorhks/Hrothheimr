/datum/job/roguetown/lady
	title = "Frue"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "Renowned as an honorable Battle-Maiden, you were promised the protection of your beloved clan in exchange for your hand in marriage. Whether bound by love or duty, you set sail with your companion, seeking glory in a new land. As the salty wind fills your sails, you hold close the vision of the days ahead—dreams of sitting upon a throne, your family safe and prosperous, your new fief a stronghold of your legacy.."

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/servant)
	outfit = /datum/outfit/job/roguetown/lady

	display_order = JDO_LADY
	give_bank_account = 50
	noble_income = 22
	min_pq = 5
	max_pq = null
	round_contrib_points = 3

/datum/job/roguetown/exlady //just used to change the ladys title
	title = "Consort Dowager"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LADY
	give_bank_account = TRUE

/datum/outfit/job/roguetown/lady/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
//		SSticker.rulermob = H
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		beltl = /obj/item/storage/keyring/royal
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		if(isdwarf(H))
			armor = /obj/item/clothing/suit/roguetown/shirt/dress
		else
			if(prob(66))
				armor = /obj/item/clothing/suit/roguetown/armor/armordress/alt
			else
				armor = /obj/item/clothing/suit/roguetown/armor/armordress
		head = /obj/item/clothing/head/roguetown/hennin
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random	//Added Silk Stockings for the female nobles
		id = /obj/item/clothing/ring/silver
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	else
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/keyring/royal
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		id = /obj/item/clothing/ring/silver
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 2)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)

/obj/effect/proc_holder/spell/self/convertrole/servant
	name = "Recruit Servant"
	new_role = "Servant"
	overlay_state = "recruit_servant"
	recruitment_faction = "Servants"
	recruitment_message = "Serve the crown, %RECRUIT!"
	accept_message = "FOR THE CROWN!"
	refuse_message = "I refuse."
	charge_max = 100

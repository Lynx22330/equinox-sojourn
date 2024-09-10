/obj/item/projectile/roach_spit
	name = "Glowing bile"
	icon = 'icons/obj/hivemind.dmi'
	icon_state = "goo_proj"
	damage_types = list()
	irradiate = 10
	check_armour = ARMOR_BIO
	step_delay = 2

/obj/item/projectile/roach_spit/on_hit(atom/target)
	. = ..()
	if(isliving(target))
		if (!testing)
			var/mob/living/L = target
			var/damage = rand(4, 8)
			L.damage_through_armor(damage, TOX, attack_flag = ARMOR_BIO)
			L.AdjustWeakened(1)
			on_impact()// We don't want this to overpen infinitely.
		//10% chance to leave a puddle in its wake!
		if(prob(10))
			if(locate(/obj/effect/decal/cleanable/greenglow/bile) in target.loc)
				return
			new /obj/effect/decal/cleanable/greenglow/bile(target.loc)

/obj/item/projectile/roach_spit/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	if (isroach(target_mob))
		return FALSE // so these pass through roaches
	..()

/obj/item/projectile/roach_spit/large
	name = "Glowing bile stream"
	icon = 'icons/obj/hivemind.dmi'
	icon_state = "goo_proj"
	damage_types = list()
	irradiate = 20
	check_armour = ARMOR_BIO
	//Its slower so that you can dodge it to avoid being knocked down.
	step_delay = 2.4

/obj/item/projectile/roach_spit/large/on_hit(atom/target)
	. = ..()
	//if(!(locate(/obj/effect/decal/cleanable/greenglow/bile) in target.loc))		//Equinox edit: Prevents excessive stacking of hundreds of puddles that process and irradiate
		// I just have to ask who the FUCK tests this shit? Because you DON'T! This shit stacks way too fucking much! Stop shoving shit in that you don't even test! It shouldn't even be here this fucking early!
		//new /obj/effect/decal/cleanable/greenglow/bile(target.loc)		//Equinox edit: Makes the puddles drop right on the intended target instead of harmlessly splatering on distant walls

	if(isliving(target))
		if (!testing)
			var/mob/living/L = target
			var/damage = rand(12, 20)
			L.damage_through_armor(damage, BURN, attack_flag = ARMOR_BIO)
			L.AdjustWeakened(2)
			on_impact() // We don't want this to overpen infinitely.
			//This is where it goes. Please. Test your fucking code.
			if(!(locate(/obj/effect/decal/cleanable/greenglow/bile) in target.loc))
				new /obj/effect/decal/cleanable/greenglow/bile(target.loc)

/obj/item/projectile/roach_spit/large/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	if (isroach(target_mob))
		return FALSE // so these pass through roaches
	..()

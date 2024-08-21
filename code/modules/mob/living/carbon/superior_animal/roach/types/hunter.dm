/mob/living/carbon/superior_animal/roach/hunter
	name = "Jager Roach"
	desc = "A monstrous, dog-sized cockroach. This one has bigger claws."
	icon_state = "jager"

	turns_per_move = 1 // Should always be moving, actively hunting for their next host.
	maxHealth = 30 * ROACH_HEALTH_MOD
	health = 30 * ROACH_HEALTH_MOD
	move_to_delay = 5  // A fast mob. Meant for hunting and chasing down prey.

	blattedin_revives_left = 2

	knockdown_odds = 5
	melee_damage_lower = 5   // We are hunters, meant to kill, not meant to tickle.
	melee_damage_upper = 10

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/jager
	meat_amount = 3
	armor_divisor = 1.2

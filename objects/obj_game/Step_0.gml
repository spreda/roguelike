// If the game is NOT over...
if (!instance_exists(obj_game_over))
{
	// If the hero has run out of hitpoints...
	if (obj_hero.hitpoints <= 0)
	{
		// Destroy the player.
		with (obj_hero) instance_destroy();
	
		// Create game over object.
		instance_create_layer(1920 / 2, 1080 / 2 - 150, "UpgradeScreen", obj_game_over);
	}
}

// If the game is over...
// We do this by checking is an end game screen is present.
if (!instance_exists(obj_upgrade) && !instance_exists(obj_template_complete))
{
	// If time runs out
	if (time_seconds >= game_duration)
	{
		// Create the upgrade screen.
		instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_template_complete);
		
		// Hero invincibility
		obj_hero.hitpoints = obj_hero.hitpoints_max;
		spawn_enemy_cooldown = 1;
	}
	else
	{
		// Game clock
		game_time += 1;
		time_seconds = int64(game_time/60);
	}
	
	// If we have reached the time goal...
	if (time_seconds >= global.level * 30)
	{	
		// World level up!
		global.level += 1;
		
		// Execute function to go to the next wave.
		next_wave();
	}
	
	// If we have reached the experience goal...
	if (global.xp >= global.xp_goal)
	{	
		// Levelup the hero
		obj_hero.level += 1;
		obj_hero.hitpoints_max *= 1.1;
		obj_hero.hitpoints *= 1.1;
		
		// Subtract experience goal from current experience.
		// Basically this is the cost of levelling up.
		global.xp -= global.xp_goal;

		// Increase the experience goal for the next wave.
		global.xp_goal = floor(global.xp_goal * 1.35);
		
		// Create the upgrade screen.
		instance_create_layer(0, 0, "Instances", obj_upgrade_screen);
	}
}

// If the game is not currently paused...
if (!global.paused)
{
	// Reduce spawner cooldown timer.
	spawn_enemy_cooldown -= delta_time * 0.000001;
	
	// Checks if spawner has expired.
	if (spawn_enemy_cooldown <= 0)
	{
		// Calls spawn enemy function.
		spawn_enemy();	
	}
}
image_xscale = global.hero_xscale;

image_yscale = global.hero_xscale;

rotation = 0;

// Set the maximum hitpoints that the player can have.
hitpoints_max = 10;

// Set current level
level = 1;

// Set the starting hitpoints of the player (to the max).
hitpoints = hitpoints_max;

// Variables for tracking enemies.
nearest_enemy = undefined;
nearest_distance = 10000;

// Set movement variables
walk_speed = 7;

// Variables for tracking actions and movement states.
dash_speed = 15;
dash_duration = 20;
dash_cooldown = 20;
dash_time_counter = 0;
dash_queued = false;
dash_coyote_time = 10

// Init skills fron config
skills = init_skill_system();

// Unlocks Fireball skill by default.
skills[$ "Fireball"].unlocked = true;
skills[$ "Fireball"].level = 1;

// Function for the spell casting.
cast = function(skill)
{
    // If skill is NOT unlocked - exit
	if (!skill.unlocked)
    {
        exit;
    }  
    
    // Reduce cooldown timer for attack.
    skill.cooldown_timer -= 1 * skill.attack_rate_scale;
    
	// If the nearest enemy is within 1000 pixels...
    if (nearest_distance < skill.range and instance_exists(nearest_enemy))
	{
        // Check if function cooldown is finished.
        if (skill.cooldown_timer <= 0)
        {
      		// Reset the cooldown for this skill.
      		skill.cooldown_timer = skill.cooldown * 60;
      
      		// Execute the function to handle this skill.
            skill.cast_function(self, skill);
        }
	}
}
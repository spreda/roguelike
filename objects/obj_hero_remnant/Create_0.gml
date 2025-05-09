// Call parent event to set up general weapon stuff.
event_inherited();

// Set sprite scale.
scale = 1.5;
xscale = 1;

start_sprite = spr_remnant_hero_hit;
loop_sprite = spr_remnant_hero;
lifespan = 1;

hitpoints = 1;
knockback = 0;

init = function()
{
    xscale *= sign(obj_hero.image_xscale);
    lifespan = skill_config.animation_repeats;
    
    hitpoints = skill_config.hitpoints;
    
    var _new_target = id;
    with (obj_enemy)
    {
        set_target(_new_target);
    }
}

collision_with_mob = function(_mob)
{
	// Interaction with mob
	apply_to_target(_mob);
    
    
    // If our hitpoints is over 0,
    // AND we are not currently being hit.
    if (hitpoints > 0 && sprite_index != start_sprite)
    {
        // Set the healthbar timer to 60.
        // This will cause the healthbar to be visible for that many game steps.
        show_healthbar = 60;

        // Reduce hitpoints by the damage caused by the trail weapon.
        hitpoints -= 1;

        // Set sprite to the hit sprite.
        sprite_index = start_sprite;
        image_index = 0;
        
        // Knockback
        knockback = 6;
        knockback_direction = point_direction(_mob.x, _mob.y, x, y);

        // If hitpoints has reached zero...
        if (hitpoints <= 0)
        {
            // Destroy this instance.
            instance_destroy();
        }
    }
}

apply_to_target = function(_mob)
{
    var _damage = calculate_damage();
    
	with (_mob)
	{
		// If our hitpoints is over 0,
		// AND we are not currently being hit.
		if (hitpoints > 0 && sprite_index != hit_sprite)
		{
            
			// Set the healthbar timer to 60.
			// This will cause the healthbar to be visible for that many game steps.
			show_healthbar = 60;

			// Reduce hitpoints by the damage caused by the trail weapon.
			hitpoints -= _damage;

			// Create text popup to indicate damage.
			var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

			// Set text to the damage amount.
			_text.text = _damage;

			// Set sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;
            
            // Knockback
            knockback = 6;
            knockback_direction = direction + 180;

			// If hitpoints has reached zero...
			if (hitpoints <= 0)
			{
				// Destroy this instance.
				instance_destroy();
			}
		}
	}
}
// Call parent event to set up general weapon stuff.
event_inherited();

// Set sprite scale.
scale = 6;

i = 0;

collision_with_mob = function(_mob)
{
	// Interaction with mob
	apply_to_target(_mob);
}

apply_to_target = function(_mob)
{
    var _damage = calculate_damage();
    var _pull_direction = point_direction(_mob.x, _mob.y, x, y) + 45;
    var _distance = point_distance(_mob.x, _mob.y, x, y);
    
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
            knockback = 5 * min(_distance / 150 + 0.2, 1);
            knockback_direction = _pull_direction;
            knockback_decay = 0.15;
            
            // Slowdown
            slowdown = 0.5;
            slowdown_duration = 30;

			// If hitpoints has reached zero...
			if (hitpoints <= 0)
			{
				// Destroy this instance.
				instance_destroy();
			}
		}
	}
}
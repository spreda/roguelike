// Call parent event to set up general weapon stuff.
event_inherited();

mobs_hit = {};

scale = 4;

// Sets default image alpha.
image_alpha = 1;

apply_to_target = function(_mob)
{
    var _damage = calculate_damage();
    
	with (_mob)
	{
		// If hitpoints are over zero...
		if (hitpoints > 0)
		{
			// Set the healthbar timer to 60.
			// Causing the healthbar to show for 60 game steps.
			show_healthbar = 60;

			// Reduce hitpoints by the damage caused by the shooting weapon.
			hitpoints -= _damage;
	
			// Create text popup to indicate damage.
			var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

			// Set text to damage amount.
			_text.text = _damage;
            
            // Knockback
            knockback = 10;
            knockback_direction = direction + 180;

			// Set our sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;
		}
	}
}

collision_with_mob = function(_mob)
{
	if (struct_exists(mobs_hit, _mob.id))
	{
		exit;
	}
	
	struct_set(mobs_hit, _mob.id, true);
	
	// Choose a random shooting sound effect.
	var _sound = array_shuffle(sounds)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
	
	// Interaction with mob.
	apply_to_target(_mob);
}

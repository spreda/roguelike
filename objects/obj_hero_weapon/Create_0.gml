// Set scale.
scale = 1;

// Set sprites for this weapon type.
start_sprite = undefined;
loop_sprite = undefined;
end_sprite = undefined;

lifespan = 0;

sounds = [snd_lightning_impact_1, snd_lightning_impact_2];

apply_to_target = function(_mob)
{
	with (_mob)
	{
		// If hitpoints are over zero...
		if (hitpoints > 0)
		{
			// Set the healthbar timer to 60.
			// Causing the healthbar to show for 60 game steps.
			show_healthbar = 60;

			// Reduce hitpoints by the damage caused by the shooting weapon.
			hitpoints -= global.shooting[? "damage"];
	
			// Create text popup to indicate damage.
			var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

			// Set text to damage amount.
			_text.text = -global.shooting[? "damage"];

			// Set our sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;
		}
	}
}

collision_with_mob = function(_mob)
{
	// Choose a random shooting sound effect.
	show_debug_message(string(typeof(sounds)));
	var _sound = array_shuffle(sounds)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
	
	// Interaction with mob
	apply_to_target(_mob);
	
	instance_destroy();
}

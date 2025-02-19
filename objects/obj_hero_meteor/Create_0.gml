// Call parent event to set up general weapon stuff.
event_inherited();

size = choose(1, 2, 3, 4) + choose(1, 2, 3, 4);

// Set sprites for this weapon type.
switch (size)
{
	case 1:
	case 2:
	case 3:
	case 4:
	case 5:
		start_sprite = spr_explosion_start_16x16;
		loop_sprite = spr_fire_16x16;
		end_sprite = spr_explosion_end_16x16;
		break;
		
	case 6:
	case 7:
		start_sprite = spr_explosion_start_32x32;
		loop_sprite = spr_fire_32x32;
		end_sprite = spr_explosion_end_32x32;
		break;
		
	case 8:
		start_sprite = spr_explosion_start;
		loop_sprite = spr_fire;
		end_sprite = spr_explosion_end;
		break;
}

// Set sprite scale.
scale = 6;

// Set ammout of animation loops
lifespan = 5;

sounds = [snd_melee_hit_1, snd_melee_hit_2, snd_melee_hit_3];

collision_with_mob = function(_mob)
{
	// Choose a random shooting sound effect.
	var _sound = array_shuffle(sounds)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
	
	// Interaction with mob
	apply_to_target(_mob);
}

apply_to_target = function(_mob)
{
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
			hitpoints -= global.burning_ground[? "damage"];

			// Create text popup to indicate damage.
			var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

			// Set text to the damage amount.
			_text.text = -global.burning_ground[? "damage"];

			// Set sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;

			// If hitpoints has reached zero...
			if (hitpoints <= 0)
			{
				// Destroy this instance.
				instance_destroy();
			}
		}
	}
}

sprite_index = start_sprite
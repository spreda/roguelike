// Call parent event to set up general weapon stuff.
event_inherited();

mobs_hit = {};

scale = 4;

x_offset = 40;
x_sign = 0;

x_start = x;

i_offset = -60;
i = i_offset;

hero = undefined;

start_sprite = spr_beam_start_cast;
loop_sprite = spr_beam_start;
lifespan = 1;

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

			// Set our sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;
		}
	}
}

collision_with_mob = function(_mob)
{
    if (global.paused)
    {
        exit;
    }
    
	if (struct_exists(mobs_hit, _mob.id))
	{
        if (mobs_hit[$ _mob.id] > 0)
        {
		  exit;
        }
        else
        {
            struct_remove(mobs_hit, _mob.id);
        }
	}
	
	struct_set(mobs_hit, _mob.id, 25);
	
	// Choose a random shooting sound effect.
	var _sound = array_shuffle(sounds)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
	
	// Interaction with mob.
	apply_to_target(_mob);
}

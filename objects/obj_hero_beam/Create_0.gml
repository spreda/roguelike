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

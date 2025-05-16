// Call parent event to set up general weapon stuff.
event_inherited();

mobs_hit = {};

scale = 4;

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

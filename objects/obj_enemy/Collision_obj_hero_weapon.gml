var _sound = array_shuffle(damage_taken_sound)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
// Execute weapon effect on enemy
other.collision_with_mob(self);
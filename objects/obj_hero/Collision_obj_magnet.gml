obj_xp.pickup_distance = 10000;

// Chooses sound effect.
var _sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);

// Plays sound effect.
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);

// With magnet pickup.
with(other) 
{
	// Destroy pickup.
	instance_destroy();
}
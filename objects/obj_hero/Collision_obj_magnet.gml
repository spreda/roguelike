obj_collectable.pickup_distance = 5000;

// Chooses sound effect.
_sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);

// Plays sound effect.
audio_play_sound(_sound, 0, 0, 1, undefined, 1.0);

// With heart pickup.
with(other) 
{
	// Destroy pickup.
	instance_destroy();
}
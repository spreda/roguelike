// Do not pickup hearts when HP bar is full
if (hitpoints == hitpoints_max and !instance_exists(obj_game_complete))
{
	exit;
}

hitpoints = min(hitpoints + hitpoints_max/2, hitpoints_max);

// Chooses sound effect.
var _sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);

// Plays sound effect.
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);

// With heart pickup.
with(other) 
{
	// Destroy pickup.
	instance_destroy();
}
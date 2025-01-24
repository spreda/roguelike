volume = global.music_volume;
audio_group_set_gain(0,  power(volume, 2), 0);

// Variable used for clicked state.
is_clicked = false;
is_disabled = false;
slider_id = undefined;

// Variable used for button scaling.
target_scale = 1.0;

// Toggle sound shortcut
sound_key= ord("M"); // Mute
sound_key_alt= ord("M");

function toggle_sound()
{
	// Play click sound effect.
	audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
	
	// Toggle volume on/off.
	if (audio_group_get_gain(0) > 0)
	{
		audio_group_set_gain(0, 0, 100);	
	}
	else
	{
		audio_group_set_gain(0,  power(volume, 2), 100);	
	}
}

function create_slider()
{
	
	// Play click sound effect.
	audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
	
	if (!instance_exists(slider_id))
	{
		slider_id = instance_create_layer(x, y+72, layer, obj_slider)
		slider_id.value = volume;
	}
	is_clicked = false;
}
audio_play_sound(snd_music_menu, 0, 1, 1.0, undefined, 1.0);
// Variable used for clicked state.
is_clicked = false;

// Variable used for button scaling.
target_scale = 1.0;

// Toggle sound shortcut
sound_key= ord("M"); // Mute
sound_key_alt= ord("M");

function toggle_sound()
{
	// Play click sound effect.
	audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
	
	// Get current volume.
	var _volume = audio_get_master_gain(0);
	
	// Toggle volume on/off.
	audio_set_master_gain(0, !_volume);	
}
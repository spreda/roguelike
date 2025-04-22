selected = false;

// Keyboard shortcut
if (keyboard_check_pressed(hotkey))
{
	// Play click sound effect.
	audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
	
	selected = true;
}
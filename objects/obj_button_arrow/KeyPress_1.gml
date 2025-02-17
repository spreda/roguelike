// Keyboard shortcut
if (keyboard_check(hotkey) or keyboard_check(hotkey_alt))
{
	// Play click sound effect.
	audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
	
	// Reduce target scale size.
	target_scale = 0.9;
	
	// Execute button function.
	action();
}
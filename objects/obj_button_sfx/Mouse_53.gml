if (instance_exists(slider_id) and !slider_id.hover)
{
	audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
	instance_destroy(slider_id);
	is_disabled = true;
}
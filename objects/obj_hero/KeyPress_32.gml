/// @description Dash
// Dash if available
if (keyboard_check(vk_space) and !global.paused)
{
	if (dash_time_counter > 0)
	{
		exit;
	}
	if (dash_time_counter == 0)
	{
		dash();
	}
	else if (dash_time_counter >= -dash_coyote_time)
	{
		dash_queued = true;
	}
}

if (mouse_down)
{
	value = inv_lerp(end_y, start_y, device_mouse_y_to_gui(0) - sprite_get_height(spr_slider_handle) / 2);
	value = clamp(value, 0, 1);
}
handle_y = lerp(end_y, start_y, value) + lerp(end_y, start_y, value) % 4;

if (device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
{
	hover = true;
	
	if (mouse_check_button_pressed(mb_left))
	{
		mouse_down = true;
	}
}
else
{
	hover = false;
}

if (mouse_check_button_released(mb_left))
{
	mouse_down = false;
}
if (mouse_down)
{
	value = inv_lerp(end_y, start_y, mouse_y-sprite_get_height(spr_slider_handle)/2);
	value = clamp(value, 0, 1);
}
handle_y = lerp(end_y, start_y, value);
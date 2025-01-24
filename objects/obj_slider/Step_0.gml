if (mouse_down)
{
	value = inv_lerp(end_y, start_y, mouse_y);
	value = clamp(value, 0, 1);
}
handle_y = lerp(end_y, start_y, value);
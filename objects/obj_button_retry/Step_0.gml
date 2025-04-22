// If mouse is over this button (adjusted for GUI layer)...
if (device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
{
	// Reduce target scale size.
	target_scale = 0.95;
	
	// If left mouse button is pressed...
	if (mouse_check_button_pressed(mb_left))
	{
        select();
	}
	
	// Checks if mouse has been clicked on this button.
    // And the left mouse button is clicked...
	if (is_clicked and mouse_check_button_released(mb_left))
	{
        action();
	}
}
else
{
	// Reset target scale size.
	target_scale = 1.0;	
}

if (is_clicked)
{ 
    // Reduce target scale size further.
    target_scale = 0.9;
}

// Stores how many gamepad count.
var _max_pads = gamepad_get_device_count();

// Checks when at least 1 gamepad is present.
if (_max_pads > 0)
{
	// Checks the gamepad is connected.
	if (gamepad_is_connected(0))
	{
		// Checks if gamepad button has been pressed.
		if (gamepad_button_check_pressed(0, gp_start))
		{
			action();
		}
	}
}

// Lerp scale values to target scale.
image_xscale = lerp(image_xscale, target_scale, 0.1);
image_yscale = lerp(image_yscale, target_scale, 0.1);
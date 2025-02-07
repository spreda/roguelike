// Variable used for clicked state.
is_clicked = false;

// Variable used for button scaling.
target_scale = 1.0;

// Exit game shortcut
exit_key= vk_escape;
exit_key_alt= vk_escape;

// Set Arrow direction
function set_direction(arrow_direction)
{
	// Arrow hotkeys
	switch (arrow_direction)
	{
		case "right":
		{
			show_debug_message("0");
			image_index = 0;
			hotkey = ord("D");
			hotkey_alt = vk_right;
			break;	
		}
		case "down":
		{
			show_debug_message("1");
			image_index = 1;
			hotkey = ord("S");
			hotkey_alt = vk_down;
			break;	
		}
		case "left":
		{
			show_debug_message("2");
			image_index = 2;
			hotkey = ord("A");
			hotkey_alt = vk_left;
			break;	
		}
		case "up":
		{
			show_debug_message("3");
			image_index = 3;
			hotkey = ord("W");
			hotkey_alt = vk_up;
			break;	
		}
	}
}

action = function()
{
	show_debug_message("Click! " + string(image_index));
}
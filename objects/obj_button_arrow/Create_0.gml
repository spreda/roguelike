// Variable used for clicked state.
is_clicked = false;

// Variable used for button scaling.
target_scale = 1.0;

// Arrow orientation
image_angle = 0;

// Arrow key shortcut
switch (image_angle)
{
	case 0:
	{
		hotkey= ord("d");
		hotkey_alt= vk_right;
		break;
	}
	case 90:
	{
		hotkey= ord("s");
		hotkey_alt= vk_down;
		break;
	}
	case 180:
	{
		hotkey= ord("a");
		hotkey_alt= vk_left;
		break;
	}
	case 270:
	{
		hotkey= ord("w");
		hotkey_alt= vk_up;
		break;
	}
}

action = function()
{
	show_debug_message("Click! " + string(id));
}
if (!instance_exists(parent_obj))
{
    exit;
}

switch (halign)
{
    case fa_left:
    {
        x = parent_obj.bbox_left;
        break;
    }
    case fa_right:
    {
        x = parent_obj.bbox_right;
        break;
    }
    default:
    {
        x = parent_obj.bbox_left;
        break;
    }
}

x += offset_x;
y = parent_obj.bbox_bottom + offset_y;

if (always_visible)
{
    hover = true;
    exit;
}

// If mouse is over this instance, adjusting for the GUI layer...
if (device_mouse_x_to_gui(0) > parent_obj.bbox_left && device_mouse_x_to_gui(0) < parent_obj.bbox_right && device_mouse_y_to_gui(0) > parent_obj.bbox_top && device_mouse_y_to_gui(0) < parent_obj.bbox_bottom)
{
    if (!hover and !always_visible)
    {
		audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0); 
    }
    hover = true;
}
else
{
    hover = false;
}
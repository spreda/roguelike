if (global.paused) 
{
    exit;
}

// Inherit the parent event
event_inherited();

if (i < animation_length)
{
    var _t = i / animation_length;
    show_portion = min(power(_t, lerp(2, 0.5, _t)), 1) * sprite_portion;
    y_offset = sprite_height * (1 - show_portion);
    y = y_start + y_offset;
}

i++;
if (!invisible)
{
    draw_self();
}

if (active)
{ 
    // Select font
    draw_set_font(global.fnt_bm_small_x4_outline_thin);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    for (var _i=0; _i < array_length(hotkey_list); _i++)
    {
        var _item = hotkey_list[_i];
        
        var _key_name = keycode_to_name(_item.hotkey)
        
        var _width = string_width(_key_name);
        var _height = string_height(_key_name);
        
        var _x = _item.bbox_right - _width / 2 - 15;
        var _y = _item.bbox_bottom - _height / 2;
        var _dx =  15 + _width;
        var _dy = -6 + _height;
        
        // Keep on screen        
        _x = clamp(_x, 0, display_get_width() - _dx);
        _y = clamp(_y, 0, display_get_height() - _dy);
        
        // Draw background.
        draw_set_colour(#222222);
        draw_set_alpha(0.85);
        
        draw_rectangle(_x, _y, _x + _dx, _y + _dy, false);
        
        
        // Draw hotkey.
        draw_set_colour(c_white);
        draw_set_alpha(1.0);
         
        draw_text(_x + (_dx - _width) / 2 + 4, _y, _key_name);
    }
}
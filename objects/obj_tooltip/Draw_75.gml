if (!instance_exists(parent_obj))
{
    exit;
}

// Select font.
draw_set_font(global.fnt_bm_small_x4_outline_thin);

// Seleck background color.
draw_set_colour(#222222);
draw_set_alpha(0.8);

if (hover)
{   
    var _x = x;
    var _y = y;
    
    var _title_height = string_height(title_text);
    var _title_width = string_width(title_text);
    var _height = string_height(text) + _title_height;
    var _width = max(string_width(text), _title_width) + 15;
    
    var _dx =  _width;
    var _dy =  -8 + _height;
    
    // Keep on screen        
    _x = clamp(_x, 0, display_get_width() - _dx);
    _y = clamp(_y, 0, display_get_height() - _dy);
    
    // Draw Background.
    draw_set_colour(#222222);
    draw_set_alpha(0.85);
    draw_roundrect_ext(_x, _y, _x + _dx, _y + _dy, 12, 12, false);
    
    // Set text parameters.
    draw_set_colour(c_white);
    draw_set_alpha(1.0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Draw description.    
    draw_text(_x + 12 + (_dx - _width) / 2, _y + _title_height, text);
    
    // Draw title.    
    if (string_length(title_text) > 0)
    { 
        var _title_x = _x + (_width - _title_width) / 2;
        draw_text(_title_x + 4, _y, title_text);
        
        var _line_y = _y + _title_height - 4;
        draw_line_width(_title_x, _line_y, _title_x + _title_width, _line_y, 4);
    } 
}
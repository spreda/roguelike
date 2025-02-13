var _time_left = obj_game.game_duration - obj_game.time_seconds;

// Set the drawing color to white.
draw_set_colour(c_white);
draw_set_alpha(1.0);

// Select font
draw_set_font(global.fnt_bm_small_x4_outline_thin);
draw_set_halign(fa_center);

// Draw timer.
draw_text(x, y, string(int64(_time_left/60)) + ":" + string(_time_left%60));
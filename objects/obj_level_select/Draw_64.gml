// Set the drawing color to white.
draw_set_colour(c_white);
draw_set_alpha(1.0);

// Set the font.
draw_set_font(fnt_large);

// Center the text vertically and horizontally.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw our current level name.
draw_text(room_width / 2, room_height / 2 + 50, levels[selected_level].name);

// Draw room preview
draw_sprite_ext(levels[selected_level].map_preview, 0, room_width / 2, room_height / 2 - 250, 0.5, 0.5, 0, c_white, 1);
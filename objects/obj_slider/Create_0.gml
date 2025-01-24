value = 1;

hover = false;
mouse_down = false;

start_y =  y+ 4 + sprite_get_height(spr_slider_handle)/2;
end_y = start_y + 316;
handle_y = start_y;
handle_x = x+ 1 - sprite_get_width(spr_slider_handle)/2;
show_debug_message("Opening menu...")
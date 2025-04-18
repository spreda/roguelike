function scr_create_noise_texture(_size, _seed) {
    // Create surface
    surface_set_target(surface_create(_size, _size));
    
    // Add this line after surface_create()
    surface_set_target(surface_create(_size, _size));
    // Enable alpha for proper blending
    draw_clear_alpha(c_black, 0); 
    
    // Set random seed
    randomize();
    
    // Draw noise pattern
    draw_clear_alpha(c_black, 0);
    for (var i = 0; i < 10000; i++) {
        var _x = irandom(_size-1);
        var _y = irandom(_size-1);
        var _c = make_color_rgb(random(255), random(255), random(255));
        draw_point_color(_x, _y, _c);
    }
    
    // Save to sprite
    var surf = surface_get_target();
    var tex = sprite_create_from_surface(surf, 0, 0, _size, _size, false, false, 0, 0);
    
    // Cleanup
    surface_reset_target();
    surface_free(surf);
    
    return tex;
}
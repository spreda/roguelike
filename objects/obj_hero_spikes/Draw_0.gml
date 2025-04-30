// Apply projectile scale
image_xscale = scale * skill_config.projectile_scale;
image_yscale = scale * skill_config.projectile_scale;
image_angle = 25;

// Set up shader
shader_set(shd_partial_draw);

// Get sprite texture information
var tex = sprite_get_texture(sprite_index, image_index);
var tex_w = texture_get_width(tex);
var tex_h = texture_get_height(tex);

// Get sprite UV coordinates
var uvs = sprite_get_uvs(sprite_index, image_index);

// Calculate sprite rectangle in texture coordinates (0-1)
var sprite_rect = [
    uvs[0] / tex_w,                   // x
    uvs[1] / tex_h,                   // y
    (uvs[2] - uvs[0]) / tex_w,        // width
    (uvs[3] - uvs[1]) / tex_h         // height
];

// Set shader uniforms
var percent = show_portion;
var angle = image_angle + 90; // Direction angle in degrees
var dir_x = dcos(angle);
var dir_y = dsin(angle);

shader_set_uniform_f(shader_get_uniform(shd_partial_draw, "u_percent"), percent);
shader_set_uniform_f(shader_get_uniform(shd_partial_draw, "u_direction"), dir_x, dir_y);
shader_set_uniform_f(shader_get_uniform(shd_partial_draw, "u_sprite_rect"), 
    sprite_rect[0], sprite_rect[1], sprite_rect[2], sprite_rect[3]);
shader_set_uniform_f(shader_get_uniform(shd_partial_draw, "u_sprite_size"),  
    sprite_get_width(sprite_index), sprite_get_height(sprite_index));


// Draw sprite
draw_self();

// Reset shader
shader_reset();
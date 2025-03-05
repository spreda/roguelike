// Apply projectile scale
image_xscale = scale * skill_config.projectile_scale;
image_yscale = scale * skill_config.projectile_scale;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + 55, c_white, 1);
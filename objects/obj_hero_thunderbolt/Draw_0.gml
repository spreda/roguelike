// Apply projectile scale
image_xscale = scale * skill_config.projectile_scale;
image_yscale = scale * skill_config.projectile_scale;

for (var _i=0; _i < 4; _i++)
{
    draw_sprite_ext(sprite_index, image_index, x, y- _i*sprite_height, image_xscale, image_yscale, image_angle, c_white, 1);
}
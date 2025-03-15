// Apply projectile scale
image_xscale = scale * skill_config.projectile_scale;
image_yscale = scale * skill_config.projectile_scale;

draw_sprite_ext(spr_beam_start_cast, 1, x, y, image_xscale, image_yscale, image_angle, c_white, 1);

if (i < 0)
{
    exit;
}

var _spr_width = sprite_get_width(sprite_index) * x_sign * image_xscale;

for (var _i=0; _i < i; _i++)
{ 
    var _spr = spr_beam_cont;
    if (_i == 0)
    {
        _spr = spr_beam_start;
    }
    
    draw_sprite_ext(_spr, 1, x + _spr_width * _i + ((i/2) % 3 * 11 - 10) * image_xscale * x_sign, y, image_xscale, image_yscale, image_angle, c_white, 1);
}

draw_sprite_ext(spr_beam_start_cast, 1, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
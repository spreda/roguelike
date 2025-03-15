if (global.paused)
{
    exit;
}

// Inherit the parent event
event_inherited();

if (i < 0)
{
    direction = 90 - sign(hero.image_xscale) * 90;
}

image_angle = direction;

x_sign = sign(lengthdir_x(1, direction));

x = x_start + x_offset * x_sign;

if (instance_exists(obj_hero))
{
   x = obj_hero.x + x_offset * x_sign;
   y = obj_hero.y;
}

struct_map_ext(mobs_hit, function(timer) { return max(timer-1, 0)});

i++;
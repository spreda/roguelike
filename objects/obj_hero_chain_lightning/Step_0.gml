// Inherit the parent event
event_inherited();

if (!instance_exists(target) or !instance_exists(caster))
{
    instance_destroy();
    exit;
}

x = caster.x;
y = caster.y;

image_angle = point_direction(x, y, target.x, target.y);

distance = point_distance(caster.x, caster.y, target.x, target.y);
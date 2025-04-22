// Inherit the parent event
event_inherited();

depth = -100000

if (!instance_exists(caster))
{
    instance_destroy();
    exit;
}

caster.is_invincible = true;

lifespan = 1;

x = caster.x;
y = caster.y;
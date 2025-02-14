if (sprite_index == spr_explosion_start)
{
	sprite_index = spr_fire;
}

// Destroy this instance when it's lifespan ends.
if (lifespan > 0)
{
	lifespan -= 1;
}
else if (sprite_index == spr_fire)
{
	sprite_index = spr_explosion_end;	
}
else
{
	instance_destroy();
}

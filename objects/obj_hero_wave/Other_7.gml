if (sprite_index == spr_trail_start)
{
	sprite_index = spr_trail_loop;
}

if (sprite_index == spr_trail_end)
{
	instance_destroy();
}

// Destroy this instance when it's animation ends.
if (lifespan > 0)
{
	lifespan -= 1;
}
else
{
	sprite_index = spr_trail_end;
}

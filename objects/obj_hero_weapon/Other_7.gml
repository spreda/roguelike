if (sprite_index == start_sprite)
{
	sprite_index = loop_sprite;
}

// Destroy this instance when it's lifespan ends.
if (lifespan > 0)
{
	lifespan -= 1;
}
else if (sprite_index == loop_sprite)
{
	sprite_index = end_sprite;	
}
else
{
	instance_destroy();
}

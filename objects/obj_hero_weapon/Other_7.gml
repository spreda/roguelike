// Set loop animation after start animation ends.
if (start_sprite and loop_sprite and sprite_index == start_sprite)
{
	sprite_index = loop_sprite;
}

// Destroy this instance when it's lifespan ends.
if (lifespan > 0)
{
	lifespan -= 1;
}
else if (loop_sprite and end_sprite and sprite_index == loop_sprite)
{
	// Animation for destroying instance
	sprite_index = end_sprite;	
}
else
{
	instance_destroy();
}
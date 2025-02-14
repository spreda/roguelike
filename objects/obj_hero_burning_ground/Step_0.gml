// If the hero exists...
if (instance_exists(obj_hero))
{
	// Jump to the hero, essentially locking
	// our position to the hero position at an offset.
	// x = obj_hero.x;
	// y = obj_hero.y - 40;
}

// Set depth to a high negative number
// to make sure it's drawn on top of
// other things.
depth = -y + sprite_height - sprite_yoffset;
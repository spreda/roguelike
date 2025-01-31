// Checks if the game is not paused to update.
if (!global.paused and instance_exists(obj_hero))
{
	// Get the distance from this instance to the hero.
	var _distance = point_distance(x, y, obj_hero.x, obj_hero.y);

	// If we are within 300 pixels,
	// OR we are already moving...
	if (_distance <= pickup_distance || speed > 0)
	{
		// Get the direction from this instance to the hero.
		direction = point_direction(x, y, obj_hero.x, obj_hero.y);

		// Set speed increasingly to reach the hero.
		speed += 0.6;
	}
}
else
{
	// Sets the speed to zero.
	speed = 0;	
}
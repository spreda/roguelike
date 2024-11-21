// Checks if the game is not paused to update.
if (!global.paused and instance_exists(obj_hero))
{
	// Get the distance from this instance to the hero.
	var _distance = point_distance(x, y, obj_hero.x, obj_hero.y);

	// If we are within pickup distance,
	// OR we are already moving...
	if (_distance <= pickup_distance || speed > 0)
	{
		// Set speed increasingly to reach the hero.
		hspeed += 0.03 * ((obj_hero.x-x));
		vspeed += 0.03 * ((obj_hero.y-y));
		
		// Prevents items to infinetely orbit the hero
		speed *= 0.98;
	}
}
else
{
	// Sets the speed to zero.
	speed = 0;	
}
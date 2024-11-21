// Set depth to negative y.
// This will cause instances to draw from
// top to bottom.
depth = -y;

// Set direction towards the hero.
if (instance_exists(obj_hero))
{
	direction = point_direction(x, y, obj_hero.x, obj_hero.y);
}

if (obj_game.time_seconds > obj_game.game_duration)
{
	direction *= -1;
}

// If horizontal speed is NOT 0.
if(hspeed != 0)
{
	// Set our xscale to the sign of hspeed
	// (can only be -1 or 1 at this point).
	image_xscale = -sign(hspeed);
	image_yscale = 1;
}
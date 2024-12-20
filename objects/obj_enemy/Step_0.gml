// Set depth to negative y.
// This will cause instances to draw from
// top to bottom.
depth = -y;

// Set direction towards the hero.
if (instance_exists(obj_hero))
{
	direction = point_direction(x, y, obj_hero.x, obj_hero.y);
}

// Make enemies run off from the player
if (instance_exists(obj_template_complete))
{
	direction += 160 + sin(direction/20) * 60;
}

// Apply status effects
if (burn > 0)
{
	hitpoints -= burn / 60;
	burn = max(burn - 1/60, 0);
}
if (knockback > 0)
{
	direction = knockback_direction;
	speed = knockback;
	knockback -= 1;
	if (knockback <= 0)
	{
		speed = walk_speed;
	}
}

// If our hitpoints has reached zero...
if (hitpoints <= 0)
{
	// Destroy this instance.
	instance_destroy();
}

// If horizontal speed is NOT 0.
if(hspeed != 0)
{
	// Set our xscale to the sign of hspeed
	// (can only be -1 or 1 at this point).
	image_xscale = -sign(hspeed);
	image_yscale = 1;
}
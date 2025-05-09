if (global.paused) 
{
    exit;
}

// Inherit the parent event
event_inherited();

if (knockback > 0)
{
	direction = knockback_direction;
	speed = knockback;
	knockback -= 0.5;
	if (knockback <= 0)
	{
		speed = 0;
	}
}
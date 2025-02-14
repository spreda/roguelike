// If not paused.
if (!global.paused)
{
	// Decrement with --.
	show_healthbar--;	
}

// If our healthbar timer is over 0...
if (show_healthbar > 0)
{

	// Draw the filling of the healthbar.
	draw_sprite_ext(spr_healthbar_small_fill, 0, x + 0, y + 35, 4 * (hitpoints / hitpoints_max), 1.5, 0, c_white, 1);
}
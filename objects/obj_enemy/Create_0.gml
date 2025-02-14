// Create variable for max hitpoints.
hitpoints_max = 7 * global.enemy_health_bonus;

// Create variable for hitpoints.
hitpoints = hitpoints_max;

// Set speed.
walk_speed = 3;

// Set image scale.
image_xscale = global.hero_xscale;
image_yscale = global.hero_xscale;

// Create variable to show/hide the healthbar.
show_healthbar = 0;

// Status effects
burn = 0;
knockback = 0;
knockback_direction = 0;

while (!(place_empty(x, y, obj_collider))) 
{
	x += random(100) - 50;
	y += random(100) - 50;
} 
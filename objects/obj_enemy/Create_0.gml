// Create variable for max hitpoints.
hitpoints_max = 7 * global.enemy_health_bonus;

// Create variable for hitpoints.
hitpoints = hitpoints_max;

// Set speed.
speed = 5;
walk_speed = speed;

// Set image scale.
image_xscale = 0.5;
image_yscale = 0.5;

// Create variable to show/hide the healthbar.
show_healthbar = 0;

// Status effects
burn = 0;
knockback = 0;
knockback_direction = 0;

// Create shadow object to follow.
var _shadow = instance_create_layer(x, y, "Shadows", obj_shadow);
// Set shadow owner.
_shadow.owner_object = self;
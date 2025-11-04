// Call parent event to set up general eney stuff.
event_inherited();

// Set speed for this enemy type.
speed_scale = 0.7;

// Set animation speed.
image_speed = 1;

// Set max hitpoints for this enemy type.
hitpoints_max *= 1.0;

// Set hitpoints.
hitpoints = hitpoints_max;

// Set sprites for this enemy type.
walk_sprite = spr_trailslime_walk;
attack_sprite = spr_trailslime_attack;
hit_sprite = spr_trailslime_hit;

damage_taken_sound = [slime_sound];
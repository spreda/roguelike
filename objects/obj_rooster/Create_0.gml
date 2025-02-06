// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
walk_speed = 2.5;

// Set animation speed.
image_speed = 1;

// Set sprites for this enemy type.
walk_sprite = spr_rooster_walk;
attack_sprite = spr_rooster_attack;
hit_sprite = spr_rooster_hit;
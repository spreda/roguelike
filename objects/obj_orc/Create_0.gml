
// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
speed_scale = 0.9;

// Set max hitpoints specifically for this enemy type.
hitpoints_max *= 1.8;

// Set animation speed.
image_speed = 1;

// Set sprites for this enemy type.
walk_sprite = spr_orc_walk;
attack_sprite = spr_orc_attack;
hit_sprite = spr_orc_hit;

damage_taken_sound = [_21_orc_damage_1];
// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
speed_scale = 1.2;

// Set max hitpoints specifically for this enemy type.
hitpoints_max *= 1.8;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;

// Set sprites for this enemy type.
walk_sprite = spr_axeman_walk;
attack_sprite = spr_axeman_attack;
hit_sprite = spr_axeman_hit;

damage_taken_sound = [metal_sound];
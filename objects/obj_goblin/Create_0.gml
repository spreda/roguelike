// Call parent event to set up general enemy stuff.
event_inherited();

// Set animation speed.
speed_scale = 1.2;

// Set max hitpoints specifically for this enemy type.
hitpoints_max *= 1.25;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;

// Set sprites for this enemy type.
walk_sprite = spr_goblin_walk;
attack_sprite = spr_goblin_attack;
hit_sprite = spr_goblin_hit;

damage_taken_sound = [_21_orc_damage_1];
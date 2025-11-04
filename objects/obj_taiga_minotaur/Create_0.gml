
// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
walk_speed = 1.5;

// Set max hitpoints specifically for this enemy type.
hitpoints_max *= 2.0;

// Set animation speed.
image_speed = 1;

// Set sprites for this enemy type.
walk_sprite = spr_taigaminotaur_walk;
attack_sprite = spr_taigaminotaur_attack;
hit_sprite = spr_taigaminotaur_hit;

damage_taken_sound = [_21_orc_damage_1];
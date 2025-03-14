
// Call parent event to set up general enemy stuff.
event_inherited();

// Set speed for this enemy type.
walk_speed = 1.5;

// Set max hitpoints specifically for this enemy type.
hitpoints_max = 9 * global.enemy_health_bonus * global.enemy_hp_multiplier;

// Set animation speed.
image_speed = 1;

// Set sprites for this enemy type.
walk_sprite = spr_taigaminotaur_walk;
attack_sprite = spr_taigaminotaur_attack;
hit_sprite = spr_taigaminotaur_hit;
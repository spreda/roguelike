
// Call parent event to set up general eney stuff.
event_inherited();

// Set speed for this enemy type.
walk_speed = 2;

// Set max hitpoints specifically for this enemy type.
hitpoints_max = 3 * global.enemy_health_bonus * global.enemy_hp_multiplier;

// Set animation speed.
image_speed = 1;

// Set hitpoints.
hitpoints = hitpoints_max;

// Set sprites for this enemy type.
walk_sprite = spr_taigaslime_walk;
attack_sprite = spr_taigaslime_attack;
hit_sprite = spr_taigaslime_hit;

damage_taken_sound = [slime_sound];
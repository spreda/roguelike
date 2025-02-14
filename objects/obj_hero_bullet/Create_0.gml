// Call parent event to set up general weapon stuff.
event_inherited();

// Set sprites for this weapon type.
start_sprite = spr_explosion_start;
loop_sprite = spr_fire;
end_sprite = spr_explosion_end;

// Set scale.
scale = 1;

lifespan = 5;

// Sets default image alpha.
image_alpha = 1;
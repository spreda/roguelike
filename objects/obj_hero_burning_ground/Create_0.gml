// Call parent event to set up general weapon stuff.
event_inherited();

// Set sprites for this weapon type.
start_sprite = spr_explosion_start;
loop_sprite = spr_fire;
end_sprite = spr_explosion_end;

// Set sprite scale.
scale = 2;

// Set ammout of animation loops
lifespan = 5;
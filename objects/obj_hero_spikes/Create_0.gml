// Call parent event to set up general weapon stuff.
event_inherited();

start_sprite = spr_spikes;
loop_sprite = spr_spikes_loop;

// Set sprite scale.
scale = 1.5;

// Set ammout of animation loops
lifespan = 1;
animation_length = 20;
sprite_portion = 0.75;
show_portion = 0;
y_start = y;
y_offset = 0;
i = 0;

y += sprite_height * scale;
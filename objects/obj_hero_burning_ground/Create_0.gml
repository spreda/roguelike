// Call parent event to set up general weapon stuff.
event_inherited();

size = choose(1, 2, 3, 4) + choose(1, 2, 3, 4);

// Set sprites for this weapon type.
switch (size)
{
	case 1:
	case 2:
	case 3:
	case 4:
	case 5:
		start_sprite = spr_explosion_start_16x16;
		loop_sprite = spr_fire_16x16;
		end_sprite = spr_explosion_end_16x16;
		break;
		
	case 6:
	case 7:
		start_sprite = spr_explosion_start_32x32;
		loop_sprite = spr_fire_32x32;
		end_sprite = spr_explosion_end_32x32;
		break;
		
	case 8:
		start_sprite = spr_explosion_start;
		loop_sprite = spr_fire;
		end_sprite = spr_explosion_end;
		break;
}

// Set sprite scale.
scale = 6;

// Set ammout of animation loops
lifespan = 5;

sprite_index = start_sprite
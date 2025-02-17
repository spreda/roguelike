// Call parent event to set up general collectable stuff.
event_inherited();

if (instance_exists(obj_hero) and !instance_exists(obj_game_complete))
{	
	// Do not pickup hearts when HP bar is full,
	if (obj_hero.hitpoints == obj_hero.hitpoints_max)
	{
		speed = 0;	
	}
}
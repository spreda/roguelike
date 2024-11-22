// Declare player debug script.
function player_debug() 
{
	// Level up player
	if (keyboard_check(ord("L")))
	{
		global.xp = global.xp_goal;
	}
	
	// Timeskip
	if (keyboard_check(ord("T")))
	{
		obj_game.game_time += 60 * 60;
	}
	
	// Collect all xp
	if (keyboard_check(ord("M")))
	{
		obj_collectable.pickup_distance = 5000;
	}
	
	// Kill all enemies
	if (keyboard_check(ord("K")))
	{
		obj_enemy.hitpoints = 0;
	}
	
	// Print debug message
	if (keyboard_check(ord("D")))
	{
		show_debug_message(string(direction));
	}
}
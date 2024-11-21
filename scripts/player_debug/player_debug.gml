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
	
	// Show debug message
	if (keyboard_check(ord("D")))
	{
		show_debug_message(string(direction));
	}
}
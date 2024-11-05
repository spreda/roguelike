// Declare player debug script.
function player_debug() 
{
	// Level up player
	if (keyboard_check(ord("L")))
	{
		global.xp = global.xp_goal;
	}
	
	// Show debug message
	if (keyboard_check(ord("D")))
	{
		show_debug_message(string(direction));
	}
}
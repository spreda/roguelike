// Declare player debug script.
function player_debug() 
{
	// If the ald key is NOT down...
	if (not keyboard_check(vk_alt))
	{
		// Exit function
		exit;
	}
	// If the L key is down...
	if (keyboard_check(ord("L")))
	{
		// Level up player
		global.xp = global.xp_goal;
	}
}
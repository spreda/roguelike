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
		instance_create_layer(x + 100, y, "Instances", obj_magnet);
	}
	
	// Kill all enemies
	if (keyboard_check(ord("K")) and instance_exists(obj_enemy))
	{
		obj_enemy.hitpoints = 0;
	}
	
	// Print debug message
	if (keyboard_check(ord("D")))
	{
		show_debug_message(string(global.mouse_anchor_x));
	}
	
	// Toggle audio debugging UI
	if (keyboard_check(ord("A")))
	{
		global.debug_audio = !global.debug_audio;
		audio_debug(global.debug_audio);
	}
}
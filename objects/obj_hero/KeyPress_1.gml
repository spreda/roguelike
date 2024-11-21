// @description Debud
// Acces debug tools if enabled
if (keyboard_check(vk_alt) and global.debug)
{
	player_debug();
}

// Control geme speed
if (ord("1") <= int64(keyboard_lastkey) and int64(keyboard_lastkey) <= ord("4"))
{
	var _game_speed = 1 + int64(keyboard_lastkey) - ord("1");
	game_set_speed(60 * _game_speed, gamespeed_fps);
}
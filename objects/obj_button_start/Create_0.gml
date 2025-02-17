// Variable used for clicked state.
is_clicked = false;

// Variable used for button scaling.
target_scale = 1.0;

// Start game shortcut
start_key= vk_space;
start_key_alt= vk_enter;

// Set room thet will be launched
selected_level = rm_level_select;

selected_music = [snd_music_game,]


// Leave the menu and start the game
function start_game()
{
	// Play click sound effect.
	audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);
	
	global.music = audio_play_sound(array_shuffle(selected_music)[0], 0, 1, 1.0, undefined, 1.0);
	// Go to main game room.
	room_goto(selected_level);
}
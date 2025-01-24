ini_open("settings.ini");

global.sfx_volume = ini_read_real("Audio", "sfx_volume", 0.5);
global.music_volume = ini_read_real("Audio", "music_volume", 0.5);

ini_close();

room_goto(rm_menu)
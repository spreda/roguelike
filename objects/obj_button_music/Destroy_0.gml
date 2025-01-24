global.music_volume = volume;
show_debug_message("Volume: ", string(volume))

ini_open("settings.ini");
ini_write_real("Audio", "music_volume", global.music_volume);
ini_close();
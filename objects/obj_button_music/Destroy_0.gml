global.music_volume = volume;
ini_open("settings.ini");
ini_write_real("Audio", "music_volume", volume);
ini_close();
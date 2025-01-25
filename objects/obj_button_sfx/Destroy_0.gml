global.sfx_volume = volume;

ini_open("settings.ini");
ini_write_real("Audio", "sfx_volume", volume);
ini_close();
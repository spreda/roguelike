// Set the drawing color to white.
draw_set_colour(c_white);
draw_set_alpha(1.0);

// If an instance of obj_upgrade exists then
// that means we are on the upgrade screen...
if (instance_exists(obj_game_over))
{
	// Exit event, so we don't render the HUD.
	exit;
}

// If the upgrade screen is open...
if (instance_exists(obj_upgrade))
{
	// Exit event, so we don't render the HUD.
	exit;
}

// Draw the back of the experience bar.
draw_sprite_ext(spr_xpbar_back, 0, xp_margin_x, xp_margin_y, (1920-2*xp_margin_x) / 56, 1, 0, c_white, 1);

// Get how much the bar should be filled.
var _fill = min(global.xp / global.xp_goal, 1);

// Draw the experince bar filling.
draw_sprite_ext(spr_xpbar_fill, 0, xp_margin_x+4, xp_margin_y,  (1920-2*xp_margin_x-8) / 48 * _fill, 1, 0, c_white, 1);

// Draw healthbar
with (obj_hero)
{
	var _pos_x = 20;
	var _pos_y = 112;
	var _bars_margin = -16;
	// Draw the healthbar "background".
	for (i = 0; i < hitpoints_max; i++)
	{
		draw_sprite_ext(spr_healthbar_back, 0, _pos_x + i * (sprite_get_width(spr_healthbar_back) + _bars_margin), _pos_y, 1, 1, 0, c_white, 1);
	}
	// Draw the healthbar "filling".
	for (i = 0; i < hitpoints; i++)
	{
		draw_sprite_ext(spr_healthbar_fill, 0, _pos_x + i * (sprite_get_width(spr_healthbar_back) + _bars_margin) + 4, _pos_y - 4, 1, 1, 0, c_white, 1);
	}
}

// Set the font.
draw_set_font(fnt_small);

// Center the text vertically and horizontally.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw our current level.
draw_set_font(global.fnt_bm_small_x6_outline_thin);
draw_set_halign(fa_left);
draw_text(24, 160, "Lvl:" + string(obj_hero.level));

// Audio debugger UI
if (global.debug_audio)
{
	var _audio_name = audio_get_name(global.music);
	var _audio_pos = string_format(audio_sound_get_track_position(global.music), 6, 2);
	draw_set_halign(fa_left);
	draw_text(60, 280, string("{0} / Position: {1}", _audio_name, _audio_pos));
}
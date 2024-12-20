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

// Draw the shooting weapon icon, using the "unlocked"
// property of the shooting weapon.
draw_sprite(spr_shooting_attack_small, global.shooting[? "unlocked"], 80, 75);

// Draw the trail weapon icon, using the "unlocked"
// property of the trail weapon.
draw_sprite(spr_trail_attack_small, global.trail[? "unlocked"], 80 + 150, 75);

// Draw the swipe weapon icon, using the "unlocked"
// property of the swipe weapon.
draw_sprite(spr_arcing_attack_small, global.swipe[? "unlocked"], 80 + 300, 75);

// Draw the back of the experience bar.
draw_sprite_ext(spr_xpbar_back, 0, 540, 63, 1120 / 56, 1, 0, c_white, 1);

// Get how much the bar should be filled.
var _fill = min(global.xp / global.xp_goal, 1);

// Draw the experince bar filling.
draw_sprite_ext(spr_xpbar_fill, 0, 544, 63, (1172 / 48) * _fill, 1, 0, c_white, 1);

// Set the font.
draw_set_font(fnt_small);

// Center the text vertically and horizontally.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw our current level.
draw_text(1580, 65, "LVL: " + string(obj_hero.level));

// Draw timer.
var _time_left = game_duration - time_seconds;
draw_set_font(fnt_small_medium);
draw_text(60, 180, string(int64(_time_left/60)) + ":" + string(_time_left%60));
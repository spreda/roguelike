// Checks if glow highlight should show.
if (mouse_over or selected)
{
	// Draws the glow highlight.
	draw_sprite(spr_card_glow, 0, x, y);
}

// Checks if the upgrade has been set.
if (upgrade_data == undefined)
{
	// Exits the event.
	exit;
}


if (upgrade_data.object.unlocked == false)
{
    sprite_index = spr_upgrade_unlock;
}

// Draws the upgrade object.
image_xscale = 4.5;
image_yscale = 4.5;
draw_self();

var _description_offset_y = 45;
var _icon_offset_y = -140;

// Set the upgrade font.
draw_set_font(fnt_medium);

// Set the font colour and alpha.
draw_set_alpha(1);

// Draw the upgrade text.
draw_set_colour($000000);
draw_text(x, y + 125 + 1, string(upgrade_data.title));
draw_text(x, y + 125 - 1, string(upgrade_data.title));
draw_text(x + 1, y + 125, string(upgrade_data.title));
draw_text(x - 1, y + 125, string(upgrade_data.title));
draw_set_colour($41d7ff);
draw_text(x, y + 125, string(upgrade_data.title));

// Set the font colour and alpha.
draw_set_alpha(1);

// Set the upgrade font.
draw_set_font(fnt_card_name);

// Draw the upgrade text.
draw_set_colour($000000);
draw_text(x, y - 55 + 1, string(upgrade_data.skill_name));
draw_text(x, y - 55 - 1, string(upgrade_data.skill_name));
draw_text(x + 1, y - 55, string(upgrade_data.skill_name));
draw_text(x - 1, y - 55, string(upgrade_data.skill_name));
draw_set_colour(c_white);
draw_text(x, y - 55, string(upgrade_data.skill_name));

// Set the upgrade font.
draw_set_font(fnt_card_description);

// Draw the upgrade text.
draw_set_colour($000000);
draw_text(x, y + _description_offset_y + 1, string(upgrade_data.description));
draw_text(x, y + _description_offset_y - 1, string(upgrade_data.description));
draw_text(x + 1, y + _description_offset_y, string(upgrade_data.description));
draw_text(x - 1, y + _description_offset_y, string(upgrade_data.description));
draw_set_colour(c_white);
draw_text(x, y + _description_offset_y, string(upgrade_data.description));

// Draw the upgrade icon.
draw_sprite(upgrade_data.icon, 0, x, y + _icon_offset_y);

// Draw icon frame.
draw_sprite_ext(spr_upgrade_icon_frame, 0, x, y + _icon_offset_y, 4, 4, 0, c_white, 1);

// Set draw alpha.
draw_set_alpha(roll_alpha);

// Draw sprite.
draw_sprite(spr_upgrade_hide, 0, x, y);

// Set draw alpha.
draw_set_alpha(1);
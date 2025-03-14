// Set the drawing color to white.
draw_set_alpha(1.0);

// Set the font.
draw_set_font(fnt_large);

// Center the text vertically and horizontally.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var scale = 6;
var _sprites = [
    paper_1, paper_2, paper_3,
    paper_4, paper_5, paper_6,
    paper_7, paper_8, paper_9,
];

var _spr_size =  sprite_get_height(_sprites[0]);

var _width = 12;
var _height = 13;

var _x = (room_width - (_width-1) * _spr_size * scale) / 2;
var _y = (room_height - (_height-1.5) * _spr_size * scale) / 2 - 150;

for (var _i=0; _i < _height; _i++)
{
    for (var _j=0; _j < _width; _j++)
    {
        var _spr_index = 4;

        if (_i == 0)
        {
            _spr_index = 1;
            if (_j == 0)
            {
                _spr_index = 0;
            }
            if (_j == _width -1)
            {
                _spr_index = 2;
            }
        }
        else if (_i == _height -1)
        {
            _spr_index = 7;
            if (_j == 0)
            {
                _spr_index = 6;
            }
            if (_j == _width -1)
            {
                _spr_index = 8;
            }
        }
        else
        {
            _spr_index = 4;
            if (_j == 0)
            {
                _spr_index = 3;
            }
            if (_j == _width -1)
            {
                _spr_index = 5;
            }
        }
        
        draw_sprite_ext(_sprites[_spr_index], 1, _x + _j * scale * 8, _y + _i * scale * 8, scale, scale, 0, c_white, 1);
    }
}
// Draw our current level name.
var _map_name = levels[selected_level].name

var _text_x = room_width / 2;
var _text_y = room_height / 2 - 50;

draw_set_colour(c_black);
draw_text(_text_x - 1, _text_y, _map_name);
draw_text(_text_x + 1, _text_y, _map_name);
draw_text(_text_x, _text_y - 1, _map_name);
draw_text(_text_x, _text_y + 1, _map_name);
draw_set_colour(c_white);
draw_text(_text_x, _text_y, _map_name);


draw_set_halign(fa_left);
draw_set_font(global.fnt_bm_small_x4_outline_thin);

var _preview_scale = 0.5
var _preview_sprite = levels[selected_level].map_preview

var _text_sub_x = _text_x - sprite_get_width(_preview_sprite) / 2 * _preview_scale;

draw_text(_text_sub_x, _text_y + 100, "XP: x" + string(levels[selected_level].xp_multiplier));
draw_text(_text_sub_x, _text_y + 160, "Enemy HP: x" + string(levels[selected_level].enemy_hp_multiplier));

// Draw room preview
draw_sprite_ext(_preview_sprite, 0, _text_x, room_height / 2 - 250, _preview_scale, _preview_scale, 0, c_white, 1);
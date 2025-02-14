levels = [
	["Level 1", rm_game, spr_rm_1_preview],
	["Level 2", rm_game_2, spr_rm_2_preview]
];

selected_level = 0;

_btn_start = instance_create_layer(room_width / 2, room_height - 200, "Instances", obj_button_start);
variable_instance_set(_btn_start, "selected_level", levels[selected_level][1]);

var _btn_left_arrow = instance_create_layer(50 + sprite_get_width(spr_button_arrow) / 2, room_height / 2, "Instances", obj_button_arrow);
_btn_left_arrow.set_direction("left");


var _btn_right_arrow = instance_create_layer(room_width - 50 - sprite_get_width(spr_button_arrow) / 2, room_height / 2, "Instances", obj_button_arrow);
_btn_right_arrow.set_direction("right");

_btn_left_arrow.action = function()
{
	selected_level -= 1;
	if (selected_level < 0)
	{
		selected_level = array_length(levels) - 1;
	}
	variable_instance_set(_btn_start, "selected_level", levels[selected_level][1]);
}

_btn_right_arrow.action = function()
{
	selected_level += 1;
	if (selected_level >= array_length(levels))
	{
		selected_level = 0;
	}
	variable_instance_set(_btn_start, "selected_level", levels[selected_level][1]);
}

var _btn_exit = instance_create_layer(50 + sprite_get_width(spr_button_back) / 2, 100, "Instances", obj_button_exit);
variable_instance_set(_btn_exit, "sprite_index", spr_button_back);
variable_instance_set(_btn_exit, "hotkey", vk_escape);

music = 
[
[CForest,TheSeedlingBoy],
[Christmas_Train_Operation_Snowball_Pixel_Gun_3D_Soundtrack,Phobos],
[Game,Goblins_Dance__Battle_,Goblins_Den__Regular_]
];
levels = [
	["Trail", rm_map_path, spr_map_path_preview,music[0]],
	["Forest", rm_map_forest, spr_map_forest_preview,music[1]],
	["Taiga", rm_map_taiga, spr_map_taiga_preview,music[2]]
];

selected_level = 0;

_btn_start = instance_create_layer(room_width / 2, room_height - 200, "Instances", obj_button_start);
variable_instance_set(_btn_start, "selected_level", levels[selected_level][1]);
variable_instance_set(_btn_start, "selected_music", levels[selected_level][3]);
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
	variable_instance_set(_btn_start, "selected_music", levels[selected_level][3]);
}

_btn_right_arrow.action = function()
{
	selected_level += 1;
	if (selected_level >= array_length(levels))
	{
		selected_level = 0;
	}
	variable_instance_set(_btn_start, "selected_level", levels[selected_level][1]);
	variable_instance_set(_btn_start, "selected_music", levels[selected_level][3]);
}

var _btn_exit = instance_create_layer(50 + sprite_get_width(spr_button_back) / 2, 100, "Instances", obj_button_exit);
variable_instance_set(_btn_exit, "sprite_index", spr_button_back);
variable_instance_set(_btn_exit, "hotkey", vk_escape);

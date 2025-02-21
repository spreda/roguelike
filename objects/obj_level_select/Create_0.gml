levels = [
	{
		name: "Trail",
		map: rm_map_path,
		map_preview: spr_map_path_preview,
		music_pool: [CForest, TheSeedlingBoy],
		enemy_pool: [obj_slime_trail, obj_skeleton, obj_axeman],
	},
	{
		name: "Forest",
		map: rm_map_forest,
		map_preview: spr_map_forest_preview,
		music_pool: [Game,Goblins_Dance__Battle_, Goblins_Den__Regular_],
		enemy_pool: [obj_slime, obj_goblin, obj_orc],
	},
	{
		name: "Taiga",
		map: rm_map_taiga,
		map_preview: spr_map_taiga_preview,
		music_pool: [Christmas_Train_Operation_Snowball_Pixel_Gun_3D_Soundtrack, Phobos],
		enemy_pool: [obj_taiga_slime, obj_taiga_orc, obj_taiga_minotaur],
	},
];

function update_selection(level_index, levels, button)
{
	// Wrap around level index if it is out of bounds.
	if (level_index < 0)
	{
		level_index = array_length(levels) - 1;
	}
	else if (level_index >= array_length(levels))
	{
		level_index = 0;
	}
	
	// Set level config variables in level-starting element.
	variable_instance_set(button, "level_room", levels[level_index].map);
	variable_instance_set(button, "level_music", levels[level_index].music_pool);
	global.enemy_pool = levels[level_index].enemy_pool;
	
	// Return updatet selected level index.
	return level_index;
}

btn_start = instance_create_layer(room_width / 2, room_height - 200, "Instances", obj_button_start);
selected_level = update_selection(0, levels, btn_start);
	
var _btn_left_arrow = instance_create_layer(50 + sprite_get_width(spr_button_arrow) / 2, room_height / 2, "Instances", obj_button_arrow);
_btn_left_arrow.set_direction("left");


var _btn_right_arrow = instance_create_layer(room_width - 50 - sprite_get_width(spr_button_arrow) / 2, room_height / 2, "Instances", obj_button_arrow);
_btn_right_arrow.set_direction("right");

_btn_left_arrow.action = function()
{
	selected_level -= 1;
	selected_level = update_selection(selected_level, levels, btn_start);
}

_btn_right_arrow.action = function()
{
	selected_level += 1;
	selected_level = update_selection(selected_level, levels, btn_start);
}

var _btn_exit = instance_create_layer(50 + sprite_get_width(spr_button_back) / 2, 100, "Instances", obj_button_exit);
variable_instance_set(_btn_exit, "sprite_index", spr_button_back);
variable_instance_set(_btn_exit, "hotkey", vk_escape);

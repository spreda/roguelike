// Hero sprite scale
global.hero_xscale = 1.5;

// Set RNG seed
randomize();

// Start the game music on a loop.
global.music = audio_play_sound(snd_music_game, 0, 1, 1.0, undefined, 1.0);

// Debug mode toggle
global.debug = true;
global.debug_audio = false;

// Set the experience goal to reach the next level.
global.xp_goal = 15;

// Set current experience.
global.xp = 0;

// Set the current world level.
global.level = 1;

// Set the cooldown time for spawning enemies.
global.enemy_spawn_speed = 35;

// Set starting enemy health bonus.
// This is a multiplier, and is increased each wave.
// Result: enemy hp = enemy base hp * health bonus.
global.enemy_health_bonus = 1;

// Create the hero in the center of the room.
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_hero);

// Execute the shooting weapon reset function,
// initializing values for that weapon.
weapon_shooting_reset();

// Execute the swipe weapon reset function,
// initializing values for that weapon.
weapon_swipe_reset();

// Execute the trail weapon reset function,
// initializing values for that weapon.
weapon_trail_reset();

// UI settings
xp_margin_x = 20;
xp_margin_y = 30;

// Create the pause button.
instance_create_layer(1820, 120, "UpgradeScreen", obj_pause_button);

// Create timer
instance_create_layer(1920/2, 100,  "Instances", obj_timer);

// Create assets layer colliders.
var _assets = layer_get_all_elements("Assets_1");
for (var i = 0; i < array_length(_assets); i++;)
{
    var _x = layer_sprite_get_x(_assets[i]);
	var _y = layer_sprite_get_y(_assets[i]);
		
	var _x_scale = layer_sprite_get_xscale(_assets[i]);
	var _y_scale = layer_sprite_get_yscale(_assets[i]);
		
	var _id = instance_create_layer(0, 0, "Instances", obj_static_prop);
	
	variable_instance_set(_id, "sprite_index", layer_sprite_get_sprite(_assets[i]));
	variable_instance_set(_id, "x", _x);
	variable_instance_set(_id, "y",_y);
	variable_instance_set(_id, "image_xscale", _x_scale);
	variable_instance_set(_id, "image_yscale", _y_scale);
}


// Sets cooldown for enemy spawning time (from frames to seconds).
spawn_enemy_cooldown = global.enemy_spawn_speed * (1 / 60);

game_duration = 5 * 60; // 5 minutes
game_time = 0; // in ticks
time_seconds = 0;

// Function handles enemy spawning.
spawn_enemy = function()
{
	// Reset cooldown.
	spawn_enemy_cooldown = global.enemy_spawn_speed * (1 / 60);

	// If an instance of obj_upgrade exists then
	// that means we are on the upgrade screen...
	if (instance_exists(obj_upgrade))
	{
		// Exit event, stopping any enemies from spawning.
		exit;
	}

	// If an instance of obj_upgrade exists then
	// that means we are on the upgrade screen...
	if (instance_exists(obj_game_over))
	{
		// Exit event, stopping any enemies from spawning.
		exit;
	}

	// If an instance of obj_upgrade exists then
	// that means we are on the upgrade screen...
	if (instance_exists(obj_game_complete))
	{
		// Exit event, stopping any enemies from spawning.
		exit;
	}

	// Declare a temp variable to hold an enemy type.
	// By default this will be the pumpkill enemy.
	var _enemy = obj_slime;

	// If we are over level 2...
	if (global.level > 2)
	{
		// Change the enemy type to either
		// pigun or pumpkill.
		_enemy = choose(obj_goblin, obj_slime);
	}

	// If we are over level 4...
	if (global.level > 4)
	{
		// Change the enemy type to either
		// pigun, pumpkill or rooster.
		_enemy = choose(obj_goblin, obj_slime, obj_orc);
	}
	
	// Find free space to spawn
	var _x, _y;
	do
	{
		// We want to spawn enemyes around the player.
		// So we first get a random direction (0 to 360).
		var _dir = random(360);

		// Then we get the position 1500 pixels away
		// from the hero on the x axis.
		_x = obj_hero.x + lengthdir_x(1200, _dir);

		// Then we get the position 1500 pixels away
		// from the hero on the y axis.
		_y = obj_hero.y + lengthdir_y(1200, _dir);
	
		// Create an enemy at that generated positon if it's free.
	}
	until (place_empty(_x, _y, _enemy));

	instance_create_layer(_x, _y, "Instances", _enemy);

}
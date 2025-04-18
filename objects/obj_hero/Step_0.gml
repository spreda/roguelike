// If the game is paused...
if (global.paused)
{
	// Exit this event while paused.
	exit;
}

// Check if game is running.
if (instance_exists(obj_upgrade) || instance_exists(obj_game_complete) || instance_exists(obj_game_over))
{	
	// Stop moving the hero.
	speed = 0;

	// Exit event while on upgrade screen.
	exit;
}

// Execute player movement function.
player_movement();

// Execute function that keeps the player in the room.
keep_in_room();

// Set depth to minus our y position.
// This is also done in enemies, with the
// result being instances higher up on the screen
// being drawn first.
depth = -bbox_bottom;

// Find the nearest enemy.
// And reset the distance to some high number.
nearest_enemy = instance_nearest(x, y, obj_enemy);
nearest_distance = 1000;

// If an enemy instance is found.
if (nearest_enemy and point_in_rectangle(nearest_enemy.x, nearest_enemy.y, 0, 0, room_width, room_height))
{
	// Get the distance to that enemy.
	nearest_distance = point_distance(x, y, nearest_enemy.x, nearest_enemy.y);
}

var _skill_names = struct_get_names(skills);

for (var _i=0; _i < array_length(_skill_names); _i++)
{
    cast(skills[$ _skill_names[_i]]);
}

print(is_invincible);
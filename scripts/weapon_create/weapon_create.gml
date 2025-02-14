// Create a map assigned to global.burning_ground.
global.burning_ground = ds_map_create();

// Call the function to reset the burning_ground weapon.
// First time, this essentially setps it up.
weapon_reset();

// Define the reset function for the burning_ground weapon.
function weapon_reset(_weapon) 
{
	// Unlock weapon upgrade.
	ds_map_replace(global.burning_ground, "damage", 0.75);
	ds_map_replace(global.burning_ground, "attack_speed", 350);
	ds_map_replace(global.burning_ground, "unlocked", false);
}

// Define function to retrieve upgrades for the burning_ground weapon.
function weapon_upgrades(_weapon, _upgrade_list) 
{
	// Get wether the burning_ground weapon is unlocked.
	var _unlocked = ds_map_find_value(global.burning_ground, "unlocked");

	// If it is NOT unlocked...
	if (!_unlocked)
	{
		// Create map to store upgrade.
		var _map = ds_map_create();
	
		// Upgrade to unlock the burning_ground weapon.
		ds_map_replace(_map, "description", "Large but slow\narea of effect\nattack around\nthe player");
		ds_map_replace(_map, "title", "Unlock");
		ds_map_replace(_map, "object", global.burning_ground);
		ds_map_replace(_map, "key", "unlocked");
		ds_map_replace(_map, "amount", 1);
		ds_map_replace(_map, "icon", spr_fire);
		ds_map_replace(_map, "weapon_name", "burning_ground");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
		
		// Exits the event.
		exit;
	}

	// Get the current burning_ground weapon attack speed.
	var _attack_speed = ds_map_find_value(global.burning_ground, "attack_speed");

	// If attack speed is over 30...
	// Note this is a cooldown, so higher is slower.
	if (_attack_speed > 30)
	{
		// Create map to store upgrade.
		var _map = ds_map_create();
	
		// Upgrade to increase attack speed.
		ds_map_replace(_map, "description", "Increase Attack Speed");
		ds_map_replace(_map, "title", "Speed");
		ds_map_replace(_map, "object", global.burning_ground);
		ds_map_replace(_map, "key", "attack_speed");
		ds_map_replace(_map, "amount", -15);
		ds_map_replace(_map, "icon", spr_fire);
		ds_map_replace(_map, "weapon_name", "burning_ground");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	}

	// Get current burning_ground weapon damage.
	var _damage = ds_map_find_value(global.burning_ground, "damage");

	// If damage is under 5...
	if (_damage < 5)
	{
		// Create map to store upgrade.
		var _map = ds_map_create();
	
		// Upgrade from increasing burning_ground weapon damage.
		ds_map_replace(_map, "description", "Increase damage");
		ds_map_replace(_map, "title", "Damage");
		ds_map_replace(_map, "object", global.burning_ground);
		ds_map_replace(_map, "key", "damage");
		ds_map_replace(_map, "amount", 0.75);
		ds_map_replace(_map, "icon", spr_fire);
		ds_map_replace(_map, "weapon_name", "Burning Ground");
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _map);
	}
}
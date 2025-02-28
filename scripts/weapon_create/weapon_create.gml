function init_weapons()
{
	global.skill_configs = {};	
	global.upgrades_available = {};	
}

// Define the reset function for the weapon.
// First time, this essentially setps it up.
function weapon_reset(_weapon) 
{
	var _name = _weapon[$ "name"]
	
	// Create a map assigned to global.burning_ground.
	struct_set(global.skill_configs, _name, _weapon);
	
	// Unlock weapon upgrade.
	struct_set(global.skill_configs[$ _name], "unlocked", false);
}

// Define function to retrieve upgrades for the weapon.
function weapon_upgrades(_weapon, _upgrade_list) 
{
	// Get wether the burning_ground weapon is unlocked.
	var _unlocked = struct_get(_weapon, "unlocked");

	// If it is NOT unlocked...
	if (!_unlocked)
	{
		// Create map to store upgrade.
		var _card = generate_upgrade_card(
			_weapon,
			_weapon[$ "name"],
			_weapon[$ "name"],
			_weapon[$ "description"],
			_weapon[$ "icon"],
			"unlocked",
			1
		);
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _card);
		
		// Exits the event.
		exit;
	}

	// Get the current skill level.
	var _level = struct_get(_weapon, "level");

	// If level cap is not reached...
	if (_level >= 3)
	{
		exit;
	}
	
	var _upgrade_branches = struct_get(_weapon, "upgrade_branches");
	
	for (var i=0; i < array_length(_upgrade_branches); i++)
	{
		var _branch = _upgrade_branches[i];
		
		for (var j=0; j < array_length(_branch); j++)
		{
			var _upgrade = _branch[j];
			var _stat_name =  struct_get_names(_upgrade[$ "stats_add"])[0];
			
			// Create card to store upgrade.
			var _card = generate_upgrade_card(
				_weapon,
				_weapon[$ "name"],
				_upgrade[$ "name"],
				_upgrade[$ "description"],
				_weapon[$ "icon"],
				_stat_name,
				_upgrade[$ "stats_add"][$ _stat_name]
			);
	
			// Add upgrade to the list.
			ds_list_add(_upgrade_list, _card);
		}
	}
}

function generate_upgrade_card(_object, _skill_name, _upgrade_title, _description, _icon, _key, _ammount)
{
	// Create card to store upgrade.
	var _card = {};
	
	struct_set(_card, "description", _description);
	struct_set(_card, "title", _upgrade_title);
	struct_set(_card, "object", _object);
	struct_set(_card, "key", _key);
	struct_set(_card, "amount", _ammount);
	struct_set(_card, "icon", _icon);
	struct_set(_card, "weapon_name", _skill_name);
	
	return _card;
}
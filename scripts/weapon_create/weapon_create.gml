// Returns a structure that contains a config for every skill by it's name.
function init_skill_system()
{
    var _cast_functions = {
        cast_fireball: cast_fireball,
    };
    
	var _skill_configs = {};
    
    // Look for JSON files with skill configs.
    var _config_files = find_files("config_skill_*.json");
    
    // Parse skill configs.
    for (var _i=0; _i < array_length(_config_files); _i++)
    {
        var _config = load_json(_config_files[_i]); 
        
        _config.source_file = _config_files[_i];
        
        _config.icon = asset_get_index("spr_fireball_icon");
	    _config.cast_function = _cast_functions[$ _config.cast_function];
	    _config.projectile_object = asset_get_index("obj_hero_fireball");
        _config.cooldown_timer = _config.cooldown;
        
        _config.unlocked = false;
        _config.level = 0;
        
        _skill_configs[$ _config.name] = _config;
    }
    
    return _skill_configs;
}

// Define function to retrieve upgrades for the weapon.
function weapon_upgrades(_skill, _upgrade_list) 
{
	// Get wether the burning_ground weapon is unlocked.
	var _unlocked = struct_get(_skill, "unlocked");

	// If it is NOT unlocked...
	if (!_unlocked)
	{
		// Create map to store upgrade.
		var _card = generate_upgrade_card(
			_skill,
			_skill[$ "name"],
			_skill[$ "name"],
			_skill[$ "description"],
			_skill[$ "icon"],
			"unlocked",
			1
		);
	
		// Add upgrade to the list.
		ds_list_add(_upgrade_list, _card);
		
		// Exits the event.
		exit;
	}

	// Get the current skill level.
	var _level = struct_get(_skill, "level");
    show_debug_message("Level: " + string(_level))

	// If level cap is not reached...
	if (_level >= 4)
	{
		exit;
	}
	
	var _upgrade_branches = struct_get(_skill, "upgrade_branches");

	for (var i=0; i < array_length(_upgrade_branches); i++)
	{
		var _branch = _upgrade_branches[i];
		
		for (var j=0; j < array_length(_branch) and j < _level; j++)
		{
			var _upgrade = _branch[j];
			var _stat_name =  struct_get_names(_upgrade[$ "stats_add"])[0];
			
			// Create card to store upgrade.
			var _card = generate_upgrade_card(
				_skill,
				_skill[$ "name"],
				_upgrade[$ "title"],
				_upgrade[$ "description"],
				_skill[$ "icon"],
				_stat_name,
				_upgrade[$ "stats_add"][$ _stat_name]
			);
	
			// Add upgrade to the list.
            
            show_debug_message(string(_card))
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
	struct_set(_card, "skill_name", _skill_name);
	
	return _card;
}
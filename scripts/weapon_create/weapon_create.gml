// Returns a structure that contains a config for every skill by it's name.
function init_skill_system()
{
    cast_functions = {
        cast_fireball: cast_fireball,
        cast_outburst: cast_outburst,
        cast_wave: cast_wave,
        cast_beam: cast_beam,
        cast_burning_ground: cast_burning_ground,
        cast_splash: cast_splash,
        cast_chain_lightning: cast_chain_lightning,
        cast_thunderbolt: cast_thunderbolt,
    };
    
	var _skill_configs = {};
    
    // Look for JSON files with skill configs.
    var _config_files = find_files("conf_skill_*.json");
    
    // Parse skill configs.
    for (var _i=0; _i < array_length(_config_files); _i++)
    {
        var _config = load_json(_config_files[_i]); 
        
        _config.source_file = _config_files[_i];
        
        _config.icon = asset_get_index(_config.icon);
	    _config.cast_function = cast_functions[$ _config.cast_function];
        _config.cooldown_timer = 20;
	    _config.projectile_object = asset_get_index(_config.projectile_object);
        if (struct_exists(_config, "projectile_sub_object"))
        {
            _config.projectile_sub_object = asset_get_index(_config.projectile_sub_object);
        }
        if (!struct_exists(_config, "aoe_damage_portion"))
        {
            _config.aoe_damage_portion = 0;
        }
        if (!struct_exists(_config, "piercing"))
        {
            _config.piercing = 0;
        }
        
        _config.unlocked = false;
        _config.level = 0;
        _config.cast_times = 0;
        _config.damage_scale = 1;
        _config.aoe_area_scale = 1;
        _config.projectile_scale = 1;
        _config.attack_rate_scale = 1;
        
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
    
    // If level cap is reached - exit
    if (_skill.level > 3)
    {
        exit;
    }

    // Run for each skill upgrade branch.
	for (var i=0; i < array_length(_skill.upgrade_branches); i++)
	{ 
        var _branch = _skill.upgrade_branches[i];
		
	    // Get upgrades for the the current skill level.
		for (var j=0; j < array_length(_branch) and j < _skill.level; j++)
		{
			var _upgrade = _branch[j];
			var _stat_name =  struct_get_names(_upgrade[$ "stats_add"])[0];
			
			// Create card to store upgrade.
			var _card = generate_upgrade_card(
				_skill,
				_skill.name,
				_upgrade.title,
				_upgrade.description,
				_skill.icon,
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
	struct_set(_card, "skill_name", _skill_name);
	
	return _card;
}
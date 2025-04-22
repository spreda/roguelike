// Call parent event to set up general weapon stuff.
event_inherited();

scale = 4;
sounds = [snd_lightning_impact_1, snd_lightning_impact_2];
target_list = [];
distance = 0;

// Sets default image alpha.
image_alpha = 1;

apply_to_target = function(_mob)
{
	 // Choose a random shooting sound effect.
	var _sound = array_shuffle(sounds)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
    
    var _damage = calculate_damage();
    
	with (_mob)
	{
		// If hitpoints are over zero...
		if (hitpoints > 0)
		{
			// Set the healthbar timer to 60.
			// Causing the healthbar to show for 60 game steps.
			show_healthbar = 60;

			// Reduce hitpoints by the damage caused by the shooting weapon.
			hitpoints -= _damage;
	
			// Create text popup to indicate damage.
			var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

			// Set text to damage amount.
			_text.text = _damage;

			// Set our sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;
		}
	}
}

collision_with_mob = function(_mob) { }

function init(target_id, n_charges, target_list)
{ 
    array_push(target_list, target_id);
     
    if (n_charges > 0)
    { 
        var _new_target_id = undefined;
        var _targets_x = [];
        
        for (var _i=0; _i < array_length(target_list); _i++)
        {
            _targets_x[_i] = target_list[_i].x;
            target_list[_i].x += 100000;
        }
         
        with (target_id)
        {
                _new_target_id = instance_nearest(array_last(_targets_x), y, obj_enemy);
        }
        
        for (var _i=0; _i < array_length(target_list); _i++)
        {
            target_list[_i].x = _targets_x[_i];
        } 
        
        if (instance_exists(_new_target_id))
        {
            distance = point_distance(target_id.x, target_id.y, _new_target_id.x, _new_target_id.y);
            if (distance <= sprite_width * scale * skill_config.projectile_scale)
            {
                 var _projectile = cast_chain_lightning(target_id, skill_config, _new_target_id);
               
                 _projectile.init(_new_target_id, n_charges - 1, target_list);
            } 
        }
    } 
    
    apply_to_target(target_id);
}
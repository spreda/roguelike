// Call parent event to set up general weapon stuff.
event_inherited();

scale = 5;
sounds = [snd_lightning_impact_1, snd_lightning_impact_2];
target_list = [];
distance = 0;

start_sprite = sprite_index;

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
            
            // Start the damage animation.
            var _animation = instance_create_layer(x, y, "Instances", obj_animation_effect, {
                "sprite_index": spr_electric_charge,
                "scale": 3,
                "draw_on_top_layer": true,
                "follow_instance_id": id,
            });
		}
	}
}

collision_with_mob = function(_mob) { }

function init()
{ 
    var potential_targets = ds_list_create();
      
    collision_circle_list(x, y, skill_config.range, obj_enemy, false, true, potential_targets, true);
    
    var max_hp = 0;
    var target_id = undefined;
    
    for (var i=0; i < ds_list_size(potential_targets); i++)
    {
        var mob = potential_targets[| i];
        
        if (mob.hitpoints > max_hp)
        {
            max_hp = mob.hitpoints;
            target_id = mob;
        }
    }
    
    ds_list_destroy(potential_targets);
    
    x = target_id.x;
    y = target_id.y;
    
    apply_to_target(target_id);
}
// Call parent event to set up general weapon stuff.
event_inherited();

scale = 5;
sounds = [snd_lightning_impact_1, snd_lightning_impact_2];
distance = 0;

start_sprite = sprite_index;

apply_to_target = function(_mob)
{ 
    var _damage = calculate_damage();
    
    _mob.take_hit(_damage);
    
	with (_mob)
	{
		// If hitpoints are over zero...
		if (hitpoints > 0)
		{ 
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
// Call parent event to set up general weapon stuff.
event_inherited();

scale = 4;
sounds = [snd_lightning_impact_1, snd_lightning_impact_2];
target_list = [];
distance = 0;

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
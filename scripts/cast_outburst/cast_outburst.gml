// Define a function to spawn a single projectile.
function spawn_bullet(angle, skill, projectile_object = undefined, caster_object = obj_hero)
{
    if (!instance_exists(caster_object))
    {
        exit;
    }
    
    // Get projectile object.
    var _projectile = skill.projectile_object;
    
    if (projectile_object != undefined)
    {
        _projectile = projectile_object;
    }
    
    // Play the sound effect.
    audio_play_sound(snd_lightning_throw, 0, 0, 1.0, undefined, 1.0);
    
    // Create a bullet and assign it to temp variable _bullet.
    var _bullet = instance_create_layer(caster_object.x, caster_object.y, "Instances", _projectile, { skill_config: skill });
        
    // Change values of the bullet...
    with (_bullet) 
    {
        // Set the bullet's direction.
        direction = angle;
            
        // Set speed of the bullet.
        speed = skill.speed;
            
        // Rotate the bullet to face it's moving direction.
        image_angle = direction;
        
        skill_config = skill;
        piercing = skill.piercing
        
        caster = caster_object;
    }	
    
    return _bullet;	
}

// Define a function to execute the shooting attack.
function cast_outburst(hero, skill) 
{  
    with (hero)
    {
        // Get the angle we should start creating bullets aiming towards.
    	var _i = 0;
    	var _number_of_shots = skill.projectile_count;
    	var _angle_difference = 360 / _number_of_shots;
    	
    	// The starting angle.
    	var _angle = 180;
    	
    	// Play the sound effect.
    	audio_play_sound(snd_lightning_throw, 0, 0, 1.0, undefined, 1.0);
    	
    	// Start the cast animation.
    	var _animation = instance_create_layer(x, y, "Instances", obj_animation_effect,
    						 {
    							 "sprite_index": spr_outburst_start,
    							 "scale": 4,
    							 "draw_on_top_layer": true,
    							 "follow_instance_id": obj_hero,
    						 });
        
    	var _cast_delay = 60 / sprite_get_info(spr_outburst_start).frame_speed;
    	
    	// Repeat the following code for each bullet we need to spawn.
    	repeat (_number_of_shots)
    	{
    		var _callback = method(
                { _a:_angle, _s: skill, _o:skill.projectile_sub_object, _c:obj_hero },
                function() { spawn_bullet(_a, _s, _o, _c); }
            );
            
            _animation.callbacks[$ (3 * _i + _cast_delay)] =_callback;
    		
    		// Increment the angle for the next bullet.
    		_angle += _angle_difference;
    		_i += 1;
    	}	
    }
}
// Define a function to execute the shooting attack.
function cast_splash(hero, skill) 
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
    							 "sprite_index": spr_splash_cast,
    							 "scale": 4,
    							 "draw_on_top_layer": true,
    						 });
        
    	var _cast_delay = 60 / sprite_get_info(spr_outburst_start).frame_speed;
    	
    	// Repeat the following code for each bullet we need to spawn.
    	repeat (_number_of_shots)
    	{
    		var _callback = method(
                { _a:_angle, _s: skill, _o:skill.projectile_sub_object, _c:_animation },
                function() { spawn_bullet(_a, _s, _o, _c); }
            );
            
            _animation.callbacks[$ (3 * _i + _cast_delay)] =_callback;
    		
    		// Increment the angle for the next bullet.
    		_angle += _angle_difference;
    		_i += 1;
    	}	
    }
}
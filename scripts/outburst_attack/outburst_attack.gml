// Define a function to execute the outburst attack.
function outburst_attack()
{	
	// Get the angle we should start creating bullets aiming towards.
	var _i = 0;
	var _number_of_shots = 8;
	var _angle_difference = 360 / _number_of_shots;
	
	// The starting angle.
	var _angle = 180;
	
	// Play the sound effect.
	audio_play_sound(snd_lightning_throw, 0, 0, 1.0, undefined, 1.0);
	
	// Start the cast animation.
	instance_create_layer(x, y, "Instances", obj_animation_effect,
						 {
							 "sprite_index": spr_outburst_start,
							 "scale": 4,
							 "draw_on_top_layer": true,
							 "follow_instance_id": obj_hero,
						 });
											  
	var _cast_delay = 6 / sprite_get_info(spr_outburst_start).frame_speed;
	
	// Repeat the following code for each bullet we need to spawn.
	repeat (_number_of_shots)
	{
		var _callback = method({ _a:_angle }, function() { spawn_bullet(_a); });
		call_later(3*_i + _cast_delay, time_source_units_frames, _callback);
		
		// Increment the angle for the next bullet.
		_angle += _angle_difference;
		_i += 1;
	}	
}

function spawn_bullet(_angle)
{
	audio_play_sound(snd_lightning_throw, 0, 0, 1.0, undefined, 1.0);
	// Create a bullet and assign it to temp variable _bullet.
	var _bullet = instance_create_layer(obj_hero.x, obj_hero.y, "Instances", obj_hero_bullet);
		
	// Change values of the bullet...
	with (_bullet) 
	{
		// Set the bullet's direction.
		direction = _angle;
			
		// Set speed of the bullet.
		speed = 15;
			
		// Rotate the bullet to face it's moving direction.
		image_angle = direction;
	}		
}
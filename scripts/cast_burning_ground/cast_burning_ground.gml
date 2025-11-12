function cast_burning_ground(hero, skill) 
{  
    with (hero)
    {
        // If there is an enemy found...
      	if (nearest_enemy)
      	{
      		// Play sound effect.
      		audio_play_sound(fire_sound, 0, 1, 10.0, undefined, 1.0);
            
            var _number_of_shots = skill.projectile_count;
      	
      		// Create burning_ground attack object.
      		// Create burning_ground attack object.
      		for (var i = 0; i < _number_of_shots; i++)
      		{
      			var _dir = random(360);
      			var _distance = skill.min_range + random(skill.range - skill.min_range);
      			
      			var _x =  lengthdir_x(_distance, _dir);
      			var _y =  lengthdir_y(_distance, _dir);
                
                // Create a bullet and assign it to temp variable _bullet.
                var _bullet = instance_create_layer(x + _x, y + _y, "Instances", skill.projectile_object);
            
                // Change values of the bullet...
                with (_bullet) 
                {
                    // Set the bullet's direction.
                    direction = 0;
                
                    // Set speed of the bullet.
                    speed = 0;
                
                    // Rotate the bullet to face it's moving direction.
                    image_angle = 0;
                    
                    skill_config = skill; 
                    piercing = skill.piercing
                    
                    lifespan = skill.animation_repeats;
                }
      		}
      	}
    }
}
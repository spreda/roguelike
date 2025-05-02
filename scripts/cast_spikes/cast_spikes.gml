function cast_spikes(hero, skill) 
{  
    with (hero)
    {
        // If there is an enemy found...
      	if (nearest_enemy)
      	{ 
            var _particle = instance_create_layer(x, y, "Instances", obj_hero_spikes_particle);
            _particle.target_radius = skill.min_range + 20;
            _particle.lifetime = 200;
            _particle.eccentricity = 1.7;
            
            var _number_of_shots = skill.projectile_count;
            
            var initial_angle = random(360);
            
      		// Create attack object.
      		for (var i = 0; i < _number_of_shots; i++)
      		{
      			var _dir = i / _number_of_shots * 360 * 5234 + random(100) / (i + 1) + initial_angle;
      			var _distance = sqrt(i / _number_of_shots) * skill.min_range + random(10) - 5;
                
      			var _x =  lengthdir_x(_distance, _dir);
      			var _y =  lengthdir_y(_distance, _dir) / 1.7;
                
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
                    
                    lifespan = skill.animation_repeats;
                }
      		}
      	}
    }
}
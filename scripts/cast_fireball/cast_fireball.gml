// Define a function to execute the shooting attack.
function cast_fireball(hero, skill) 
{
    with (hero)
    {
    	// If an enemy is found...
    	if (instance_exists(nearest_enemy))
    	{
            // Get the direction from the hero to the enemy.
            var _direction = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
        
            // Get the angle we should start creating bullets aiming towards.
            var _angle_difference = (skill.projectile_count - 1) * skill.projectile_spread_angle;
        
            // The starting angle.
            var _angle = -_angle_difference / 2;
        
            // Play the sound effect.
            audio_play_sound(snd_lightning_throw, 0, 0, 1.0, undefined, 1.0);
        
            // Repeat the following code for each bullet we need to spawn.
            repeat (skill.projectile_count)
            {
                // Create a bullet and assign it to temp variable _bullet.
                var _bullet = instance_create_layer(x, y, "Instances", skill.projectile_object);
            
                // Change values of the bullet...
                with (_bullet) 
                {
                    // Set the bullet's direction.
                    direction = _direction + _angle;
                
                    // Set speed of the bullet.
                    speed = skill.speed;
                
                    // Rotate the bullet to face it's moving direction.
                    image_angle = direction;
                    
                    skill_config = skill;
                }
            
                // Increment the angle for the next bullet.
                _angle += skill.projectile_spread_angle;
            }
        }
	}
}
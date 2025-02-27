function attack_wave() {		
	// If an enemy is found...
	if (instance_exists(nearest_enemy))
	{
		// Get the direction from the hero to the enemy.
		var _direction = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
	
		// Play the sound effect.
		audio_play_sound(snd_attack_chimes_2, 0, 0, 1.0, undefined, 1.0);
	
		// Create a bullet and assign it to temp variable _bullet.
		var _projectile = instance_create_layer(x, y, "Instances", obj_hero_wave);
		
		// Change values of the projectile...
		with (_projectile) 
		{
			direction = _direction;
			
			speed = 10;
			
			image_angle = direction;
		}
	}
}
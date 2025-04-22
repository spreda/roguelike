function cast_wave(hero, skill) {	
    with (hero)
    {	
        // Get the direction from the hero to the enemy.
        var _direction = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    
        // Play the sound effect.
    
        // Create a projectile.
        //var _spawn_x = x + lengthdir_x(120, _direction);
        //var _spawn_y = y + lengthdir_y(120, _direction);
        var _projectile = spawn_bullet(_direction, skill);
    }
}
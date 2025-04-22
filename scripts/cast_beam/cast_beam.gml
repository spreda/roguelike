function cast_beam(hero, skill) {
    skill.cast_times += 1;
    	
    with (hero)
    {	
        // Get the direction from the hero to the enemy.
        var _direction = 90 - sign(image_xscale) * 90;
    
        // Play the sound effect.
    
        // Create a projectile.
        var _projectile = spawn_bullet(_direction, skill);
        
        _projectile.hero = hero;
    }
}
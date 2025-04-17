function cast_chain_lightning(hero, skill, target=undefined) {	
    with (hero)
    {	
        var _target = target;
        
        if (target == undefined)
        {
            show_debug_message("");
            _target = nearest_enemy; 
        }
        // Get the direction from the hero to the enemy.
        var _direction = point_direction(x, y, _target.x, _target.y);
        
        // Create a projectile.
        var _projectile = spawn_bullet(_direction, skill, skill.projectile_object, hero);
        
        _projectile.caster = hero;
        _projectile.target = _target;
        
        if (target == undefined)
        {
            _projectile.init(_target, skill.piercing, []);
        }
    }
    
    return _projectile;
}
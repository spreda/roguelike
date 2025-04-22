function cast_thunderbolt(hero, skill) {
    with (hero)
    {	
        // Create a projectile.
        var _projectile = spawn_bullet(0, skill, skill.projectile_object, hero);

        _projectile.init();
        
        return _projectile;
    }
}
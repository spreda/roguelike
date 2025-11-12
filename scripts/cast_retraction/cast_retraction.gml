function cast_retraction(hero, skill) {
    with (hero)
    {
        // If there is an enemy found...
      	if (nearest_enemy)
      	{  
            var _max_enemies = 0;
            var _target = undefined;
            var _size = 150;
            
            var _screen_enemy_list = ds_list_create();
            collision_rectangle_list(x-skill.range, y-skill.range, x+skill.range, y+skill.range, obj_enemy, false, false, _screen_enemy_list, false);
            if (ds_list_size(_screen_enemy_list) == 0)
            {
                print("[Retraction] Enemies not found");
                exit;
            }
            print("[Retraction] Total enemies:", _screen_enemy_list);
            
      		// Look for optimal cast spot.
            var _area_enemy_list = ds_list_create();
            print(string(_screen_enemy_list));
      		for (var i = 0; i < 30; i++)
      		{
                ds_list_clear(_area_enemy_list);
                
                // Sample random enemy.
                var _potential_target = _screen_enemy_list[| random(ds_list_size(_screen_enemy_list))];
                var _x =  _potential_target.x;
      			var _y =  _potential_target.y;
                
                // Count the number of enemies in the area.
                var _n_area_enemies = collision_rectangle_list(_x-_size, _y-_size, _x+_size, _y+_size, obj_enemy, false, false, _area_enemy_list, false);
                
                print("[Retraction] Found:", _n_area_enemies);
                
                if (_n_area_enemies > _max_enemies)
                { 
                    _max_enemies = _n_area_enemies;
                    _target = _potential_target;
                }
            } 
            print("[Retraction] Found max:", _max_enemies);
            print("[Retraction] END scan\n");
            
            // Get the average enemy position.
            var _n_area_enemies = collision_rectangle_list(_target.x-_size, _target.y-_size, _target.x+_size, _target.y+_size, obj_enemy, false, false, _area_enemy_list, false);
            var _mean_x = 0;
            var _mean_y = 0;
            for (var _i=0; _i < _n_area_enemies; _i++)
            {
                _mean_x += _area_enemy_list[| _i].x / _n_area_enemies;
                _mean_y += _area_enemy_list[| _i].y / _n_area_enemies;
            }
                
            ds_list_destroy(_screen_enemy_list);
            ds_list_destroy(_area_enemy_list);
            
            // Create a bullet and assign it to temp variable _bullet.
            var _bullet = instance_create_layer(_mean_x, _mean_y, "Instances", skill.projectile_object);
        
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
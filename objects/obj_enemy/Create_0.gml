// Create variable for max hitpoints.
hitpoints_max = 4 * global.enemy_health_bonus * global.enemy_hp_multiplier;

// Create variable for hitpoints.
hitpoints = hitpoints_max;

// Set speed.
walk_speed = 3;

// Set image scale.
image_xscale = global.hero_xscale;
image_yscale = global.hero_xscale;

// Create variable to show/hide the healthbar.
show_healthbar = 0;

// Status effects
burn = 0;
knockback = 0;
knockback_direction = 0;
knockback_decay = 1;
slowdown = 0;
slowdown_duration = 0;

damage_taken_sound = [slime_sound];

while (!(place_empty(x, y, obj_static_prop))) 
{
	x += random(100) - 50;
	y += random(100) - 50;
} 

target_queue = [];
target = obj_hero;

function set_target(new_target)
{
    array_push(target_queue, target);
    target = new_target;
}

function update_target()
{
    while (!instance_exists(target))
    {
        if (array_length(target_queue) > 0)
        {
            target = array_pop(target_queue);
        } else
        {
            target = obj_hero;
        }
    }
}

function take_hit(_damage, _knockback = 0)
{
    // If our hitpoints is over 0,
    // AND we are not currently being hit.
    if (hitpoints > 0 && sprite_index != hit_sprite)
    {
        // Set the healthbar timer to 60.
        // This will cause the healthbar to be visible for that many game steps.
        show_healthbar = 60;

        // Reduce hitpoints by the damage caused by weapon.
        hitpoints -= _damage;

        // Create text popup to indicate damage.
        var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

        // Set text to the damage amount.
        _text.text = _damage;

        // Set sprite to the hit sprite.
        sprite_index = hit_sprite;
        image_index = 0;
        
        if (_knockback != 0)
        {
            var _knockback_vec2 = vec2_add(_knockback, direction + 180, knockback, knockback_direction)
            knockback = _knockback_vec2.length;
            knockback_direction = _knockback_vec2.direction;
        }

        // If hitpoints has reached zero...
        if (hitpoints <= 0)
        {
            // Destroy this instance.
            instance_destroy();
        }
        
        screenshake(_damage, _damage, 0.4); 
        
        return _damage;
    }
    
    return 0;
}
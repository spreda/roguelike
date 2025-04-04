// Call parent event to set up general weapon stuff.
event_inherited();

// Sets default image alpha.
image_alpha = 1;
image_xscale = 2;
image_yscale = 2;

apply_to_target = function(_mob)
{ 
    var _damage = calculate_damage();
    var _skill_config = skill_config;
            
    var _explosion = instance_create_layer(_mob.x, _mob.y, "Instances", obj_hero_wave);
    _explosion.skill_config = _skill_config;
    _explosion.sprite_index = spr_explosion_short_16x16;
    _explosion.scale = 4 * _skill_config.aoe_area_scale;
    _explosion.calculate_damage = function() {
        return skill_config.base_damage * skill_config.damage_scale * skill_config.aoe_damage_portion;
    }
    
    with (_explosion) 
    {
        // Set the bullet's direction.
        direction = 0;
            
        // Set speed of the bullet.
        speed = 0;
            
        // Rotate the bullet to face it's moving direction.
        image_angle = -55;
    }
    
    with (_mob)
	{ 
		// If hitpoints are over zero...
		if (hitpoints > 0)
		{
            // Set the healthbar timer to 60.
			// Causing the healthbar to show for 60 game steps.
			show_healthbar = 60;

			// Reduce hitpoints by the damage caused by the shooting weapon.            
			hitpoints -= _damage;
	
			// Create text popup to indicate damage.
			var _text = instance_create_layer(x + 0, y + 0, "UpgradeScreen", obj_text_popup);

			// Set text to damage amount.
			_text.text = _damage;

			// Set our sprite to the hit sprite.
			sprite_index = hit_sprite;
			image_index = 0;
		}
	}
} 
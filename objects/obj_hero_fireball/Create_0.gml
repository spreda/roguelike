// Call parent event to set up general weapon stuff.
event_inherited();

// Sets default image alpha.
image_alpha = 1;


apply_to_target = function(_mob)
{ 
    var _damage = calculate_damage();
    
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
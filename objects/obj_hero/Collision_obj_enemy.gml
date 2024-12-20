// If the hero is NOT currently being hit and NOT dashing...
if (sprite_index != spr_hero_hit and obj_hero.dash_time_counter <= 0)
{
	// Reduce hitpoints.
	hitpoints -= 1;

	// Create a text popup.
	var _text = instance_create_layer(x, y, "UpgradeScreen", obj_text_popup);
	// Set text for popup.
	_text.text = 1;
	// Set colour for popup.
	_text.color = c_red;
	
	// Change sprite index to hit.
	sprite_index = spr_hero_hit;
	// Reset image index.
	image_index = 0;
	
	// With the enemy...
	with (other) 
	{
			// Change to attack sprite.
		    sprite_index = attack_sprite;
			// Reset image index.
			image_index = 0;
	}
}
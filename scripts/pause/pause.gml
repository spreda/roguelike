// Not paused by default.
global.paused = false;

// Declare pause function.
function pause() 
{
    // Pause the game.
    global.paused = true;
    
    global.toolbar = instance_create_layer(display_get_width(), 75, "Buttons", obj_skill_toolbar);
    global.toolbar.update(obj_hero.skills);

	// Apply the following code to all instances...
	with (all) 
	{
		// Save the instance's speed.
		paused_speed = speed;
	
		// Save the animation speed.
		paused_animation = image_speed;
	
		// Stop moving the instance.
		speed = 0;
	
		// Stop animation.
		image_speed = 0;
	}
}
// Declare unpause function.
function unpause() 
{
	// Unpause.
	global.paused = false;

	// Apply to all instances.
	with (all) 
	{
		// Set speed to saved speed.
		if (variable_instance_exists(id, "paused_speed"))
		{
			speed = paused_speed;
		}
	
		// Set animation speed to saved value.
		if (variable_instance_exists(id, "paused_animation"))
		{
			image_speed = paused_animation;
		}
	}
}
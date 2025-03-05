// Follow set instance
if (instance_exists(follow_instance_id))
{
	x = variable_instance_get(follow_instance_id, "x");
	y = variable_instance_get(follow_instance_id, "y");
}

if (draw_on_top_layer)
{
	// Set depth to a high negative number
	// to make sure it's drawn on top of
	// other things.
	depth = -100000;
} else
{
	// Set depth to negative y.
	// This will cause instances to draw from
	// top to bottom.
	depth = -y;
}
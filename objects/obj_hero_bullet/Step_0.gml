// Set depth to negative y. Sorting our
// draw order the same way as other instances.
depth = -y;

// Checks if game is not paused.
if (!global.paused)
{
	// Reduces the image alpha.
	image_alpha -= delta_time * 0.0000001 * 5;
}

// Checks if the bullet is visable
if (image_alpha <= 0)
{
	// Destroy this instance when it leaves the room bounds.
	instance_destroy();
}
// Checks if the game is paused.
if (global.paused)
{
	// Draw our sprite.
	draw_sprite(sprite_index, 0, x, y);
}
else
{
	// Draw our sprite.
	// Note that we add the sine of current_time
	// to create a bobbing/floating effect.
	draw_sprite(sprite_index, 0, x + 0, y);
}
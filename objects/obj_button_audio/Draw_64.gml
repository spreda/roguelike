// Set frame based on current volume.
image_index = audio_get_master_gain(0) > 0;

// Draw self, this is the button sprite.
draw_self();

// Draw the little speaker icon.

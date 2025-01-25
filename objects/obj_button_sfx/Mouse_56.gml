// Checks if mouse has been clicked on this button.
if (is_clicked)
{
	// Reduce target scale size further.
	target_scale = 0.9;
		
	if (!is_disabled)
	{
		create_slider();
	}	
}

is_disabled = false;
is_clicked = false;
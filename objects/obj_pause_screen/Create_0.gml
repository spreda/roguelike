// Create exit button.
instance_create_layer(x - 180, 1080 - 330, "Buttons", obj_button_exit);

// Create resume button.
instance_create_layer(x + 180, 1080 - 330, "Buttons", obj_button_resume);

// Create volume buttons
instance_create_layer(96, 96, "Buttons", obj_button_music);
instance_create_layer(256, 96, "Buttons", obj_button_sfx);
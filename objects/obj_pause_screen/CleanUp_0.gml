// Clear screen
layer_destroy_instances("Buttons");
instance_create_layer(0, 0, "Buttons", obj_hotkeys_help);

// Call the unpause function.
unpause();
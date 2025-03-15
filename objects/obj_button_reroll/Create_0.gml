// Variable used for clicked state.
is_clicked = false;
selected = false;

// Variable used for button scaling.
target_scale = 1.0;

hotkey = ord("R")

action = function() {
    // Play click sound effect.
    audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);

    // Calls function to generate new upgrades.
    get_upgrades();

    // Destroys self.
    instance_destroy();
}

select = function() {
    // Play click sound effect.
    audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);

    // Sets click state to true.
    is_clicked = true;
    selected = true;
    
    // Reduce target scale size further.
    target_scale = 0.9;
}
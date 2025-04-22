// Variable used for clicked state.
is_clicked = false;

// Variable used for button scaling.
target_scale = 1.0;

hotkey = ord("R");

action = function() {
     // Play click sound effect.
     audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);
     
     // Restart this room.
     // Restarting the game.
     room_restart();
}

select = function() {
    // Play click sound effect.
    audio_play_sound(snd_click, 0, 0, 1.0, undefined, 1.0);
    
    // Sets click state to true.
    is_clicked = true;
    
    // Reduce target scale size further.
    target_scale = 0.9; 
}
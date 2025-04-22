// Variable for upgrade data.
upgrade_data = undefined;

// Variables for moused state.
mouse_over = false;
selected = false;
is_clicked = false;

// Global variable for if mouse is used.
global.is_mouse = false;

// Variable for controller bypass.
gamepad_bypass = false;

// Variables used for hide reveal on upgrades.
roll_life = 0;
roll_alpha = 1;


hotkey = undefined;

action = function() {
    // Play select sound.
    audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);

    // Set variables for upgrade stats.
    var _object = upgrade_data.object;
    var _key = upgrade_data.key;
    var _amount = upgrade_data.amount;

    // Upgrade components stats.
    print("Obj: ", _object, "\nKey: ", _key, "\nAmount: ", _amount)
    _object[$ _key] += _amount;
    
    // Increase skill level
    if (struct_exists(_object, "level"))
    {
        _object[$ "level"] += 1;
    }
    else
    {
        _object[$ "level"] = 0;
    }

    // Destroys upgrades.
    with(obj_upgrade) instance_destroy();

    // Destroys upgrade screen.
    with(obj_upgrade_screen) instance_destroy();

    // Destroys reroll button.
    with(obj_button_reroll) instance_destroy();

    // Plays music sound effect.
    audio_resume_all();
}
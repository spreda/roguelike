x = display_get_width() - 30;
y = display_get_height() - 35;

active = false;

invisible = false;

hotkey = ord("H");

hotkey_list = [];

key_names = {};

// Populate virtual key names
key_names[$ vk_nokey] = "No Key";
key_names[$ vk_anykey] = "Any Key";
key_names[$ vk_left] = "Left Arrow";
key_names[$ vk_right] = "Right Arrow";
key_names[$ vk_up] = "Up Arrow";
key_names[$ vk_down] = "Down Arrow";
key_names[$ vk_enter] = "Enter";
key_names[$ vk_escape] = "Esc";
key_names[$ vk_space] = "Space";
key_names[$ vk_shift] = "Shift";
key_names[$ vk_control] = "Ctrl";
key_names[$ vk_alt] = "Alt";
key_names[$ vk_backspace] = "Backspace";
key_names[$ vk_tab] = "Tab";
key_names[$ vk_home] = "Home";
key_names[$ vk_end] = "End";
key_names[$ vk_delete] = "Delete";
key_names[$ vk_insert] = "Insert";
key_names[$ vk_pageup] = "Page Up";
key_names[$ vk_pagedown] = "Page Down";
key_names[$ vk_pause] = "Pause";
key_names[$ vk_printscreen] = "Print Screen";

// Function keys F1-F12
for (var i = 1; i <= 12; i++) {
    key_names[$ (vk_f1 + (i - 1))] = "F" + string(i);
}

// Numpad keys
for (var i = 0; i <= 9; i++) {
    key_names[$ (vk_numpad0 + i)] = "Num " + string(i);
}

key_names[$ vk_multiply] = "Num *";
key_names[$ vk_divide] = "Num /";
key_names[$ vk_add] = "Num +";
key_names[$ vk_subtract] = "Num -";
key_names[$ vk_decimal] = "Num .";

// Modifier keys (left/right)
key_names[$ vk_lshift] = "Left Shift";
key_names[$ vk_lcontrol] = "Left Ctrl";
key_names[$ vk_lalt] = "Left Alt";
key_names[$ vk_rshift] = "Right Shift";
key_names[$ vk_rcontrol] = "Right Ctrl";
key_names[$ vk_ralt] = "Right Alt";

/// @function keycode_to_name(keycode)
function keycode_to_name(_keycode) {
    // Check if the keycode exists in the struct
    if (variable_struct_exists(key_names, _keycode)) {
        return key_names[$ _keycode];
    }
    // Handle alphanumeric keys (ASCII 32-126)
    else if (_keycode >= ord(" ") && _keycode <= ord("~")) {
        return chr(_keycode);
    }
    // Fallback for unmapped keys
    return "Unknown";
}

action = function() { 
    if (active)
    {
        exit;
    }
    
    // Play select sound.   
    audio_play_sound(snd_ui_select, 0, 0, 1.0, undefined, 1.0);
    
    active = true;
    hotkey_list = [];
    
    var _elements = layer_get_all_elements(layer);
     
    for (var _i=0; _i < array_length(_elements); _i++)
    {
        var _inst = layer_instance_get_instance(_elements[_i]);
        
        if (invisible and _inst == id)
        {
            continue;
        }
        
        if (variable_instance_exists(_inst, "hotkey") and _inst.hotkey)
        { 
            var _key = keycode_to_name(_inst.hotkey);
            
            var _tooltip = instance_create_layer(0, 0, layer, obj_tooltip, {
                parent_obj: _inst, 
                text: _key, 
                always_visible: true,
                offset_x: -string_width(_key) / 2 - 15,
                offset_y: -string_height(_key) / 2,
                halign: fa_right,
            });
            
            array_push(hotkey_list, _tooltip);
        }
    } 
}

clear = function() {
    array_map_ext(hotkey_list, instance_destroy);
    hotkey_list = [];
    active = false;
}
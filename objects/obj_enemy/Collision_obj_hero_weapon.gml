
if (hitpoints > 0 && sprite_index != hit_sprite)
{
    var _sound = array_shuffle(damage_taken_sound)[0];
    show_debug_message(string(audio_get_name(_sound)));
    
    // Play the chosen sound.
    audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
}
            
// Execute weapon effect on enemy
other.collision_with_mob(self);
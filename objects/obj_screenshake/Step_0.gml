if (shake) 
{ 
    shake_time -= 1;
    target_pos.x = lerp(target_pos.x, choose(-shake_magnitude, shake_magnitude) * 10, 0.15); 
    target_pos.y = lerp(target_pos.y, choose(-shake_magnitude, shake_magnitude) * 10, 0.15);

    if (shake_time <= 0) 
    { 
       shake_magnitude -= shake_fade; 
 
       if (shake_magnitude <= 0) 
       {
          shake = false; 
       } 
    } 
}
 
if (!global.paused)
{
    if (instance_exists(obj_hero)) {
        hero_speed.x = (obj_hero.x - hero_pos.x) * 10;
        hero_speed.y = (obj_hero.y - hero_pos.y) * 10;
        
        hero_pos.x = obj_hero.x;
        hero_pos.y = obj_hero.y;
    }
    
    camera_pos.x = lerp(camera_pos.x, hero_speed.x * 3, 0.03);
    camera_pos.y = lerp(camera_pos.y, hero_speed.y * 3, 0.03);
}

var _final_x = clamp(hero_pos.x + camera_pos.x + target_pos.x - display_get_width() / 2, 0, room_width - display_get_width());
var _final_y = clamp(hero_pos.y + camera_pos.y + target_pos.y - display_get_height() / 2, 0, room_height - display_get_height());

camera_set_view_pos(view_camera[0], _final_x, _final_y);

target_pos = { "x": 0, "y": 0 };
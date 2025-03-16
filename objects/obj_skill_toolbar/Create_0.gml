icons = [];
skills = {};

margin = 20;

update = function(skillset) {
    skills = {};
    
    var _skill_names = struct_get_names(skillset);
    var _skill_num = array_length(_skill_names);
    
    for (var _i=0; _i < _skill_num; _i++)
    { 
        var _name = _skill_names[_i];
        if (skillset[$ _name].unlocked)
        {
            skills[$ _name] = skillset[$ _name];
        }
    }
    
    _skill_names = struct_get_names(skills);
    _skill_num = array_length(_skill_names);
    
    var _icon_width = sprite_get_width(skills[$ _skill_names[0]].icon);
    var _width = (_icon_width + margin) * _skill_num - margin;
        
    // Keep on screen.
    var _x = x - _width / 2
    _x = clamp(_x, margin, display_get_width() - _width - margin); 
    
    for (var _i=0; _i < _skill_num; _i++)
    {
       var _skill = skills[$ _skill_names[_i]]; 
       
       var _icon = instance_create_layer(_x + _icon_width / 2 + (_icon_width + margin) * _i, y, layer, obj_skill_icon);
       _icon.update(_skill);
       
       array_push(icons, _icon);
    }
}
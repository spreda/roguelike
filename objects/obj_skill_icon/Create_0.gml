skill = undefined;

update = function(skill_config)
{
    skill = skill_config;
    
    sprite_index = skill.icon;
    
    var _text, _title_text;
    
    with(skill)
    {
        _title_text = name;
        _text = string("Level:{0}\nDamage:{1}\nCooldown:{2}s", level, base_damage*damage_scale*100, cooldown/attack_rate_scale);
    }
    
    instance_create_layer(x, y, layer, obj_tooltip,{
        parent_obj: id, 
        title_text: _title_text,
        text: _text, 
    });
}
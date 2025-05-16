// Call parent event to set up general weapon stuff.
event_inherited();

scale = 4;
image_xscale = scale;
image_yscale = scale;

sounds = [snd_lightning_impact_1, snd_lightning_impact_2];
target_list = [];
distance = 0;

caster = undefined;

shield_hp = 0;
lifespan = 1;

stored_attack_rate_scale = 0;

apply_to_target = function(_caster) { }

collision_with_mob = function(_mob) { }

function init(_caster)
{ 
    caster = _caster;
      
    _caster.signal_attacked.add(function() {
            shield = {id: id};
            instance_destroy(shield.id);
    });
    
    stored_attack_rate_scale = skill_config.attack_rate_scale;
    skill_config.attack_rate_scale = 0;
}
// Set scale.
scale = 1;

// Set sprites for this weapon type.
start_sprite = undefined;
loop_sprite = undefined;
end_sprite = undefined;

lifespan = undefined;

skill_config = undefined;

sounds = [snd_lightning_impact_1, snd_lightning_impact_2];

function calculate_damage()
{
    return skill_config.base_damage * skill_config.damage_scale;
}

function calculate_aoe_damage()
{
    return skill_config.aoe_damage_portion * calculate_damage();
}

init = function()  { }

apply_to_target = function(_mob)
{
    var _damage = calculate_damage();
    
    _mob.take_hit(_damage, skill_config.knockback);
}

collision_with_mob = function(_mob)
{
	// Choose a random shooting sound effect.
	var _sound = array_shuffle(sounds)[0];
			
	// Play the chosen sound.
	audio_play_sound(_sound, 0, 0, 0.1, undefined, 1.0);
	
	// Interaction with mob.
	apply_to_target(_mob);
	
	instance_destroy();
}
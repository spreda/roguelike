// Call parent event to set up general weapon stuff.
event_inherited();

// Set sprite scale.
scale = 6;

i = 0;

apply_to_target = function(_mob)
{
    var _damage = calculate_damage();
    
    var _pull_direction = point_direction(_mob.x, _mob.y, x, y) + 45;
    var _distance = point_distance(_mob.x, _mob.y, x, y);
    
    with (_mob)
    {
        // Pull enemies into the area.
        knockback = 5 * min(_distance / 150 + 0.2, 1);
        knockback_direction = _pull_direction;
        knockback_decay = 0.15;
        
        // Slowdown.
        slowdown = 0.5;
        slowdown_duration = 30;
    }
    
    _mob.take_hit(_damage);
}
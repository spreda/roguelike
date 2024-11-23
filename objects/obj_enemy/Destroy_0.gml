// Easy way to do drop chances
// of different items.
// In this case we have 9 in 10 chance of dropping
// regular collectibles, and a 1 in 10 chance of
// dropping a heart.
// We assign the result to _drop.
var _drop = choose(obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_collectable, obj_heart);

if (!instance_exists(obj_hero))
{
	exit;
}

if (random(1) + 0.5 < obj_hero.hitpoints/obj_hero.hitpoints_max)
{
	_drop = obj_collectable
}

if (_drop == obj_collectable and random(1) > 0.998)
{
	_drop = obj_magnet;
}

// Create the chosen drop.
instance_create_layer(x + 0, y + 0, "Instances", _drop);
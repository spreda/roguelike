// Pick up all items
if (instance_exists(obj_collectable))
{
	obj_collectable.pickup_distance = 10000;
	obj_collectable.max_speed = max(50, obj_collectable.max_speed);
}
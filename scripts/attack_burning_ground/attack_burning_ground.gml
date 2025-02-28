// Define function to execute burning_ground attack.
function attack_burning_ground() 
{
	// If there is an enemy found...
	if (nearest_enemy)
	{
		// Create burning_ground attack object.
		for (var i = 0; i < 5; i++)
		{
			var _dir = random(360);
			var _distance = 100 + random(300);
			
			var _x =  lengthdir_x(_distance, _dir);
			var _y =  lengthdir_y(_distance, _dir);
			
			instance_create_layer(x + _x, y + _y, "Instances", obj_hero_burning_ground);
		}
	}
}
function data_burning_ground()
{
	upgrade_branch_1 =
	[
		{
			"name":			"Damage 1",
			"description":	"Increase damage by 15%.",
			"stats_add":	{ "damage_multiplier": 0.15, },
		},
		{
			"name":			"Damage 2",
			"description":	"Increase damage by 15%.",
			"stats_add":	{ "damage_multiplier": 0.15, },
		},
		{
			"name":			"Damage 3",
			"description":	"Increase damage by 15%.",
			"stats_add":	{ "damage_multiplier": 0.15, },
		},
	];
	
	upgrade_branch_2 =
	[
		{
			"name":			"Barrage 1",
			"description":	"Increase number of fire patches by 2.",
			"stats_add":	{ "number_of_shots": 2, },
		},
		{
			"name":			"Barrage 2",
			"description":	"Increase number of fire patches by 2.",
			"stats_add":	{ "number_of_shots": 2, },
		},
		{
			"name":			"Barrage 3",
			"description":	"Increase number of fire patches by 2.",
			"stats_add":	{ "number_of_shots": 2, },
		},
	];
	
	upgrade_branch_3 =
	[
		{
			"name":			"Attack speed 1",
			"description":	"Increase attack speed by 20%.",
			"stats_add":	{ "attack_speed": 0.2, },
		},
		{
			"name":			"Attack speed 2",
			"description":	"Increase attack speed by 20%.",
			"stats_add":	{ "attack_speed": 0.2, },
		},
		{
			"name":			"Attack speed 3",
			"description":	"Increase attack speed by 20%.",
			"stats_add":	{ "attack_speed": 0.2, },
		},
	];
	
	weapon =
	{
		"name":	"Burning ground",
		"element": "Fire",
		"object": obj_hero_burning_ground,
		"base_damage": 1,
		"distance": 400,
		"speed": 0,
		"cooldown": 4,
		"lifespan": 3,
		"knockback": 0,
		"projectile_count": 3,
		"AOE_area_scale": 0,
		"AOE_damage_scale": 0,
		"upgrade_branches": [upgrade_branch_1, upgrade_branch_2, pgrade_branch_3],
	}
}
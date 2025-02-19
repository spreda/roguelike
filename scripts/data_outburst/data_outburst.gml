function data_outburst()
{
	upgrade_branch_1 =
	[
		{
			"name":			"Damage 1",
			"description":	"Increase damage by 30%.",
			"stats_add":	{ "damage_multiplier": 0.30, },
		},
		{
			"name":			"Damage 2",
			"description":	"Increase damage by 30%.",
			"stats_add":	{ "damage_multiplier": 0.30, },
		},
		{
			"name":			"Damage 3",
			"description":	"Increase damage by 30%.",
			"stats_add":	{ "damage_multiplier": 0.30, },
		},
	];
	
	upgrade_branch_2 =
	[
		{
			"name":			"Barrage 1",
			"description":	"Increase number of fireballs by 1.",
			"stats_add":	{ "number_of_shots": 1, },
		},
		{
			"name":			"Barrage 2",
			"description":	"Increase number of fireballs by 1.",
			"stats_add":	{ "number_of_shots": 1, },
		},
		{
			"name":			"Barrage 3",
			"description":	"Increase number of fireballs by 1.",
			"stats_add":	{ "number_of_shots": 1, },
		},
	];
	
	upgrade_branch_3 =
	[
		{
			"name":			"Explode on contact 1",
			"description":	"Increase explosion radius by 20%",
			"stats_add":	{ "AOE_area_scale": 0.2, },
		},
		{
			"name":			"Explode on contact 2",
			"description":	"Increase explosion radius by 20%",
			"stats_add":	{ "AOE_area_scale": 0.2, },
		},
		{
			"name":			"Explode on contact 3",
			"description":	"Increase explosion radius by 20%",
			"stats_add":	{ "AOE_area_scale": 0.2, },
		},
	];
	
	weapon =
	{
		"name":	"Burning ground",
		"element": "Fire",
		"object": obj_hero_burning_ground,
		"base_damage": 1,
		"distance": 400,
		"speed": 700,
		"cooldown": 0.7,
		"lifespan": 0,
		"knockback": 0,
		"projectile_count": 3,
		"AOE_area_scale": 0.2,
		"AOE_area_scale": 1,
		"AOE_damage_portion": 0.3,
		"AOE_damage_scale": 1,
		"upgrade_branches": [upgrade_branch_1, upgrade_branch_2, pgrade_branch_3],
	}
}
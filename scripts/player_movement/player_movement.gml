if (global.paused)
{
	exit;
}

// Create variables for the mouse anchor position.
global.mouse_anchor_x = 0;
global.mouse_anchor_y = 0;

// Declare player movement script.
function player_movement() 
{
	// Set speed to 0.
	// We increase it again below.
	speed = 0;
	
	if (obj_hero.dash_time_counter < 0)
	{
		obj_hero.dash_time_counter += 1;
		
	}
	
	if (obj_hero.dash_time_counter == 0 and obj_hero.dash_queued)
	{
		dash();
	}
	
	if (obj_hero.dash_time_counter > 0)
	{
		dash();
	}
	else
	{
		walk();
	}
	
	// If hspeed does not equal 0...
	if (hspeed != 0)
	{
		// Flip sprite horizontally based on hspeed.
		image_xscale = global.hero_xscale * -sign(hspeed);
		image_yscale = global.hero_xscale;
	}

	// If sprite is not the hit sprite,
	// meaning the hero isn't currently being hit...
	if (sprite_index != spr_hero_hit)
	{
		// If speed is over 0...
		if (speed > 0)
		{
			// Set sprite to the running sprite.
			sprite_index = spr_hero_run;
			image_index += 0;
		}
	
		// Else speed is 0...
		else
		{
			// Set sprite to the idle sprite.
			sprite_index = spr_hero_idle;
			image_index += 0;
		}
	}
	
	move_and_collide(hspeed, vspeed, obj_collider, 2);
	
	speed = 0;
}

function walk()
{
	// If the left mouse button is pressed...
	if (mouse_check_button_pressed(mb_left))
	{
		// Set the anchor point to the current mouse position.
		global.mouse_anchor_x = device_mouse_x_to_gui(0);
		global.mouse_anchor_y = device_mouse_y_to_gui(0);
	}

	// If the left mouse button is held down...
	if (mouse_check_button(mb_left))
	{
		// If the button is active.
		if (instance_exists(obj_pause_button))
		{
			// If the pause button is not clicked.
			if (!obj_pause_button.is_clicked)
			{
				// Set horizontal and vertical speeds based
				// on the difference between the current mouse
				// poisition and the anchor position.
				hspeed = (device_mouse_x_to_gui(0) - global.mouse_anchor_x) * 0.1;
				vspeed = (device_mouse_y_to_gui(0) - global.mouse_anchor_y) * 0.1;
			}
		}
	}

	// If left mouse button is NOT held down...
	else
	{
		// Stores how many gamepad count.
		var _max_pads = gamepad_get_device_count();

		// Checks when at least 1 gamepad is present.
		if (_max_pads > 0)
		{
			// Checks the gamepad is connected.
			if (gamepad_is_connected(0))
			{
				// Sets the gamepads deadzone.
			    gamepad_set_axis_deadzone(0, 0.1);
				
				// Checks if the gamepads right stick is moved.
				if (gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axislh) != 0)
				{
					// Adds movement speed to player based on left stick input.
					vspeed += walk_speed * gamepad_axis_value(0, gp_axislv);
					hspeed += walk_speed * gamepad_axis_value(0, gp_axislh);
				}
			}
		}
		
		// If the W key is down...
		if (keyboard_check(ord("W")))
		{
			// Add -10 to vertical speed.
			vspeed += -walk_speed;
		}
	
		// If the S key is down...
		if (keyboard_check(ord("S")))
		{
			// Add 10 to vertical speed.
			vspeed += walk_speed;
		}
	
		// If the A key is down...
		if (keyboard_check(ord("A")))
		{
			// Add -10 to horizontal speed.
			hspeed += -walk_speed;
		}
	
		// If the D key is down...
		if (keyboard_check(ord("D")))
		{
			// Add 10 to horizontal speed.
			hspeed += walk_speed;
		}
	}

	// Set the direction from the direction
	// from 0, 0 to hspeed, vspeed.
	direction = point_direction(x, y, x + hspeed, y + vspeed);
	
	// Set speed to a fixed value in the current direction.
	// This essentially normalizes the curent hspeed and vspeed values.
	speed = min(speed, walk_speed);
}

function dash()
{
	if (obj_hero.dash_time_counter >= obj_hero.dash_duration)
	{
		obj_hero.dash_time_counter = -obj_hero.dash_cooldown;
		obj_hero.rotation = 0;
		exit;
	}
	speed = obj_hero.dash_speed;
	obj_hero.dash_time_counter += 1;
	obj_hero.dash_queued = false;
	obj_hero.rotation += 360 / obj_hero.dash_duration * sign(image_xscale);
}
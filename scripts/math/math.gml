// Inverse Linar Interpolation, get the fraction between a and b on which v resides
function inv_lerp(a, b, val)
{
    // Examples
    // --------
    //     0.5 == inv_lerp(0, 100, 50)
    //     0.8 == inv_lerp(1, 5, 4.2)
	//
	return (val - a) / (b - a)
}

function vec2_add(_len_1, _dir_1, _len_2, _dir_2)
{
    var _len_1_x = lengthdir_x(_len_1, _dir_1);
    var _len_2_x = lengthdir_x(_len_2, _dir_2);
    var _len_3_x = _len_1_x + _len_2_x;
    
    var _len_1_y = lengthdir_y(_len_1, _dir_1);
    var _len_2_y = lengthdir_y(_len_2, _dir_2);
    var _len_3_y = _len_1_y + _len_2_y;

    var _len_3 = point_distance(0, 0, _len_3_x, _len_3_y);
    var _dir_3 = point_direction(0, 0, _len_3_x, _len_3_y);
        
    return { length: _len_3, direction: _dir_3 };
}
// Function from the Visual version...
function list_shuffle(list) 
{
	// Shuffle list.
	ds_list_shuffle(list);
}

// This function returns a new struct that is a modified version of the given struct, based on a callback function.
function struct_map(struct, func)
{
    var _new_struct = {}
    var _keys = variable_struct_get_names(struct); 
    for (var _i=0; _i < array_length(_keys); _i++) 
    {
       var _k = _keys[_i];
       var _v = struct[$ _k];
        
       _new_struct[$ _k] = func(_v);
    }
    return _new_struct;
}

// This function mutates existing struct values, based on a callback function.
function struct_map_ext(struct, func)
{
    var _keys = variable_struct_get_names(struct); 
    for (var _i=0; _i < array_length(_keys); _i++) 
    { 
        var _k = _keys[_i]; 
        var _v = struct[$ _k];
        
        struct[$ _k] = func(_v);
    }
}

/// @description Creates a closure to bind a function with captured variables.  
/// @param {Function} func Function/scriрt to execute later.  
/// @param {Array} args OPTIONAL! Variables to capture.  
/// @returns {Method} Function bound to vars.  
///  
/// Usage:  
/// var _clo = closure(my_func, [value1, value2]);  
/// _clo(); // Runs my_func with 'value1' and 'value2' as a local variables.
function closure(func, args = [], offset = 0)
{
    // Capture the required local variables in a struct.
    var _closure_vars =
    {
        func: func,
        args: args,
        offset: offset,
    }

    // Define the function to do the work. 
    var _func_wrapper = function()
    {
        return script_execute_ext(func, args, offset);
    }

    // Bind the function to the struct, allowing it to access the members as if they were local variables. 
    return method(_closure_vars, _func_wrapper);
}
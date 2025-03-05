// Returns all files matching given wildcard pattern.
function find_files(filename_wildcard, directory = "")
{ 
    if (directory == "")
    {
        directory = working_directory;
    }
    
    var _found_files = [];    
    
    show_debug_message("[SEARCH] " + working_directory + filename_wildcard);
    var _filename = file_find_first(working_directory + filename_wildcard, 0);

    while (_filename != "")
    {
        show_debug_message("[FOUND] file: " + string(_filename)); 
        array_push(_found_files, _filename);
        _filename = file_find_next();
    }
    
    show_debug_message("[FOUND_TOTAL] number of files: " + string(array_length(_found_files))); 
    file_find_close();
    
    return _found_files;
}

// Import JSON file as a collection structs or arrays.
function load_json(filename, directory = "")
{
    if (directory == "")
    {
        directory = working_directory;
    }
    
    var _file_buffer = buffer_load(directory + filename);
    var _file_text = buffer_read(_file_buffer, buffer_string);
    buffer_delete(_file_buffer);
    
    return json_parse(_file_text);
}
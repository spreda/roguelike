callbacks = {};
i = 0;

update = function() {
    if (struct_exists(callbacks, string(i)))
        {
            callbacks[$ i]();
        }
}
function signal_create() {
    return {
        listeners: array_create(0),
        add: function(listener) {
            array_push(listeners, listener);
        },
        emit: function() {
            for (var i = 0; i < array_length(listeners); i++) {
                listeners[i]();
            }
        }
    };
}
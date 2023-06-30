function onEvent(eventName, value1, value2) {
    if(eventName == 'CameraSpeed') {
	    var charType:Float = Std.parseFloat(value1);
        this.cameraSpeed = charType;
    }
}
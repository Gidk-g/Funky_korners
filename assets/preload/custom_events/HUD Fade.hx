function onEvent(eventName, value1, value2) {
    if(eventName == 'HUD Fade') {
	    var charType:Int = Std.parseInt(value1);

	    if(Math.isNaN(charType))
		    charType = 0;

	    switch(charType)
	    {
		    case 0:
			    FlxTween.tween(this.camHUD, {alpha: 1}, 0.7, {ease: FlxEase.quadInOut});
		    case 1:
		        FlxTween.tween(this.camHUD, {alpha: 0}, 0.7, {ease: FlxEase.quadInOut});
	    }
    }
}
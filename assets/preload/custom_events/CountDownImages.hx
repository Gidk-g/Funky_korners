function onEvent(eventName, value1, value2) {
    if(eventName == 'CountDownImages') {
        var countDownImage:FlxSprite = new FlxSprite().loadGraphic(Paths.image(value1));
        countDownImage.cameras = [this.camHUD];
        countDownImage.scrollFactor.set();
        countDownImage.updateHitbox();

        if(PlayState.isPixelStage)
            countDownImage.setGraphicSize(Std.int(countDownImage.width * PlayState.daPixelZoom));

        countDownImage.screenCenter();
        countDownImage.antialiasing = ClientPrefs.globalAntialiasing;
        add(countDownImage);

        FlxTween.tween(countDownImage, {alpha: 0}, Conductor.crochet / 1000, {
            ease: FlxEase.cubeInOut,
            onComplete: function(twn:FlxTween)
            {
                this.remove(countDownImage, true);
                countDownImage.destroy();
            }
        });
    }
}
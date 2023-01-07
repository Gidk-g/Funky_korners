var goofy:BGSprite;
var sexyfnfs:BGSprite;
var canSomeoneWalk:Bool = true;

function onCreate()
{
    curStage = 'date';

    var slonce:BGSprite = new BGSprite('date/slonce', -400, -600, 0.9, 0.9);
    slonce.setGraphicSize(Std.int(slonce.width * 1.2));
    slonce.antialiasing = ClientPrefs.globalAntialiasing;
    add(slonce);

    var ziemia:BGSprite = new BGSprite('date/ziemia', -800, 200, 0.9, 0.9);
    ziemia.setGraphicSize(Std.int(ziemia.width * 1.1));
    ziemia.antialiasing = ClientPrefs.globalAntialiasing;
    add(ziemia);

    sexyfnfs = new BGSprite('date/taras', -600, 300, 0.9, 0.9);
    sexyfnfs.setGraphicSize(Std.int(sexyfnfs.width * 1.1));
    sexyfnfs.antialiasing = ClientPrefs.globalAntialiasing;
    add(sexyfnfs);
}

function goofyAhh1()
{
    if(FlxG.random.bool(50)) 
    {
        canSomeoneWalk = false;
        goofy = new BGSprite('date/taiga', -800, -170, 0.9, 0.9, ['taiga']);
        goofy.antialiasing = ClientPrefs.globalAntialiasing;
        FlxTween.tween(goofy, {x: 2945}, 25, {ease: FlxEase.expoOut, onComplete: function(twn:FlxTween) 
            {
                goofy.kill();
                canSomeoneWalk = true;
            }
        });
        FlxTween.tween(goofy, {y: -170}, 3, {ease: FlxEase.expoInOut});
    }
    else
    {
        canSomeoneWalk = false;
        goofy = new BGSprite('date/taiga', 1800, -170, 0.9, 0.9, ['taiga']);
        goofy.antialiasing = ClientPrefs.globalAntialiasing;
        goofy.flipX = true;
        FlxTween.tween(goofy, {x: -2945}, 25, {ease: FlxEase.expoOut, onComplete: function(twn:FlxTween) 
            {
                goofy.kill();
                canSomeoneWalk = true;
            }
        });
        FlxTween.tween(goofy, {y: -170}, 3, {ease: FlxEase.expoInOut});
    }

    goofy.updateHitbox();
    goofy.dance(true);
    add(goofy);
}

function goofyAhh2()
{
    if(FlxG.random.bool(50))
    {
        canSomeoneWalk = false;
        goofy = new BGSprite('date/wipek', -1300, -180, 0.9, 0.9, ['wipek']);
        goofy.antialiasing = ClientPrefs.globalAntialiasing;
        FlxTween.tween(goofy, {x: 2945}, 25, {ease: FlxEase.expoOut, onComplete: function(twn:FlxTween)  
            {
                goofy.kill();
                canSomeoneWalk = true;
            }
        });
        FlxTween.tween(goofy, {y: -180}, 3, {ease: FlxEase.expoInOut});
    }
    else
    {
        canSomeoneWalk = false;
        goofy = new BGSprite('date/wipek', 2300, -180, 0.9, 0.9, ['wipek']);
        goofy.antialiasing = ClientPrefs.globalAntialiasing;
        goofy.flipX = true;
        FlxTween.tween(goofy, {x: -2945}, 25, {ease: FlxEase.expoOut, onComplete: function(twn:FlxTween)  
            {
                goofy.kill();
                canSomeoneWalk = true;
            }
        });
        FlxTween.tween(goofy, {y: -180}, 3, {ease: FlxEase.expoInOut});
    }

    goofy.updateHitbox();
    goofy.dance(true);
    add(goofy);
}

function goofyAhh3()
{
    if(FlxG.random.bool(50))
    {
        canSomeoneWalk = false;
        goofy = new BGSprite('date/alienxhoovie', -2000, -170, 0.9, 0.9, ['alien i hoovie']);
        goofy.antialiasing = ClientPrefs.globalAntialiasing;
        FlxTween.tween(goofy, {x: 2945}, 25, {ease: FlxEase.expoOut, onComplete: function(twn:FlxTween)  
            {
                goofy.kill();
                canSomeoneWalk = true;
            }
        });
        FlxTween.tween(goofy, {y: -170}, 3, {ease: FlxEase.expoInOut});
    }
    else
    {
        canSomeoneWalk = false;
        goofy = new BGSprite('date/alienxhoovie', 3000, -170, 0.9, 0.9, ['alien i hoovie']);
        goofy.antialiasing = ClientPrefs.globalAntialiasing;
        goofy.flipX = true;
        FlxTween.tween(goofy, {x: -2945}, 25, {ease: FlxEase.expoOut, onComplete: function(twn:FlxTween)  
            {
                goofy.kill();
                canSomeoneWalk = true;
            }
        });
        FlxTween.tween(goofy, {y: -170}, 3, {ease: FlxEase.expoInOut});
    }

    goofy.updateHitbox();
    goofy.dance(true);
    add(goofy);
}

function onBeatHit(curBeat:Int)
{
    if(FlxG.random.bool(25) && canSomeoneWalk) {
        goofyAhh1();
        goofyAhh2();
        goofyAhh3();
    }
}

function onStepHit(curStep:Int)
{
    sexyfnfs.visible = false;

    var fnfs:BGSprite = new BGSprite('date/taras', -600, 300, 0.9, 0.9);
    fnfs.setGraphicSize(Std.int(fnfs.width * 1.1));
    fnfs.antialiasing = ClientPrefs.globalAntialiasing;
    add(fnfs);
}
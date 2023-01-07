var pow:BGSprite;

function onCreate()
{
	curStage = 'ohio';

	var bg:BGSprite = new BGSprite('ohio/chmury', -600, -300, 1, 1);
	bg.setGraphicSize(Std.int(bg.width * 1.5));
	bg.antialiasing = ClientPrefs.globalAntialiasing;
	add(bg);

	var nepal:BGSprite = new BGSprite('ohio/nepal', -200, 200, 1, 1);
	nepal.setGraphicSize(Std.int(nepal.width * 1.8));
	nepal.antialiasing = ClientPrefs.globalAntialiasing;
	add(nepal);

	var snow:BGSprite = new BGSprite('ohio/snow', -200, 600, 1, 1);
	snow.setGraphicSize(Std.int(snow.width * 1.5));
	snow.antialiasing = ClientPrefs.globalAntialiasing;
	add(snow);

	var chungus:BGSprite = new BGSprite('ohio/chungus', -225, 200, 1, 1);
	chungus.setGraphicSize(Std.int(chungus.width * 1.1));
	chungus.antialiasing = ClientPrefs.globalAntialiasing;
	add(chungus);

	var choinka:BGSprite = new BGSprite('ohio/choinka', 1000, 200, 1, 1);
	choinka.setGraphicSize(Std.int(choinka.width * 1.1));
	choinka.antialiasing = ClientPrefs.globalAntialiasing;
	add(choinka);

	var ohio:BGSprite = new BGSprite('ohio/ohio', 1300, 500, 1, 1);
	ohio.setGraphicSize(Std.int(ohio.width * 1.1));
	ohio.antialiasing = ClientPrefs.globalAntialiasing;
	add(ohio);

	var gays:BGSprite = new BGSprite('ohio/gays', 1500, 350, 1, 1);
	gays.setGraphicSize(Std.int(gays.width * 1.1));
	gays.antialiasing = ClientPrefs.globalAntialiasing;
	add(gays);

    pow = new BGSprite('ohio/povik', 475, 270, 1, 1, ['Symbol 1']);
    pow.setGraphicSize(Std.int(pow.width * 1.1));
    pow.antialiasing = ClientPrefs.globalAntialiasing;
    pow.updateHitbox();
	add(pow);
}

function onBeatHit(curBeat:Int)
{
	if(curBeat % 2 == 0) {
	    pow.dance(true);
	}
}
var pow:BGSprite;
var gfkor:FlxSprite;
var danceLeft:Bool = false;

function onCreate()
{
    var sciana:BGSprite = new BGSprite('scana', -737, -125, 1, 1);
    sciana.setGraphicSize(2908, 2908);
    sciana.antialiasing = ClientPrefs.globalAntialiasing;
    add(sciana);

    var fnf:BGSprite = new BGSprite('dywan', -1098, 392, 1, 1);
    fnf.setGraphicSize(3120, 1560);
    fnf.antialiasing = ClientPrefs.globalAntialiasing;
    add(fnf);

    var komp:BGSprite = new BGSprite('komputer', -450, 75, 1, 1);
    komp.setGraphicSize(Std.int(1.5 * komp.width));
    komp.antialiasing = ClientPrefs.globalAntialiasing;
    add(komp);

    var szafa:BGSprite = new BGSprite('szafa', -998, -125, 1, 1);
    szafa.setGraphicSize(Std.int(1.3 * szafa.width));
    szafa.antialiasing = ClientPrefs.globalAntialiasing;
    add(szafa);

    var banhammer:BGSprite = new BGSprite('banhammer', -65, -100, 1, 1);
    banhammer.setGraphicSize(Std.int(1.4 * banhammer.width));
    banhammer.antialiasing = ClientPrefs.globalAntialiasing;
    add(banhammer);

    var pufa:BGSprite = new BGSprite('pufa', 300, 50, 1, 1);
    pufa.setGraphicSize(Std.int(0.75 * pufa.width));
    pufa.antialiasing = ClientPrefs.globalAntialiasing;
    add(pufa);

    pow = new BGSprite('pow', 500, 100, 1, 1, ['pow']);
    pow.setGraphicSize(Std.int(pow.width * 0.85));
    pow.antialiasing = ClientPrefs.globalAntialiasing;
    pow.updateHitbox();

    if(PlayState.SONG.song.toLowerCase() == 'copied') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'cosplay') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'copied-remix') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'lured') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'double-trouble') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'new-guest') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'ushanka') {
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'martian-madness') {
        add(pow);
    }

    gfkor = new FlxSprite(-300, -70);
    gfkor.frames = Paths.getSparrowAtlas('characters/GF', 'shared');
    gfkor.animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
    gfkor.animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
    gfkor.antialiasing = ClientPrefs.globalAntialiasing;
    if(PlayState.SONG.song.toLowerCase() == 'double-trouble') {
        add(gfkor);
        add(pow);
    }

    if(PlayState.SONG.song.toLowerCase() == 'martian-madness') {
        spawnGirlfriend(false);
    }
}

function onBeatHit(curBeat:Int)
{
    if(curBeat % 2 == 0) {
        danceLeft = !danceLeft;
        if (danceLeft)
            gfkor.animation.play('danceRight');
        else
            gfkor.animation.play('danceLeft');
        pow.dance(true);
    }
}
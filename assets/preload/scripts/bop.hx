var bober:BGSprite;
var roner:BGSprite;
var korner:BGSprite;

function onCreatePost()
{
    bober = new BGSprite('bober', 650, 400, 0.9, 0.9, ['bober']);
    bober.setGraphicSize(Std.int(bober.width * 1.15));
    bober.antialiasing = ClientPrefs.globalAntialiasing;
    bober.updateHitbox();

    roner = new BGSprite('roner', -1100, 350, 0.9, 0.9, ['roner']);
    roner.setGraphicSize(Std.int(roner.width * 1.15));
    roner.antialiasing = ClientPrefs.globalAntialiasing;
    roner.updateHitbox();

    korner = new BGSprite('korner_idle', -100, 360, 0.9, 0.9, ['korner']);
    korner.setGraphicSize(Std.int(korner.width * 1.4));
    korner.antialiasing = ClientPrefs.globalAntialiasing;
    korner.updateHitbox();

    if(PlayState.SONG.song.toLowerCase() == 'lured') {
        add(bober);
        add(roner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'double-trouble') {
        add(bober);
        add(roner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'copy-cat') {
        add(bober);
        add(roner);  
    }

    if(PlayState.SONG.song.toLowerCase() == 'ushanka') {
        add(korner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'new-guest') {
        add(korner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'martian-madness') {
        add(korner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'copied-remix') {
        add(bober);
        add(roner);  
    }

    if(PlayState.SONG.song.toLowerCase() == 'cookie-beat') {
        add(bober);
        add(roner);
        add(korner);
    }
}

function onBeatHit(curBeat:Int)
{
    if(curBeat % 2 == 0) {
        bober.dance(true);
        roner.dance(true);
        korner.dance(true);
    }
}

function add(value:Dynamic)
{
    PlayState.instance.add(value);
}
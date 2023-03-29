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
        PlayState.instance.add(bober);
        PlayState.instance.add(roner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'double-trouble') {
        PlayState.instance.add(bober);
        PlayState.instance.add(roner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'copy-cat') {
        PlayState.instance.add(bober);
        PlayState.instance.add(roner);  
    }

    if(PlayState.SONG.song.toLowerCase() == 'ushanka') {
        PlayState.instance.add(korner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'new-guest') {
        PlayState.instance.add(korner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'martian-madness') {
        PlayState.instance.add(korner);
    }

    if(PlayState.SONG.song.toLowerCase() == 'copied-remix') {
        PlayState.instance.add(bober);
        PlayState.instance.add(roner);  
    }

    if(PlayState.SONG.song.toLowerCase() == 'cookie-beat') {
        PlayState.instance.add(bober);
        PlayState.instance.add(roner);
        PlayState.instance.add(korner);
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
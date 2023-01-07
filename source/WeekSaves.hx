package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import openfl.filters.ShaderFilter;
import WeekData;
import flixel.addons.display.FlxTiledSprite;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.system.FlxAssets;


using StringTools;

class WeekSaves
{

    public static var copiedLock:String = 'locked';
    public static var cosplayLock:String = 'locked';
    public static var luredLock:String = 'locked';
    public static var copiedrLock:String = 'locked';
    public static var cookieLock:String = 'locked';
    public static var guestLock:String = 'locked';
    public static var ushankaLock:String = 'locked';
    public static var trubluLock:String = 'locked';
    public static var alienLock:String = 'locked';
    public static var dateLock:String = 'locked';
    public static var kornerchLock:String = 'locked';
    public static var wojtichLock:String = 'locked';


    public static function fuckinSet() {
        if (FlxG.save.data.copiedLock == null) FlxG.save.data.copiedLock = 'locked';
        if (FlxG.save.data.cosplayLock == null) FlxG.save.data.cosplayLock = 'locked';
        if (FlxG.save.data.luredLock == null) FlxG.save.data.luredLock = 'locked';
        if (FlxG.save.data.copiedrLock == null) FlxG.save.data.copiedrLock = 'locked';
        if (FlxG.save.data.cookieLock == null) FlxG.save.data.cookieLock = 'locked';
        if (FlxG.save.data.guestLock == null) FlxG.save.data.guestLock = 'locked';
        if (FlxG.save.data.ushankaLock == null) FlxG.save.data.ushankaLock = 'locked';
        if (FlxG.save.data.trubluLock == null) FlxG.save.data.trubluLock = 'locked';
        if (FlxG.save.data.alienLock == null) FlxG.save.data.alienLock = 'locked';
        if (FlxG.save.data.dateLock == null) FlxG.save.data.dateLock = 'locked';
        if (FlxG.save.data.kornerchLock == null) FlxG.save.data.kornerchLock = 'locked';
        if (FlxG.save.data.wojtichLock == null) FlxG.save.data.wojtichLock = 'locked';
        FlxG.save.flush();
    }

    public static function saveShit() {
        FlxG.save.data.copiedLock = copiedLock;
        FlxG.save.data.cosplayLock = cosplayLock;
        FlxG.save.data.luredLock = luredLock;
        FlxG.save.data.copiedrLock = copiedrLock;
        FlxG.save.data.cookieLock = cookieLock;
        FlxG.save.data.guestLock = guestLock;
        FlxG.save.data.ushankaLock = ushankaLock;
        FlxG.save.data.trubluLock = trubluLock;
        FlxG.save.data.alienLock = alienLock;
        FlxG.save.data.dateLock = dateLock;
        FlxG.save.data.kornerchLock = kornerchLock;
        FlxG.save.data.wojtichLock = wojtichLock;
        FlxG.save.flush();
    }

    public static function loadShit() { //golly gee willikers
        copiedLock = FlxG.save.data.copiedLock;
        cosplayLock = FlxG.save.data.cosplayLock;
        luredLock = FlxG.save.data.luredLock;
        copiedrLock = FlxG.save.data.copiedrLock;
        cookieLock = FlxG.save.data.cookieLock;
        guestLock = FlxG.save.data.guestLock;
        ushankaLock = FlxG.save.data.ushankaLock;
        trubluLock = FlxG.save.data.trubluLock;
        alienLock = FlxG.save.data.alienLock;
        dateLock = FlxG.save.data.dateLock;
        kornerchLock = FlxG.save.data.kornerchLock;
        wojtichLock = FlxG.save.data.wojtichLock;
        FlxG.save.flush();
    }
}
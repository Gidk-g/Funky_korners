package;

import sys.FileSystem;
import korner.ScriptHandler;
import editors.WeekEditorState.WeekEditorFreeplayState;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUISpriteButton;
import options.BaseOptionsMenu;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.ui.FlxUISpriteButton;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.0.0'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [


	];

	var magenta:FlxSprite;
	var credits:FlxSprite;
	var options:FlxSprite;
	var optionshit:FlxUISpriteButton;
	var korner:FlxSprite;
	var kornerhit:FlxUISpriteButton;
	var wojti:FlxSprite;
	var wojtihit:FlxUISpriteButton;
	var chisra:FlxSprite;
	var chisrahit:FlxUISpriteButton;
	var has:FlxSprite;
	var ez:FlxUISpriteButton;
	var creditshit:FlxUISpriteButton;
	var debugKeys:Array<FlxKey>;
	


	public var mouseQuant:Bool = false;


	public var menuScript:ScriptHandler;


	override function create()

	{

		WeekSaves.fuckinSet();

		FlxG.mouse.visible = true;

		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuYT'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 0.675));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		credits = new FlxSprite(0,0).loadGraphic(Paths.image('Symbol_2'));
		credits.x += 5;
		credits.y += 550;
		credits.scrollFactor.set();
		credits.setGraphicSize(Std.int(credits.width * 0.5));
		credits.updateHitbox();
		credits.antialiasing = ClientPrefs.globalAntialiasing;
		add(credits);

		creditshit = new FlxUISpriteButton(credits.x, credits.y, magenta, clickOptions);
		creditshit.setGraphicSize(Std.int(creditshit.width * 2));
		creditshit.updateHitbox();
		creditshit.autoCenterLabel();
		creditshit.alpha = 0;
		creditshit.antialiasing = ClientPrefs.globalAntialiasing;
		add(creditshit);

		options = new FlxSprite(0,0).loadGraphic(Paths.image('Symbol_1'));
		options.x += 5;
		options.y += 500;
		options.scrollFactor.set();
		options.setGraphicSize(Std.int(options.width * 0.5));
		options.updateHitbox();
		options.antialiasing = ClientPrefs.globalAntialiasing;
		add(options);

		optionshit = new FlxUISpriteButton(options.x, options.y, magenta, clickCredits);
		optionshit.setGraphicSize(Std.int(optionshit.width * 2));
		optionshit.updateHitbox();
		optionshit.alpha = 0;
		optionshit.antialiasing = ClientPrefs.globalAntialiasing;
		add(optionshit);

		korner = new FlxSprite(0,0).loadGraphic(Paths.image('KORNER'));
		korner.x += 0;
		korner.y += 0;
		korner.scrollFactor.set();
		korner.setGraphicSize(Std.int(korner.width * 0.675));
		korner.updateHitbox();
		korner.antialiasing = ClientPrefs.globalAntialiasing;
		add(korner);


			
		kornerhit = new FlxUISpriteButton(500, 150, magenta, clickKorner);
		kornerhit.setGraphicSize(Std.int(kornerhit.width * 3));
		kornerhit.updateHitbox();

		kornerhit.alpha = 0;
		kornerhit.antialiasing = ClientPrefs.globalAntialiasing;
		add(kornerhit);

		wojti = new FlxSprite(0,0).loadGraphic(Paths.image('WOJTII'));
		wojti.x += 0;
		wojti.y += 0;
		wojti.scrollFactor.set();
		wojti.setGraphicSize(Std.int(wojti.width * 0.675));
		wojti.updateHitbox();
		wojti.antialiasing = ClientPrefs.globalAntialiasing;
		add(wojti);

		wojtihit = new FlxUISpriteButton(500, 275, magenta, clickWojti);
		wojtihit.setGraphicSize(Std.int(wojtihit.width * 3));
		wojtihit.updateHitbox();
		wojtihit.alpha = 0;
		wojtihit.antialiasing = ClientPrefs.globalAntialiasing;
		add(wojtihit);

		chisra = new FlxSprite(0,0).loadGraphic(Paths.image('christmas'));
		chisra.x += 0;
		chisra.y += 0;
		chisra.scrollFactor.set();
		chisra.setGraphicSize(Std.int(chisra.width * 0.675));
		chisra.updateHitbox();
		chisra.antialiasing = ClientPrefs.globalAntialiasing;
		add(chisra);

		chisrahit = new FlxUISpriteButton(500, 400, magenta, clickChristmas);
		chisrahit.setGraphicSize(Std.int(chisrahit.width * 3));
		chisrahit.updateHitbox();
		chisrahit.alpha = 0;
		chisrahit.antialiasing = ClientPrefs.globalAntialiasing;
		add(chisrahit);

		has = new FlxSprite(0,0).loadGraphic(Paths.image('omg'));
		has.x += 350;
		has.y += 510;
		has.scrollFactor.set();
		has.setGraphicSize(Std.int(has.width * 0.675));
		has.updateHitbox();
		has.antialiasing = ClientPrefs.globalAntialiasing;
		add(has);

		ez = new FlxUISpriteButton(700, 525, magenta, neverGonna);
		ez.setGraphicSize(Std.int(ez.width * 3));
		ez.updateHitbox();
		ez.alpha = 0;
		ez.antialiasing = ClientPrefs.globalAntialiasing;
		add(ez);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 0.6));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		
		// magenta.scrollFactor.set();



		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.x += 250;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}



		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Korner\'s Funky Club", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	function clickOptions() {
		MusicBeatState.switchState(new options.OptionsState());
	}
	function clickCredits() {
		MusicBeatState.switchState(new CreditsState());
	}
	function clickKorner() {
		MusicBeatState.switchState(new KornerState());
	}
	function clickWojti() {
		MusicBeatState.switchState(new WojtiState());
	}
	function clickChristmas() {
		MusicBeatState.switchState(new ChristmasState());
	}
	function neverGonna() {
		CoolUtil.browserLoad('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
	}
	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.mouse.justPressed)
		{
			trace('sex');
		}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);


		if (!selectedSomethin)
		{

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}


			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				spr.centerOffsets();
			}
		});
	}
}

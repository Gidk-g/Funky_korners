package;

import editors.WeekEditorState.WeekEditorFreeplayState;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUISpriteButton;
import options.BaseOptionsMenu;
import flixel.util.FlxTimer;
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
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;
import flixel.util.FlxSave;

using StringTools;

class WojtiState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.0.0'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	var curDifficulty:Int = 1;
	
	var optionShit:Array<String> = [


	];

	var magenta:FlxSprite;
	var credits:FlxSprite;
	var options:FlxSprite;
	var optionshit:FlxUISpriteButton;
	var story:FlxSprite;
    var play:FlxSprite;
	var playhit:FlxUISpriteButton;
	var copied:FlxSprite;
	var copiedhit:FlxUISpriteButton;
	var copiedr:FlxSprite;
	var copiedrhit:FlxUISpriteButton;
	var cosplay:FlxSprite;
	var cosplayhit:FlxUISpriteButton;
	var lured:FlxSprite;
	var luredhit:FlxUISpriteButton;
	var cookie:FlxSprite;
	var cookiehit:FlxUISpriteButton;
	var creditshit:FlxUISpriteButton;
	var debugKeys:Array<FlxKey>;
	var bonus:FlxSprite;



	override function create()

	{



		
// Create a white circle to use as a cursor graphic
var sprite = new FlxSprite();
sprite.makeGraphic(15, 15, FlxColor.TRANSPARENT);
sprite.drawCircle();


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
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuWojti'));
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

        story = new FlxSprite(0,0).loadGraphic(Paths.image('mod'));
		story.x += 275;
		story.y += 320;
		story.scrollFactor.set();
		story.setGraphicSize(Std.int(story.width * 0.45));
		story.updateHitbox();
		story.antialiasing = ClientPrefs.globalAntialiasing;
		add(story);

		bonus = new FlxSprite(0,0).loadGraphic(Paths.image('Symbol_1234'));
		bonus.x += 275;
		bonus.y += 495;
		bonus.scrollFactor.set();
		bonus.setGraphicSize(Std.int(bonus.width * 0.45));
		bonus.updateHitbox();
		bonus.antialiasing = ClientPrefs.globalAntialiasing;
		add(bonus);


        play = new FlxSprite(0,0).loadGraphic(Paths.image('play'));
		play.x += 450;
		play.y += 330;
		play.scrollFactor.set();
		play.setGraphicSize(Std.int(play.width * 0.55));
		play.updateHitbox();
		play.antialiasing = ClientPrefs.globalAntialiasing;
		add(play);

		playhit = new FlxUISpriteButton(play.x, play.y, magenta, clickPlay);
		playhit.setGraphicSize(Std.int(optionshit.width * 0.9));
		playhit.updateHitbox();
		playhit.alpha = 0;
		playhit.antialiasing = ClientPrefs.globalAntialiasing;
		add(playhit);

		WeekSaves.loadShit();
		if (FlxG.save.data.guestLock == "unlocked")
			{
		copied = new FlxSprite(0,0).loadGraphic(Paths.image('wojti'));
		copied.x += 342.5;
		copied.y += 360;
		copied.scrollFactor.set();
		copied.setGraphicSize(Std.int(copied.width * 0.08));
		copied.updateHitbox();
		copied.antialiasing = ClientPrefs.globalAntialiasing;
		add(copied);
		copiedhit = new FlxUISpriteButton(copied.x, copied.y, magenta, clickPlayCopied);
		copiedhit.setGraphicSize(150, 100);
		copiedhit.updateHitbox();
		copiedhit.alpha = 0;
		copiedhit.antialiasing = ClientPrefs.globalAntialiasing;
		add(copiedhit);
		
			}
			else
			{
				copied = new FlxSprite(0,0).loadGraphic(Paths.image('wtfwhosthat'));
				copied.x += 342.5;
				copied.y += 360;
				copied.scrollFactor.set();
				copied.setGraphicSize(Std.int(copied.width * 0.08));
				copied.updateHitbox();
				copied.antialiasing = ClientPrefs.globalAntialiasing;
				add(copied);
			}


		
		

		if (FlxG.save.data.alienLock == "unlocked")
			{
		copiedr = new FlxSprite(0,0).loadGraphic(Paths.image('kosmitaju'));
		copiedr.x += 342.5;
		copiedr.y += 535;
		copiedr.scrollFactor.set();
		copiedr.setGraphicSize(Std.int(copiedr.width * 0.08));
		copiedr.updateHitbox();
		copiedr.antialiasing = ClientPrefs.globalAntialiasing;
		add(copiedr);
		
			}
			else
				{
					copiedr = new FlxSprite(0,0).loadGraphic(Paths.image('wtfwhosthat'));
					copiedr.x += 342.5;
					copiedr.y += 535;
					copiedr.scrollFactor.set();
					copiedr.setGraphicSize(Std.int(copiedr.width * 0.08));
					copiedr.updateHitbox();
					copiedr.antialiasing = ClientPrefs.globalAntialiasing;
					add(copiedr);
				}

		copiedrhit = new FlxUISpriteButton(copiedr.x, copiedr.y, magenta, clickPlayCopiedR);
		copiedrhit.setGraphicSize(150, 100);
		copiedrhit.updateHitbox();
		copiedrhit.alpha = 0;
		copiedrhit.antialiasing = ClientPrefs.globalAntialiasing;
		add(copiedrhit);
		

		if (FlxG.save.data.ushankaLock == "unlocked")
			{
		cosplay = new FlxSprite(0,0).loadGraphic(Paths.image('wojti'));
		cosplay.x += 502.5;
		cosplay.y += 360;
		cosplay.scrollFactor.set();
		cosplay.setGraphicSize(Std.int(cosplay.width * 0.08));
		cosplay.updateHitbox();
		cosplay.antialiasing = ClientPrefs.globalAntialiasing;
		add(cosplay);
		cosplayhit = new FlxUISpriteButton(cosplay.x, cosplay.y, magenta, clickPlayCosplay);
		cosplayhit.setGraphicSize(150, 100);
		cosplayhit.updateHitbox();
		cosplayhit.alpha = 0;
		cosplayhit.antialiasing = ClientPrefs.globalAntialiasing;
		add(cosplayhit);
			}
			else
			{
				cosplay = new FlxSprite(0,0).loadGraphic(Paths.image('wtfwhosthat'));
				cosplay.x += 502.5;
				cosplay.y += 360;
				cosplay.scrollFactor.set();
				cosplay.setGraphicSize(Std.int(cosplay.width * 0.08));
				cosplay.updateHitbox();
				cosplay.antialiasing = ClientPrefs.globalAntialiasing;
				add(cosplay);
			}

		
		if (FlxG.save.data.trubluLock == "unlocked")
			{
		lured = new FlxSprite(0,0).loadGraphic(Paths.image('trublu'));
		lured.x += 662.5;
		lured.y += 360;
		lured.scrollFactor.set();
		lured.setGraphicSize(Std.int(lured.width * 0.08));
		lured.updateHitbox();
		lured.antialiasing = ClientPrefs.globalAntialiasing;
		add(lured);
		luredhit = new FlxUISpriteButton(lured.x, lured.y, magenta, clickPlayLured);
		luredhit.setGraphicSize(150, 100);
		luredhit.updateHitbox();
		luredhit.alpha = 0;
		luredhit.antialiasing = ClientPrefs.globalAntialiasing;
		add(luredhit);
			}
			else
				{
					lured = new FlxSprite(0,0).loadGraphic(Paths.image('wtfwhosthat'));
					lured.x += 662.5;
					lured.y += 360;
					lured.scrollFactor.set();
					lured.setGraphicSize(Std.int(lured.width * 0.08));
					lured.updateHitbox();
					lured.antialiasing = ClientPrefs.globalAntialiasing;
					add(lured);
				}



		if(FlxG.save.data.dateLock == "unlocked")
			{
			cookie = new FlxSprite(0,0).loadGraphic(Paths.image('date'));
		cookie.x += 502.5;
		cookie.y += 535;
		cookie.scrollFactor.set();
		cookie.setGraphicSize(Std.int(cookie.width * 0.08));
		cookie.updateHitbox();
		cookie.antialiasing = ClientPrefs.globalAntialiasing;
		add(cookie);
			}
			else
			{
				cookie = new FlxSprite(0,0).loadGraphic(Paths.image('wtfwhosthat'));
				cookie.x += 502.5;
				cookie.y += 535;
				cookie.scrollFactor.set();
				cookie.setGraphicSize(Std.int(cookie.width * 0.08));
				cookie.updateHitbox();
				cookie.antialiasing = ClientPrefs.globalAntialiasing;
				add(cookie);
			}
			cookiehit = new FlxUISpriteButton(cookie.x, cookie.y, magenta, clickPlayPow);
			cookiehit.setGraphicSize(150, 100);
			cookiehit.updateHitbox();
			cookiehit.alpha = 0;
			cookiehit.antialiasing = ClientPrefs.globalAntialiasing;
			add(cookiehit);
		



		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 0.6));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xffff437c;
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





		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		super.create();
	}

	function clickOptions() {
		MusicBeatState.switchState(new options.OptionsState());
	}
	function clickCredits() {
		MusicBeatState.switchState(new CreditsState());
	}
    function clickPlay() {
		FlxG.mouse.visible = false;
								// Nevermind that's stupid lmao
								PlayState.storyPlaylist = ["new-guest", "ushanka", "double-trouble"];
								PlayState.isStoryMode = true;
								PlayState.seenCutscene = false;

								var diffic = "-hard";

								PlayState.storyDifficulty = 0;

								PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
								PlayState.storyWeek = 1;
								PlayState.campaignScore = 0;
								PlayState.campaignMisses = 0;
								new FlxTimer().start(0.5, function(tmr:FlxTimer)
								{
									LoadingState.loadAndSwitchState(new PlayState());
									FlxG.sound.music.volume = 0;
									FreeplayState.destroyFreeplayVocals();
								});
								
	}

	function clickPlayCopied() 
		{
			FlxG.mouse.visible = false;
		// Nevermind that's stupid lmao
		PlayState.storyPlaylist = ["new-guest"];
		PlayState.isStoryMode = false;
		PlayState.seenCutscene = false;

		var diffic = "-hard";

		PlayState.storyDifficulty = 0;

		PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
		PlayState.storyWeek = 1;
		PlayState.campaignScore = 0;
		PlayState.campaignMisses = 0;
		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState());
			FlxG.sound.music.volume = 0;
			FreeplayState.destroyFreeplayVocals();
		});
		trace('with hitler');
}
function clickPlayCopiedR() 
	{
		FlxG.mouse.visible = false;
	// Nevermind that's stupid lmao
	PlayState.storyPlaylist = ["martian-madness"];
	PlayState.isStoryMode = false;
	PlayState.seenCutscene = false;

	var diffic = "-hard";

	PlayState.storyDifficulty = 0;

	PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
	PlayState.storyWeek = 1;
	PlayState.campaignScore = 0;
	PlayState.campaignMisses = 0;
	new FlxTimer().start(0.5, function(tmr:FlxTimer)
	{
		LoadingState.loadAndSwitchState(new PlayState());
		FlxG.sound.music.volume = 0;
		FreeplayState.destroyFreeplayVocals();
	});
	trace('with hitler');
}
function clickPlayCosplay() 
	{
		FlxG.mouse.visible = false;
	// Nevermind that's stupid lmao
	PlayState.storyPlaylist = ["ushanka"];
	PlayState.isStoryMode = false;
	PlayState.seenCutscene = false;

	var diffic = "-hard";

	PlayState.storyDifficulty = 0;

	PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
	PlayState.storyWeek = 1;
	PlayState.campaignScore = 0;
	PlayState.campaignMisses = 0;
	new FlxTimer().start(0.5, function(tmr:FlxTimer)
	{
		LoadingState.loadAndSwitchState(new PlayState());
		FlxG.sound.music.volume = 0;
		FreeplayState.destroyFreeplayVocals();
	});
	trace('with hitler');
}
function clickPlayLured() 
	{
		FlxG.mouse.visible = false;
	PlayState.storyPlaylist = ["double-trouble"];
	PlayState.isStoryMode = false;
	PlayState.seenCutscene = false;

	var diffic = "-hard";

	PlayState.storyDifficulty = 0;

	PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
	PlayState.storyWeek = 1;
	PlayState.campaignScore = 0;
	PlayState.campaignMisses = 0;
	new FlxTimer().start(0.5, function(tmr:FlxTimer)
	{
		LoadingState.loadAndSwitchState(new PlayState());
		FlxG.sound.music.volume = 0;
		FreeplayState.destroyFreeplayVocals();
	});
	trace('with hitler');
}
function clickPlayPow() 
	{
		FlxG.mouse.visible = false;
	// Nevermind that's stupid lmao
	PlayState.storyPlaylist = ["lovely-evening"];
	PlayState.isStoryMode = false;
	PlayState.seenCutscene = false;

	var diffic = "-hard";

	PlayState.storyDifficulty = 0;

	PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
	PlayState.storyWeek = 1;
	PlayState.campaignScore = 0;
	PlayState.campaignMisses = 0;
	new FlxTimer().start(0.5, function(tmr:FlxTimer)
	{
		LoadingState.loadAndSwitchState(new PlayState());
		FlxG.sound.music.volume = 0;
		FreeplayState.destroyFreeplayVocals();
	});
	trace('with hitler');
}

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
				MusicBeatState.switchState(new MainMenuState());
			}

			if(FlxG.keys.justPressed.CONTROL)
				{
					persistentUpdate = false;
					openSubState(new GameplayChangersSubstate());
				}


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
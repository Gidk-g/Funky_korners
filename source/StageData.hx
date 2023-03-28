package;

import Song;
import haxe.Json;
import sys.FileSystem;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.OverlayShader;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.system.scaleModes.*;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.Assets;
import openfl.display.BlendMode;
import openfl.display.GraphicsShader;
import openfl.filters.ShaderFilter;
import korner.ScriptHandler;
import haxe.format.JsonParser;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end

using StringTools;

typedef StageFile =
{
	var directory:String;
	var defaultZoom:Float;
	var isPixelStage:Bool;

	var boyfriend:Array<Dynamic>;
	var girlfriend:Array<Dynamic>;
	var opponent:Array<Dynamic>;
	var hide_girlfriend:Bool;

	var camera_boyfriend:Array<Float>;
	var camera_opponent:Array<Float>;
	var camera_girlfriend:Array<Float>;
	var camera_speed:Null<Float>;

    var objects:Array<StageObject>;
}

typedef StageObject =
{
	var name:Null<String>;
	var image:Null<String>;
	var position:Null<Array<Float>>;
	var scrollFactor:Null<Array<Float>>;
	var scale:Null<Array<Float>>;
	var animations:Null<Array<Dynamic>>;
	var defaultAnimation:Null<String>;
	var flipX:Null<Bool>;
	var flipY:Null<Bool>;
	var size:Null<Float>;
	var layer:String;
	var blend:String;
	var antialiasing:Bool;
}

class StageData
{
	public static var forceNextDirectory:String = null;

	public static function loadDirectory(SONG:SwagSong)
	{
		var stage:String = '';

		if(SONG.stage != null)
		{
			stage = SONG.stage;
		}
		else if(SONG.song != null)
		{
			switch (SONG.song.toLowerCase().replace(' ', '-'))
			{
				case 'spookeez' | 'south' | 'monster':
					stage = 'spooky';
				case 'pico' | 'blammed' | 'philly' | 'philly-nice':
					stage = 'philly';
				case 'milf' | 'satin-panties' | 'high':
					stage = 'limo';
				case 'cocoa' | 'eggnog':
					stage = 'mall';
				case 'winter-horrorland':
					stage = 'mallEvil';
				case 'senpai' | 'roses':
					stage = 'school';
				case 'thorns':
					stage = 'schoolEvil';
				case 'ugh' | 'guns' | 'stress':
					stage = 'tank';
				default:
					stage = 'stage';
			}
		} 
	    else
		{
			stage = 'stage';
		}

		var stageFile:StageFile = getStageFile(stage);

		if(stageFile == null)
			forceNextDirectory = '';
		else
			forceNextDirectory = stageFile.directory;
	}

	public static function getStageFile(stage:String):StageFile
	{
		var rawJson:String = null;
		var path:String = Paths.getPreloadPath('stages/' + stage + '.json');

		#if MODS_ALLOWED
		var modPath:String = Paths.modFolders('stages/' + stage + '.json');
		if(FileSystem.exists(modPath))
			rawJson = File.getContent(modPath);
		else if(FileSystem.exists(path))
			rawJson = File.getContent(path);
		#else
		if(Assets.exists(path))
			rawJson = Assets.getText(path);
		#end
		else
			return null;
		return cast Json.parse(rawJson);
	}
}

class Stage extends FlxTypedGroup<FlxBasic>
{
	public static var instance:Stage;

	public var gfVersion:String = 'gf';

	public var curStage:String;

	public var foreground:FlxTypedGroup<FlxBasic>;
	public var layers:FlxTypedGroup<FlxBasic>;

	public var spawnGirlfriend:Bool = true;

	public var stageScript:ScriptHandler;

    public static var objectMap:Map<String, korner.FNFSprite> = new Map<String, korner.FNFSprite>();

	public function new(curStage)
	{
		super();

		instance = this;
		this.curStage = curStage;

		foreground = new FlxTypedGroup<FlxBasic>();
		layers = new FlxTypedGroup<FlxBasic>();

		if (curStage == null || curStage.length < 1)
		{
			if (PlayState.SONG.stage == null || PlayState.SONG.stage.length < 1)
				curStage = 'unknown';
			else
				curStage = PlayState.SONG.stage;
		}

        reloadJson();

		try
		{
			callStageScript();
		}
		catch (e)
		{
			lime.app.Application.current.window.alert('$e in Stage Script', "Stage Error!");
		}
	}

	public function reloadJson()
	{
		var stageJson:StageFile = StageData.getStageFile(PlayState.curStage);
	
		if (stageJson != null)
		{
			if (stageJson.objects != null)
			{
				for (object in stageJson.objects)
				{
					var createdSprite:korner.FNFSprite = new korner.FNFSprite(object.position[0], object.position[1]);

					if (object.animations != null)
					{
						createdSprite.frames = Paths.getSparrowAtlas(object.image);
					    for (anim in object.animations)
							createdSprite.animation.addByPrefix(anim[0], anim[1], anim[2], anim[3]);
						if (object.defaultAnimation != null)
							createdSprite.playAnim(object.defaultAnimation);
					}
					else
						createdSprite.loadGraphic(Paths.image(object.image));

					if (object.scrollFactor != null)
						createdSprite.scrollFactor.set(object.scrollFactor[0], object.scrollFactor[1]);

					if (object.size != null)
						createdSprite.setGraphicSize(Std.int(createdSprite.width * object.size));

					if (object.scale != null)
					{
						createdSprite.scale.x = object.scale[0];
						createdSprite.scale.y = object.scale[1];
					}

					createdSprite.flipX = object.flipX;
					createdSprite.flipY = object.flipY;
					createdSprite.antialiasing = object.antialiasing;

					if (object.blend != null)
						createdSprite.blend = CoolUtil.returnBlendMode(object.blend);

					if (object.name != null && createdSprite != null)
						objectMap.set(object.name, createdSprite);

					switch (object.layer)
					{
						case 'layers' | 'on layers' | 'gf' | 'above gf':
							layers.add(createdSprite);
						case 'foreground' | 'on foreground' | 'chars' | 'above chars':
							foreground.add(createdSprite);
						default:
							PlayState.instance.add(createdSprite);
					}
				}
			}
		}
	}

	// get the dad's position
	public function dadPosition(curStage:String, boyfriend:Character, gf:Character, dad:Character):Void
	{
		var characterArray:Array<Character> = [dad, boyfriend];
	}

	public function repositionPlayers(curStage:String, boyfriend:Boyfriend, gf:Character, dad:Character)
	{
		callFunc('onRepositionPlayers', [boyfriend, gf, dad]);
	}

	public function createPost(curStage:String, boyfriend:Boyfriend, gf:Character, dad:Character)
	{
		callFunc('onCreatePost', [boyfriend, gf, dad]);
	}

	public function stageUpdate(curBeat:Int, boyfriend:Boyfriend, gf:Character, dad:Character)
	{
		callFunc('onBeatHit', [curBeat, boyfriend, gf, dad]);
	}

	public function stageUpdateSteps(curStep:Int, boyfriend:Boyfriend, gf:Character, dad:Character)
	{
		callFunc('onStepHit', [curStep, boyfriend, gf, dad]);
	}

	public function stageUpdateConstant(elapsed:Float, boyfriend:Boyfriend, gf:Character, dad:Character)
	{
		callFunc('onUpdate', [elapsed, boyfriend, gf, dad]);
	}

	function callStageScript()
	{
		var paths:Array<String> = [
			Paths.getPreloadPath('stages/$curStage.hx'),
			Paths.getPreloadPath('stages/$curStage.hxs'),
			Paths.getPreloadPath('stages/$curStage.hsc'),
			Paths.getPreloadPath('stages/$curStage.hscript')
		];

		for (path in paths)
		{
        	if (FileSystem.exists(path))
            	stageScript = new ScriptHandler(path);
		}

		setVar('add', add);
		setVar('kill', kill);
		setVar('remove', remove);
		setVar('destroy', destroy);
		setVar('foreground', foreground);
		setVar('layers', layers);
		setVar('gfVersion', gfVersion);

		setVar('spawnGirlfriend', function(blah:Bool)
		{
			spawnGirlfriend = blah;
		});

		setVar('BackgroundDancer', BackgroundDancer);
		setVar('BackgroundGirls', BackgroundGirls);
		setVar('TankmenBG', TankmenBG);

		setVar('getObject', function(object:String)
		{
			var gottenObject:korner.FNFSprite = objectMap.get(object);
			return gottenObject;
		});

		callFunc('onCreate', []);
	}

	public function callFunc(key:String, args:Array<Dynamic>)
	{
		if (stageScript == null)
            return null;
		else
			return stageScript.call(key, args);
	}

	public function setVar(key:String, value:Dynamic)
	{
        if (stageScript == null)
            return null;
		else
			return stageScript.set(key, value);
	}
}

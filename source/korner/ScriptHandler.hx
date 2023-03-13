package korner;

import flixel.*;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.effects.FlxTrail;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.*;
import flixel.system.*;
import flixel.system.FlxAssets.FlxShader;
import flixel.text.FlxText;
import flixel.tweens.*;
import flixel.ui.FlxBar;
import flixel.util.*;
import lime.app.Application;
import openfl.display.GraphicsShader;
import openfl.filters.ShaderFilter;
import korner.ScriptedSubstate;
import korner.FNFSprite;
import sys.io.File;

using StringTools;

class ScriptHandler extends SScript
{
	public function new(file:String, ?preset:Bool = true)
	{
		super(file, preset);
		traces = false;
	}

	override public function preset():Void
	{
		super.preset();

		set('Type', Type);
		set('Math', Math);
		set('Std', Std);
		set('Date', Date);

		set('FlxG', FlxG);
		set('FlxBasic', FlxBasic);
		set('FlxObject', FlxObject);
		set('FlxCamera', FlxCamera);
		set('FlxSprite', FlxSprite);
		set('FlxText', FlxText);
		set('FlxTextBorderStyle', FlxTextBorderStyle);
		set('FlxRuntimeShader', flixel.addons.display.FlxRuntimeShader);
		set('FlxSound', FlxSound);
		set('FlxTimer', FlxTimer);
		set('FlxTween', FlxTween);
		set('FlxEase', FlxEase);
		set('FlxMath', FlxMath);
		set('FlxSound', FlxSound);
		set('FlxGroup', FlxGroup);
		set('FlxColor', FlxColor);
		set('FlxTypedGroup', FlxTypedGroup);
		set('FlxSpriteGroup', FlxSpriteGroup);
		set('FlxTypedSpriteGroup', FlxTypedSpriteGroup);
		set('FlxStringUtil', FlxStringUtil);
		set('FlxAtlasFrames', FlxAtlasFrames);
		set('FlxSort', FlxSort);
		set('Application', Application);
		set('FlxGraphic', FlxGraphic);
		set('FlxAtlasFrames', FlxAtlasFrames);
		set('File', File);
		set('FlxTrail', FlxTrail);
		set('FlxShader', FlxShader);
		set('FlxBar', FlxBar);
		set('FlxBackdrop', FlxBackdrop);
		set('FlxBarFillDirection', FlxBarFillDirection);
		set('FlxAxes', FlxAxes);

		set('GraphicsShader', GraphicsShader);
		set('ShaderFilter', ShaderFilter);

		set('BGSprite', BGSprite);
		set('FNFSprite', FNFSprite);
		set('ClientPrefs', ClientPrefs);
		set('CutsceneHandler', CutsceneHandler);
		set('ScriptedSubstate', ScriptedSubstate);

		set('Alphabet', Alphabet);
		set('Character', Character);
		set('controls', Controls);
		set('CoolUtil', CoolUtil);
		set('Conductor', Conductor);
		set('PlayState', PlayState);
		set('Main', Main);
		set('Note', Note);
		set('Paths', Paths);
		set('StrumNote', StrumNote);
		set('HealthIcon', HealthIcon);
		set('StageData', StageData);
		set('Stage', StageData.Stage);

		set('game', PlayState.instance);

		#if windows
		set('platform', 'windows');
		#elseif linux
		set('platform', 'linux');
		#elseif mac
		set('platform', 'mac');
		#elseif android
		set('platform', 'android');
		#elseif html5
		set('platform', 'html5');
		#elseif flash
		set('platform', 'flash');
		#else
		set('platform', 'unknown');
		#end

		set('getColorFromRGB', function(r:Int, g:Int, b:Int)
		{
			return FlxColor.fromRGB(r, b, g);
		});
	}

	public static function callScripts(array:Array<ScriptHandler>)
	{
		var dirs:Array<Array<String>> = [
			CoolUtil.absoluteDirectory('scripts'),
			CoolUtil.absoluteDirectory('data/${CoolUtil.swapSpaceDash(PlayState.SONG.song.toLowerCase())}')
		];

		for (dir in dirs)
		{
			for (script in dir)
			{
				if (dir.length > 0)
				{
	    			if (script.length > 0 && script.endsWith('.hx') || script.endsWith('.hxs') || script.endsWith('.hsc') || script.endsWith('.hscript'))
					{
						array.push(new ScriptHandler(script));
					}
				}
			}
		}
	}
}
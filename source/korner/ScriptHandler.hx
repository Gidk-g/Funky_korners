package korner;

import flixel.*;
import flixel.addons.display.FlxRuntimeShader;
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
		trace('hx file loaded succesfully:' + file);
	}

	override public function preset():Void
	{
		super.preset();

		set("script", this);

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
		set('FlxRuntimeShader', FlxRuntimeShader);
		set('FlxSound', FlxSound);
		set('FlxTimer', FlxTimer);
		set('FlxTween', FlxTween);
		set('FlxEase', FlxEase);
		set('FlxMath', FlxMath);
		set('FlxSound', FlxSound);
		set('FlxGroup', FlxGroup);
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
		set('notes', PlayState.instance.notes);
		set('eventNotes', PlayState.instance.eventNotes);
		set('unspawnNotes', PlayState.instance.unspawnNotes);

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

		set('triggerEvent', function(name:String, arg1:Dynamic, arg2:Dynamic) {
			var value1:String = arg1;
			var value2:String = arg2;
			PlayState.instance.triggerEventNote(name, value1, value2);
			return true;
		});

		set("newShader", function(fragFile:String = null, vertFile:String = null) {
			var runtime:FlxRuntimeShader = null;
			try {
				runtime = new FlxRuntimeShader(
					fragFile == null ? null : Paths.shaderFragment(fragFile), 
					vertFile == null ? null : Paths.shaderVertex(vertFile)
				);
			} catch(e:Dynamic) {
				trace("Shader compilation error:" + e.message);
			}
			return runtime == null ? new FlxRuntimeShader() : runtime;
		});

		set("FlxColor", {
			toRGBArray: function(color:FlxColor) {
				return [color.red, color.green, color.blue];
			},
			lerp: function(from:FlxColor, to:FlxColor, ratio:Float) {
				return FlxColor.fromRGBFloat(
					FlxMath.lerp(from.redFloat, to.redFloat, ratio),
					FlxMath.lerp(from.greenFloat, to.greenFloat, ratio),
					FlxMath.lerp(from.blueFloat, to.blueFloat, ratio),
					FlxMath.lerp(from.alphaFloat, to.alphaFloat, ratio)
				);
			},
			setHue: function(color:FlxColor, hue) {
				color.hue = hue;
				return color;
			},
			fromCMYK: FlxColor.fromCMYK,
			fromHSL: FlxColor.fromHSL,
			fromHSB: FlxColor.fromHSB,
			fromInt: FlxColor.fromInt,
			fromRGBFloat: FlxColor.fromRGBFloat,
			fromString: FlxColor.fromString,
			fromRGB: FlxColor.fromRGB
		});
	}
}

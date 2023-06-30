package korner;

import flixel.*;
import flixel.input.keyboard.FlxKey;
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

		set("Int", Int);
		set("Std", Std);
		set('Date', Date);
		set("Bool", Bool);
		set("Math", Math);
		set('Type', Type);
		set("Float", Float);
		set("Array", Array);
		set("String", String);
		set("Dynamic", Dynamic);
		set("StringTools", StringTools);

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
		set('GraphicsShader', GraphicsShader);
		set('ShaderFilter', ShaderFilter);

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

		// this doesn't work :(
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

        set("FlxColor", ScriptClasses.get_FlxColor());
        set("FlxKey", ScriptClasses.get_FlxKey());
	}
}

class ScriptClasses
{
    public static function get_FlxColor() {
        return {
			// extra functions
			"toRGBArray": function(color:FlxColor) {return [color.red, color.green, color.blue];},
			"lerp": function(from:FlxColor, to:FlxColor, ratio:Float) {
				return FlxColor.fromRGBFloat(
					FlxMath.lerp(from.redFloat, to.redFloat, ratio),
					FlxMath.lerp(from.greenFloat, to.greenFloat, ratio),
					FlxMath.lerp(from.blueFloat, to.blueFloat, ratio),
					FlxMath.lerp(from.alphaFloat, to.alphaFloat, ratio)
				);
			},
			"setHue": function(color:FlxColor, hue:Float) {
				color.hue = hue;
				return color;
			},
			"setSaturation": function(color:FlxColor, saturation:Float) {
				color.saturation = saturation;
				return color;
			},
			"setBrightness": function(color:FlxColor, brightness:Float) {
				color.brightness = brightness;
				return color;
			},

			// colors
            "BLACK": FlxColor.BLACK,
            "BLUE": FlxColor.BLUE,
            "BROWN": FlxColor.BROWN,
            "CYAN": FlxColor.CYAN,
            "GRAY": FlxColor.GRAY,
            "GREEN": FlxColor.GREEN,
            "LIME": FlxColor.LIME,
            "MAGENTA": FlxColor.MAGENTA,
            "ORANGE": FlxColor.ORANGE,
            "PINK": FlxColor.PINK,
            "PURPLE": FlxColor.PURPLE,
            "RED": FlxColor.RED,
            "TRANSPARENT": FlxColor.TRANSPARENT,
            "WHITE": FlxColor.WHITE,
            "YELLOW": FlxColor.YELLOW,

            // functions
            "add": FlxColor.add,
            "fromCMYK": FlxColor.fromCMYK,
            "fromHSB": FlxColor.fromHSB,
            "fromHSL": FlxColor.fromHSL,
            "fromInt": FlxColor.fromInt,
            "fromRGB": FlxColor.fromRGB,
            "fromRGBFloat": FlxColor.fromRGBFloat,
            "fromString": FlxColor.fromString,
            "interpolate": FlxColor.interpolate,
            "to24Bit": function(color:Int) {return color & 0xffffff;},
        };
    }

    public static function get_FlxKey() {
        return {
            'ANY': -2,
            'NONE': -1,
            'A': 65,
            'B': 66,
            'C': 67,
            'D': 68,
            'E': 69,
            'F': 70,
            'G': 71,
            'H': 72,
            'I': 73,
            'J': 74,
            'K': 75,
            'L': 76,
            'M': 77,
            'N': 78,
            'O': 79,
            'P': 80,
            'Q': 81,
            'R': 82,
            'S': 83,
            'T': 84,
            'U': 85,
            'V': 86,
            'W': 87,
            'X': 88,
            'Y': 89,
            'Z': 90,
            'ZERO': 48,
            'ONE': 49,
            'TWO': 50,
            'THREE': 51,
            'FOUR': 52,
            'FIVE': 53,
            'SIX': 54,
            'SEVEN': 55,
            'EIGHT': 56,
            'NINE': 57,
            'PAGEUP': 33,
            'PAGEDOWN': 34,
            'HOME': 36,
            'END': 35,
            'INSERT': 45,
            'ESCAPE': 27,
            'MINUS': 189,
            'PLUS': 187,
            'DELETE': 46,
            'BACKSPACE': 8,
            'LBRACKET': 219,
            'RBRACKET': 221,
            'BACKSLASH': 220,
            'CAPSLOCK': 20,
            'SEMICOLON': 186,
            'QUOTE': 222,
            'ENTER': 13,
            'SHIFT': 16,
            'COMMA': 188,
            'PERIOD': 190,
            'SLASH': 191,
            'GRAVEACCENT': 192,
            'CONTROL': 17,
            'ALT': 18,
            'SPACE': 32,
            'UP': 38,
            'DOWN': 40,
            'LEFT': 37,
            'RIGHT': 39,
            'TAB': 9,
            'PRINTSCREEN': 301,
            'F1': 112,
            'F2': 113,
            'F3': 114,
            'F4': 115,
            'F5': 116,
            'F6': 117,
            'F7': 118,
            'F8': 119,
            'F9': 120,
            'F10': 121,
            'F11': 122,
            'F12': 123,
            'NUMPADZERO': 96,
            'NUMPADONE': 97,
            'NUMPADTWO': 98,
            'NUMPADTHREE': 99,
            'NUMPADFOUR': 100,
            'NUMPADFIVE': 101,
            'NUMPADSIX': 102,
            'NUMPADSEVEN': 103,
            'NUMPADEIGHT': 104,
            'NUMPADNINE': 105,
            'NUMPADMINUS': 109,
            'NUMPADPLUS': 107,
            'NUMPADPERIOD': 110,
            'NUMPADMULTIPLY': 106,

            'fromStringMap': FlxKey.fromStringMap,
            'toStringMap': FlxKey.toStringMap,
            'fromString': FlxKey.fromString,
            'toString': function (key:Int) {return FlxKey.toStringMap.get(key);},
        };
    }
}

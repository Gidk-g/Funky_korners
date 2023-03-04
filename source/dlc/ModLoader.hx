package dlc;

import flixel.FlxG;

#if polymod
import polymod.format.ParseRules;
#end

class ModLoader
{
    public static var mod_dirs:Array<String> = [];

	public static function reloadMods()
	{
		#if polymod
        polymod.PolymodConfig.modMetadataFile = "pack.json";
        polymod.PolymodConfig.modIconFile = "pack.png";

		mod_dirs = [];

		for(meta in polymod.Polymod.scan("dlc"))
		{
			mod_dirs.push(meta.id);
		}

        mod_dirs = [];

        var parse_rules:ParseRules = ParseRules.getDefault();
        parse_rules.addFormat("json", new CustomJSONParse());

		polymod.Polymod.init({
			modRoot: "dlc",
			dirs: mod_dirs,
			framework: OPENFL,
			errorCallback: function(error:polymod.Polymod.PolymodError)
			{
				#if debug
				trace(error.message);
				#end
			},
			frameworkParams: {
				assetLibraryPaths: [
					"songs" => "songs",
					"shared" => "shared"
				]
			}
		});
		#end
	}
}
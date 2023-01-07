package dlc;

import flixel.FlxG;
import dlc.CustomJSONParse;

#if polymod
import polymod.format.ParseRules;
#end

class DLCLoader
{
    public static var dlc_dirs:Array<String> = [];

	public static function reloadDLC()
	{
		#if polymod
        polymod.PolymodConfig.modMetadataFile = "pack.json";
        polymod.PolymodConfig.modIconFile = "pack.png";

		dlc_dirs = [];

		for(meta in polymod.Polymod.scan("dlc"))
		{
			dlc_dirs.push(meta.id);
		}

		if(FlxG.save.data.dlc)
			dlc_dirs = [];

        var parse_rules:ParseRules = ParseRules.getDefault();
        parse_rules.addFormat("json", new CustomJSONParse());

        polymod.Polymod.init({
			modRoot: "dlc",
			dirs: dlc_dirs,
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
			},
            parseRules: parse_rules
		});
		#end
	}
}
package korner;

import flixel.math.FlxMath;

using StringTools;

class DefaultSongData
{
	public static function getSongData(song:String, type:String)
	{
		var artistName:String = 'Modder(s)';
		var formattedName:String = 'Mod Song';

		switch (StringTools.replace(song, " ", "-").toLowerCase())
		{
			case 'copied' | 'cosplay' | 'lured':
				switch(StringTools.replace(song, " ", "-").toLowerCase())
				{
					case 'copied':
						artistName = 'Kolze';
						formattedName = 'Copied';
					case 'cosplay':
						artistName = 'Kolze';
						formattedName = 'Cosplay';
					case 'lured':
						artistName = 'Bonky';
						formattedName = 'Lured';
				}
			case 'cookie-beat' | 'copied-remix' | 'mistletoe':
				switch(StringTools.replace(song, " ", "-").toLowerCase())
				{
					case 'cookie-beat':
						artistName = 'Kolze';
						formattedName = 'Cookie Beat';
					case 'copied-remix':
						artistName = 'Fr4nk';
						formattedName = 'Copied Remix';
					case 'mistletoe':
						artistName = 'Fr4nk';
						formattedName = 'Mistletoe';
				}
			case 'copied-old' | 'lured-old':
				switch(StringTools.replace(song, " ", "-").toLowerCase())
				{
					case 'copied-old':
						artistName = 'Kolze';
						formattedName = 'Copied Old';
					case 'lured-old':
						artistName = 'Kolze';
						formattedName = 'Lured Old';
				}
			case 'new-guest' | 'ushanka' | 'double-trouble':
				switch(StringTools.replace(song, " ", "-").toLowerCase())
				{
					case 'new-guest':
						artistName = 'Fr4nk';
						formattedName = 'New Guest';
					case 'ushanka':
						artistName = 'Fr4nk';
						formattedName = 'Ushanka';
					case 'double-trouble':
						artistName = 'Kolze';
						formattedName = 'Double Trouble';
				}
			case 'martian-madness' | 'lovely-evening' | 'christmas':
				switch(StringTools.replace(song, " ", "-").toLowerCase())
				{
					case 'martian-madness':
						artistName = 'Kolze';
						formattedName = 'Martian Madness';
					case 'lovely-evening':
						artistName = 'Fr4nk';
						formattedName = 'Lovely Evening';
					case 'christmas':
						artistName = 'Kolze';
						formattedName = 'Christmas';
				}
			case 'copy-cat':
				switch(StringTools.replace(song, " ", "-").toLowerCase())
				{
					case 'copy-cat':
						artistName = 'Kolze';
						formattedName = 'Copy Cat';
				}
		}

		switch(type.toLowerCase())
		{
			case "artist":
				return artistName;
			case "name":
				return formattedName;
			default:
				return "uh... smthn didn't work ig";
		}

		return "";
	}
}
package korner;

import flixel.FlxG;

class ScriptedSubstate extends MusicBeatSubstate
{
    public static var stateName:Null<String>;
    public static var instance:ScriptedSubstate;

    override function create()
    {
        instance = this;

        PlayState.instance.callFunc('onSubstateCreate', []);
        PlayState.instance.setVar('close', close);

        super.create();
		PlayState.instance.callFunc('onSubstateCreatePost', []);
    }

    public function new(stateName:Null<String>)
    {
        ScriptedSubstate.stateName = stateName;
        PlayState.instance.callFunc('onNewSubstate', [stateName]);
        super();
        cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
    }

	override function update(elapsed:Float)
	{
		PlayState.instance.callFunc('onSubstateUpdate', [stateName, elapsed]);
		super.update(elapsed);
		PlayState.instance.callFunc('onSubstateUpdatePost', [stateName, elapsed]);
	}

	override function destroy()
	{
		PlayState.instance.callFunc('onSubstateDestroy', [stateName]);
		super.destroy();
	}
}
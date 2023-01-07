function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('post-dialogue');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreatePost()
    

	makeLuaSprite('bgThing', 'songBG', -500, 250)
    scaleObject('bgThing', 0.35, 0.43)
	setObjectCamera('bgThing', 'other')
    setScrollFactor('bgThing', 0, 0)


	makeLuaSprite('Icon', 'icon-woj', -110, 230)
    scaleObject('Icon', 0.60, 0.60)
	setObjectCamera('Icon', 'other')
    setProperty('Icon.angle', 10)
    setScrollFactor('Icon', 0, 0)



    makeLuaText('songText', "Fr4nk - Ushanka", 400, getProperty('bgThing.x') + 180, 320)
    setObjectCamera("songText", 'other');
    setTextColor('songText', '0xffffff')
    setTextSize('songText', 30);
    setTextFont('songText', "vcr.ttf")
    setTextAlignment('songText', 'left')


    makeLuaText('beforeSongText', "Now Playing... ", 300, getProperty('bgThing.x') + 30 - 40, 290)
    setObjectCamera("beforeSongText", 'other');
    setTextColor('beforeSongText', '0xffffff')
    setTextSize('beforeSongText', 25);
    setTextFont('beforeSongText', "vcr.ttf")
    setTextAlignment('beforeSongText', 'left')


    setObjectOrder('beforeSongText', 3)
    setObjectOrder('songText', 3)
    setObjectOrder('bgThing', 2)


    addLuaSprite('bgThing', true)
    addLuaSprite('Icon', true)
    addLuaText("songText", true);
    addLuaText("beforeSongText", true);
end

function onSongStart()
    doTweenX('bgThingMoveIn', 'bgThing', -50, 0.6, 'linear')
    doTweenX('bgThingText', 'songText', 70, 0.6, 'linear')  
    doTweenX('bgThingTextBleb', 'beforeSongText', 20, 0.6, 'linear') 
    doTweenX('bgThingTextBlebe', 'Icon', 360, 0.6, 'linear') 
    runTimer('moveOut', 3.7, 1)
end


function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveOut' then
        doTweenX('bgThingLeave', 'bgThing', -700, 0.6, 'linear')
        doTweenX('bgThingLeaveText', 'songText', -500, 0.6, 'linear')  -- might need to mess with these for longer names
        doTweenX('bgThingLeavePreText', 'beforeSongText', -400, 0.6, 'linear') -- might need to mess with these for longer names
        doTweenX('bgThingLeavePreIcon', 'Icon', -400, 0.6, 'linear') -- might need to mess with these for longer names
    end
end

function onTweenCompleted(tag)
    if tag == 'bgThingLeave' then
        removeLuaSprite('bgThing', true)
        removeLuaText('songText', true)
        removeLuaText('beforeSongText', true)
        removeLuaText('Icon', true)
    end
end
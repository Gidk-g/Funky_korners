function onEvent(name,value1)
    if name == "bye osu moment" then
        makeLuaSprite('black transparent', 'black transparent', -1900, -99999900);
		setLuaSpriteScrollFactor('black transparent', 0, 0);
	    scaleObject('black transparent', 4, 4)
		
		addLuaSprite('black transparent', false);

	end
end

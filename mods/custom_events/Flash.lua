local flashCounter = 0
local flashColor = ''
function onEvent(name,v1,v2)
	if name == 'Flash' then
		makeLuaSprite('flashEvent'..flashCounter, '', 0, 0);
		setObjectCamera('flashEvent'..flashCounter,'hud')
		if v1 ~= '' then
			doTweenAlpha('byeFlashE'..flashCounter,'flashEvent'..flashCounter,0,v1,'linear')
		else
			doTweenAlpha('byeFlashE'..flashCounter,'flashEvent'..flashCounter,0,1,'linear')
		end
		if v2 ~= '' then
			flashColor = v2
		else
			flashColor = 'FFFFFF'
		end
		makeGraphic('flashEvent'..flashCounter,screenWidth,screenHeight,flashColor)
		if string.find(string.lower(v2),'ahead:true',0,true) ~= nil then
			addLuaSprite('flashEvent'..flashCounter, true);
		else
			addLuaSprite('flashEvent'..flashCounter, false);
		end
		flashCounter = flashCounter + 1
	end
end
function onTweenCompleted(name)
	for flashLength = 0,flashCounter do
		if name == 'byeFlashE'..flashLength then
			removeLuaSprite('flashEvent'..flashLength,true)
		end
	end
end
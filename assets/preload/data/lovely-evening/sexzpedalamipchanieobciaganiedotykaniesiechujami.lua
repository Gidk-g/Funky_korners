-- Flipped healt bar Script by (HenrySMD): https://www.youtube.com/watch?v=bnI4ObVYQWE
function onUpdate(elapsed)
	setProperty('healthBar.flipX', true)

	setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

	setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
	setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
	setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
	setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
	setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4)
end

local stickThere = false
function onUpdatePost()
	setProperty('iconP1.flipX', true)
	setProperty('iconP2.flipX', true)

	if getProperty('health') < 2 then
		stickThere = false
		if stickThere == false then
			setProperty('iconP1.x', 216+getProperty('health')*296)
			setProperty('iconP2.x', 317+getProperty('health')*297) 
		end
	end

	if getProperty('health') == 2 or getProperty('health') > 2 then
		stickThere = true
		if stickThere == true then
			setProperty('iconP1.x', 216+2*296)
			setProperty('iconP2.x', 317+2*297) 
		end
	end
end
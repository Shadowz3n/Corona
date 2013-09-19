-- Create Image Object
function createImageObject(event, x, y, speed)
	event							= display.newImage(event);
	event.x, event.y, event.speed	= x, y, speed;
	return event;
end

-- Create a Sprite Images
function createSpriteImages(event, width, height, spritesNum, delay, x, y)
	loadEventSpriteSheet 			= sprite.newSpriteSheet(event, width, height);
	loadingSprites 					= sprite.newSpriteSet(loadEventSpriteSheet, 1, spritesNum);
	sprite.add(loadingSprites, event, 1, spritesNum, delay, 0);
	event = sprite.newSprite(loadingSprites);
	event.x, event.y = x, y;
	event:prepare(event);
	event:play();
	return event;
end

-- Create a Rect
function createRect(event, x, y, width, height, strokeWidth)
	event = display.newRect(0, 0, width, height);
	event.strokeWidth 				= strokeWidth;
	event.x, event.y				= x, y;
	return event;
end

-- Create Text Object
function createTextObject(event, x, y, font, size)
	event							= display.newText(event, 0, 0, font, size);
	event.x, event.y				= x, y;
	return event;
end

-- Show all from Scene
function showAssets(event, times)
	for key, value in pairs(event) do
		transition.to(event[key], {time=times, alpha=1});
	end
end

-- Delete all from Scene
function deleteAssets(event, times)
	for key, value in pairs(event) do
		transition.to(event[key], {time=times, alpha=0, onComplete = function() event[key]:removeSelf(); end});
	end
end

-- Transparent all
function transparentAssets(event)
	for key, value in pairs(event) do
		assetsGame[key].alpha = 0;
	end
end

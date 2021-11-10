package gameFolder.gameObjects.userInterface.menu;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MenuCharacter extends FlxSprite
{
	public var character:String = '';

	var curCharacterMap:Map<String, Array<Dynamic>> = [
		// the format is currently
		// name of character => id in atlas, fps, loop, scale, offsetx, offsety
		'bf' => ["bf", 1, false, 1, 0, 0],
		'bfConfirm' => ['bfConfirm', 24, false, 0.9, 100, 100],
	];

	var baseX:Float = 0;
	var baseY:Float = 0;

	public function new(x:Float, newCharacter:String = 'bf')
	{
		super(x);
		y += -230;
		
		super(y);
		x += 0;

		baseX = x;
		baseY = y;

		createCharacter(newCharacter);
		updateHitbox();
	}

	public function createCharacter(newCharacter:String, canChange:Bool = false)
	{
		var tex = Paths.getSparrowAtlas('menus/base/storymenu/campaign_menu_UI_characters');
		frames = tex;
		var assortedValues = curCharacterMap.get(newCharacter);
		if (assortedValues != null)
		{
			if (!visible)
				visible = true;

			// animation
			animation.addByPrefix(newCharacter, assortedValues[0], assortedValues[1], assortedValues[2]);
			// if (character != newCharacter)
			animation.play(newCharacter);

			if (canChange)
			{
				// offset
				setGraphicSize(Std.int(width * assortedValues[3]));
				updateHitbox();
				setPosition(baseX + assortedValues[4], baseY + assortedValues[5]);

				if (newCharacter == 'pico')
					flipX = true;
				else
					flipX = false;
			}
		}
		else
			visible = false;

		character = newCharacter;
	}
}

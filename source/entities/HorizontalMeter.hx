package entities;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Rodrigo Peralta
 */

class HorizontalMeter extends FlxSprite
{
	
	private var velX(get, null):Float;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 10, FlxColor.GREEN);
		velX = 0;

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		trace(velocity.x);
		

	}

	private function movement():Void
	{
		if (FlxG.keys.pressed.RIGHT)
		{

			if (acceleration.x<50)
			{

				acceleration.x += 10;
				if (velocity.x>-20&&velocity.x<20)
				{
					acceleration.x += 30;
				}

				if (velocity.x > 100)
				{
					acceleration.x +=20;
				}
			}
		}
		if (FlxG.keys.pressed.LEFT)
		{
			if (acceleration.x>-50)
			{

				acceleration.x -= 10;

				if (velocity.x>-20&&velocity.x>-20)
				{
					acceleration.x -= 30;
				}

				if (velocity.x < -100)
				{
					acceleration.x -= 20;
				}
			}

		}

	}
	
	public function get_velX():Float 
	{
		return velX;
	}
}
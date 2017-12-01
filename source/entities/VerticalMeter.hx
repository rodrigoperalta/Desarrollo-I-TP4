package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Rodrigo Peralta
 */
class VerticalMeter extends Meters
{

	private var velY(get, null):Float;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.MedidorLateral__png, false, 56, 17, false);
		scrollFactor.y = 0;
		scrollFactor.x = 0;

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();

	}

	private function movement():Void
	{
		if (this.y > FlxG.height-this.height)
		{
			velocity.y = 0;
		}
		if (this.y < 0)
		{
			velocity.y = 0;
		}

		if (FlxG.keys.pressed.DOWN)
		{

			if (acceleration.y<50)
			{

				acceleration.y += 10;
				if (velocity.y>-20&&velocity.y<20)
				{
					acceleration.y += 30;
				}

				if (velocity.y > 100)
				{
					acceleration.y +=20;
				}
			}
		}
		if (FlxG.keys.pressed.UP)
		{
			if (acceleration.y>-50)
			{

				acceleration.y -= 10;

				if (velocity.y>-20&&velocity.x>-20)
				{
					acceleration.y -= 20;
				}

				if (velocity.y < -100)
				{
					acceleration.y -= 20;
				}
			}

		}

	}

	public function get_velY():Float
	{
		return velY;
	}

}
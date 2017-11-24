package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Rodrigo Peralta
 */


class Player extends FlxSprite
{

	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(10, 10, FlxColor.RED);

	}

	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);
	

	}

		
	public function setMovX(gL:Bool):Void
	{
		if (gL == true) 
		{
			velocity.x = -40;
		}
		if (gL == false) 
		{
			velocity.x = 40;
		}
	}
	
	public function setMovY(gU:Bool):Void
	{
		if (gU == true) 
		{
			velocity.y = -40;
		}
		if (gU == false) 
		{
			velocity.y = 40;
		}
	}

}
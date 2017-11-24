package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;


/**
 * ...
 * @author ...
 */
class HorizontalGuide extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(FlxG.width, 50, FlxColor.BLUE);
		scrollFactor.y = 0;
		scrollFactor.x = 0;
	}
	
}
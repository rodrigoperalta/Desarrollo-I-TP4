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
		loadGraphic(AssetPaths.BarraSuperior__png, false, 56, 640, false);
		scrollFactor.y = 0;
		scrollFactor.x = 0;
	}
	
}
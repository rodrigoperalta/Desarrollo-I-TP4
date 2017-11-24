package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Meters extends FlxSprite 
{
	private var playerPosX:Float;
	private var playerPosY:Float;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		playerPosX = 0;
		playerPosY = 0;
	}
	
	public function setPlayerPos(ppX:Float,ppY:Float):Void
	{
		playerPosX =  ppX;
		playerPosY = ppY;
	}
	
	
	
}
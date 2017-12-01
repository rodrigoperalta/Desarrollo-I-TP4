package entities;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Mesa extends Obstaculos 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	loadGraphic(AssetPaths.mesa__png, true, 32, 32);
		animation.add("idle", [0], 1, false);
		animation.play("idle");
		scale.set(2, 2);
		width = 64;
		height = 38;
		offset.set(-16, -4);
		
	}
	
}
package entities;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Sillon extends Obstaculos 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.sillon__png, true, 32, 32);
		animation.add("idle", [0], 1, false);
		animation.play("idle");
		scale.set(2, 2);
		width = 60;
		height = 52;
		offset.set(-14, -10);
		
		
	}
	
}
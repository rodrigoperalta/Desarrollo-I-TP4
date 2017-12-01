package entities;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Zapatillas extends Obstaculos 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.zapatillas__png, true, 32, 32);
		animation.add("idle", [0], 1, false);
		animation.play("idle");
		updateHitbox();
		width = 24;
		height = 24;
		offset.set(1, 4);
	}
	
}
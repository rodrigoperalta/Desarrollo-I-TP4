package entities;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.addons.effects.FlxTrail;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;


/**
 * ...
 * @author ...
 */
class Perro extends Obstaculos
{

	private var trail:FlxTrail;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.perro__png, true, 32, 32);
		animation.add("idle", [0], 1, false);
		animation.play("idle");
		scale.set(2, 2);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		facing = FlxObject.RIGHT;
		trail = new FlxTrail(this);
		FlxG.state.add(trail);
		FlxTween.tween(this, { x: x + 500 }, 8, { type: FlxTween.PINGPONG, ease: FlxEase.quadInOut, onComplete: changeColor});
		width = 54;
		height = 14;
		offset.set(-6, 10);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		flip();

	}

	private function changeColor(tween:FlxTween):Void
	{
		facing = FlxObject.LEFT;

	}

	private function flip():Void
	{
		var aux:Float;
		aux = this.x;

		if (this.x>aux)
		{

			facing = FlxObject.RIGHT;
		}
		if (this.x<aux)
		{
			facing = FlxObject.LEFT;
		}

	}

}
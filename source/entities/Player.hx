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

enum States
{
	DERECHO;
	IZQ;
	DER;
	ADELANTE;
	ATRAS;
	MUERTO;

}

class Player extends FlxSprite
{

	private var currentState(get, null):States;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);

		loadGraphic(AssetPaths.tipito__png, true, 32, 32);
		animation.add("Derecho", [0, 0], 0, false);
		animation.add("IZQ", [2], 1, false);
		animation.add("DER", [1], 1, false);
		animation.add("ADELANTE", [3], 1, false);
		animation.add("ATRAS", [4], 1, false);
		animation.add("MUERTO", [5], 1, false);
		animation.play("Derecho");
		scale.set(2, 2);
		width = 40;
		height = 18;
		offset.set(-3, 5);

		currentState = States.DERECHO;

	}

	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);

		switch (currentState)
		{
			case States.IZQ:
				animation.play("IZQ");
				width = 50;
				height = 18;
				offset.set(-8, 5);

			case States.DER:
				animation.play("DER");
				width = 50;
				height = 18;
				offset.set(-6, 5);

			case States.ADELANTE:
				animation.play("ADELANTE");
				width = 40;
				height = 16;
				offset.set(-3, 4);

			case States.ATRAS:
				animation.play("ATRAS");
				width = 40;
				height = 18;
				offset.set(-3, 11);

			case States.MUERTO:
				animation.play("MUERTO");
				velocity.x = 0;
				velocity.y = 0;

			case States.DERECHO:

		}
	}

	public function setMovX(gL:Bool):Void
	{
		if (gL == true)
		{
			currentState = States.IZQ;
			velocity.x = -40;
		}
		if (gL == false)
		{
			currentState = States.DER;
			velocity.x = 40;
		}
	}

	public function setMovY(gU:Bool):Void
	{
		if (gU == true)
		{
			currentState = States.ADELANTE;
			velocity.y = -40;
		}
		if (gU == false)
		{
			currentState = States.ATRAS;
			velocity.y = 40;
		}
	}

	public function die():Void
	{
		currentState = States.MUERTO;
	}
	
	public function get_currentState():States 
	{
		return currentState;
	}

}
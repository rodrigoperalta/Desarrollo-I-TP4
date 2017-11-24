package entities;
import entities.Player.States;
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
	IDLE;
	MOVE;


}
class Player extends FlxSprite
{

	private var currentState(get, null):States;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		currentState = States.IDLE;
		makeGraphic(10, 10, FlxColor.RED);

	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);
		movement();

	}

	private function stateMachine():Void
	{

		switch (currentState)
		{
			case States.IDLE:

			case States.MOVE:

		}
	}

	private function movement():Void
	{
		
	}

	public function get_currentState():States
	{
		return currentState;
	}
	
	public function getVel(velX:Float, velY:Float)
	{
		
		this.velocity.x = velX;
		this.velocity.y = velY;
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
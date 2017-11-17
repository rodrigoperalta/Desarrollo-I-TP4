package entities;

import entities.Player.States;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

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

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		currentState = States.IDLE;
		
	}
	
	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);
	
	}
	
	private function stateMachine():Void
	{

		switch (currentState)
		{
			case States.IDLE:
				

			case States.RUN:
				

			

			

		}
	}
	
}
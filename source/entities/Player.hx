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
	private var _max:FlxPoint;
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
		
		
	
	}
	
	private function stateMachine():Void
	{

		switch (currentState)
		{
			case States.IDLE:
				
			

			case States.MOVE:
						

			

		}
	}
	
		
	public function get_currentState():States 
	{
		return currentState;
	}
	
	
	
}
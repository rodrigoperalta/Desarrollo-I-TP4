package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class MenuState extends FlxState
{

	private var texto:FlxText;
	

	override public function create()
	{
		FlxG.mouse.visible = true;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		texto = new FlxText(80, 10, 0, "Intenta Llegar a la cama sin caerte y quedarte dormido", 15);
		
		var botonNuevoJuego = new FlxButton(x, 120, "Jugar!", nuevo);
		var botonNuevoJuego2 = new FlxButton(x, 160, "Jugar!!!!", nuevo);
		var botonNuevoJuego3 = new FlxButton(x, 200, "¡¡¡¡Jugar!!!!", nuevo);
		add(botonNuevoJuego);
		add(texto);
		add(botonNuevoJuego2);
		add(botonNuevoJuego3);
		

	}

	private function nuevo()
	{
		FlxG.switchState(new PlayState());
	}

}
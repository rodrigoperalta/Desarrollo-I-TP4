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
	private var texto2:FlxText;
	private var texto3:FlxText;
	
	

	override public function create()
	{
		FlxG.mouse.visible = true;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		texto = new FlxText(80, 10, 0, "Intenta Llegar a la cama sin caerte y quedarte dormido", 15);
		texto2 = new FlxText(80, 40, 0, "Usa A y D para moverte lateralmente y ", 10);
		texto3 = new FlxText(80, 70, 0, "las flechas para moverte hacia adelante y atras", 10);
		
 
		
		var botonNuevoJuego = new FlxButton(x, 120, "Jugar!", nuevo);
		var botonNuevoJuego2 = new FlxButton(x, 160, "Jugar!!!!", nuevo);
		var botonNuevoJuego3 = new FlxButton(x, 200, "¡¡¡¡Jugar!!!!", nuevo);
		add(botonNuevoJuego);
		add(texto);
		add(texto2);
		add(texto3);
		add(botonNuevoJuego2);
		add(botonNuevoJuego3);
		

	}

	private function nuevo()
	{
		FlxG.switchState(new PlayState());
	}

}
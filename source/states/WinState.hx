package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class WinState extends FlxState
{
	private var texto:FlxText;
	private var texto2:FlxText;
	private var s:Int;

	override public function create()
	{
		FlxG.mouse.visible = true;
		s = Std.int(Reg.score);
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		texto = new FlxText(220, 10, 0, "GANASTESSSSSSS", 20);
		texto2= new FlxText(240, 60, 0, "Tu puntaje es: "+s, 15);
		var botonNuevoJuego = new FlxButton(x, 120, "Jugar!", nuevo);
		var botonNuevoJuego2 = new FlxButton(x, 160, "Jugar!!!!", nuevo);
		var botonNuevoJuego3 = new FlxButton(x, 200, "¡¡¡¡Jugar!!!!", nuevo);
		FlxG.sound.pause();
		add(texto);
		add(texto2);
		add(botonNuevoJuego);
		add(botonNuevoJuego2);
		add(botonNuevoJuego3);

	}

	private function nuevo()
	{
		FlxG.switchState(new PlayState());
	}

}
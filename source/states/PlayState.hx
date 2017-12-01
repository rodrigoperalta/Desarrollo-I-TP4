package states;

import entities.HorizontalMeter;
import entities.Maceta;
import entities.Mesa;
import entities.Obstaculos;
import entities.Perro;
import entities.Player;
import entities.Sillon;
import entities.VerticalMeter;
import entities.Zapatillas;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import entities.Guide;
import entities.HorizontalGuide;
import entities.VerticalGuide;

class PlayState extends FlxState
{
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var player:Player;
	private var maceta:Maceta;
	private var mesa:Mesa;
	private var perro:Perro;
	private var sillon:Sillon;
	private var zapatillas:Zapatillas;
	private var hG:HorizontalGuide;
	private var vG:VerticalGuide;
	private var hM:HorizontalMeter;
	private var vM:VerticalMeter;
	private var guide:Guide;
	private var obstaculos:FlxTypedGroup<Obstaculos>;
	
	
	private var score:FlxText;
	private var end:FlxText;

	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		loader = new FlxOgmoLoader(AssetPaths.TP4__oel);
		tileMap = loader.loadTilemap(AssetPaths.Piso2__png, 32, 32, "Tiles");
		add(tileMap);
		obstaculos = new FlxTypedGroup<Obstaculos>();
		end = new FlxText(0, 0, 0, "El Sprite es muy bueno como para ir a otra pantalla de una, toca R", 8, true);
		loader.loadEntities(entityCreator, "Entities");
		hM = new HorizontalMeter(FlxG.width/2-8,0);
		vM = new VerticalMeter(FlxG.width - 56, FlxG.height / 2-8);
		hG = new HorizontalGuide(0,0);
		vG = new VerticalGuide(FlxG.width - 56, 0);		
		guide = new Guide(player.x, FlxG.height/2);
		score = new FlxText(80, 80, 0, "Score: " + Reg.score, 20, true);
		FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		FlxG.camera.setScrollBounds(0, tileMap.width, 0, tileMap.height);
		FlxG.camera.follow(guide);
		score.scrollFactor.y = 0;
		score.scrollFactor.x = 0;
		add(guide);
		add(obstaculos);
		add(hG);
		add(vG);
		add(hM);
		add(vM);
		add(score);

		tileMap.setTileProperties(0, FlxObject.NONE);
		tileMap.setTileProperties(1, FlxObject.NONE);
		tileMap.setTileProperties(2, FlxObject.NONE);
		tileMap.setTileProperties(3, FlxObject.ANY);
		tileMap.setTileProperties(4, FlxObject.ANY);

	}

	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		goToWin();
		guide.getPlayerPos(player.x, player.y);
		if (player.get_currentState()!=States.MUERTO)
		{
			setPlayerMov(hM, vM);
		}
		FlxG.collide(player, obstaculos, colPlayerObstaculos);
		FlxG.collide(player, tileMap);
		death();
		getScore(elapsed);

	}

	

	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		switch (entityName)
		{
			case "Player":
				player = new Player();

				player.x = x;
				player.y = y;
				add(player);

			case "Mesa":
				var mesa = new Mesa();
				mesa.x = x;
				mesa.y = y;
				obstaculos.add(mesa);

			case "Sillon":
				var sillon = new Sillon(x,y);
				obstaculos.add(sillon);

			case "Zapatillas":
				var zapatillas = new Zapatillas(x,y);
				obstaculos.add(zapatillas);

			case "Perro":
				var perro = new Perro(x,y);
				obstaculos.add(perro);

			case "Maceta":
				var maceta = new Maceta(x,y);
				obstaculos.add(maceta);

		}
	}

	private function setPlayerMov(hM:HorizontalMeter,vM:VerticalMeter):Void
	{
		/*if (hM.x<FlxG.width/2-8)
		{
			player.setMovX(true);
		}
		if (hM.x>FlxG.width/2-8)
		{
			player.setMovX(false);
		}*/

		if (hM.velocity.x<0)
		{
			player.setMovX(true);
		}
		if (hM.velocity.x>0)
		{
			player.setMovX(false);
		}

		if (vM.y<FlxG.height/2-8)
		{
			player.setMovY(true);
		}
		if (vM.y>FlxG.height/2-8)
		{
			player.setMovY(false);
		}

	}

	private function colPlayerObstaculos(p:Player, o:Obstaculos):Void
	{
		FlxG.camera.shake(0.01, 1);
		obstaculos.remove(o, true);
		player.die();
	}

	private function death():Void
	{
		if (hM.x>=FlxG.width-hM.width || hM.x<=hM.width)
		{
			player.die();
			FlxG.camera.shake(0.01, 1);
			hM.x = FlxG.width / 2 - 8;
			hM.velocity.x = 0;
			hM.acceleration.x = 0;
			vM.y = FlxG.height / 2 - 8;
			vM.acceleration.y = 0;
			vM.velocity.y = 0;
			end.x = player.x-100;
			end.y = player.y - 50;
			add(end);

		}

		if (vM.y>=FlxG.height-vM.height || vM.y<=0+vM.height)
		{
			player.die();
			FlxG.camera.shake(0.01, 1);
			vM.y = FlxG.height / 2 - 8;
			vM.acceleration.y = 0;
			vM.velocity.y = 0;
			hM.x = FlxG.width / 2 - 8;
			hM.velocity.x = 0;
			hM.acceleration.x = 0;
			end.x = player.x-100;
			end.y = player.y - 50;
			add(end);

		}

	}

	private function getScore(elapsed:Float):Void
	{
		if (player.velocity.y < 0)
		{
			var s:Int;
			Reg.score += 0.1 ;
			s = Std.int(Reg.score);
			score.text = "Score " + s;
		}
	}

	private function goToWin():Void
	{
		if (player.get_currentState()==States.MUERTO && FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new WinState());
		}
	}

}
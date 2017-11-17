package states;

import entities.HorizontalMeter;
import entities.Player;
import entities.VerticalMeter;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
//import entities.Guide;



class PlayState extends FlxState
{
	private var loader:FlxOgmoLoader;
	//private var tileMap:FlxTilemap;
	private var player:Player;
	private var hM:HorizontalMeter;
	private var vM:VerticalMeter;
	//private var guide:Guide;
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		loader = new FlxOgmoLoader(AssetPaths.TP4__oel);
		hM = new HorizontalMeter(50, 50);
		vM = new VerticalMeter(100, 70);
		//guide = new Guide(player.x, FlxG.height/2);
		//tileMap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "Tilesets");
		
		//FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		loader.loadEntities(entityCreator, "Entities");
		//FlxG.camera.follow(player);
		
		//add(tileMap);
		//add(guide);
		add(hM);
		add(vM);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//guide.getPlayerPos(player.x, player.y);
	
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
		}
	}
}
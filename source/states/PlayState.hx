package states;

import entities.Player;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	private var loader:FlxOgmoLoader;
	//private var tileMap:FlxTilemap;
	private var player:Player;
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		loader = new FlxOgmoLoader(AssetPaths.TP4__oel);
		//tileMap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "Tilesets");
		
		
		//FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		loader.loadEntities(entityCreator, "Entities");
		
		//add(tileMap);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
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
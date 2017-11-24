package states;

import entities.HorizontalMeter;
import entities.Player;
import entities.VerticalMeter;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import entities.Guide;



class PlayState extends FlxState
{
	private var loader:FlxOgmoLoader;
	//private var tileMap:FlxTilemap;
	private var player:Player;
	private var ref1:Player;
	private var ref2:Player;
	private var hM:HorizontalMeter;
	private var vM:VerticalMeter;
	//private var guide:Guide;
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		loader = new FlxOgmoLoader(AssetPaths.TP4__oel);
		loader.loadEntities(entityCreator, "Entities");
		ref1 = new Player(player.x + 10, player.y - 10);
		ref2 = new Player(player.x - 10, player.y + 10);
		hM = new HorizontalMeter(FlxG.width/2,0);
		vM = new VerticalMeter(FlxG.width-50, FlxG.height/2);
		//guide = new Guide(player.x, FlxG.height/2);
		//tileMap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "Tilesets");
		
		//FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		
		FlxG.camera.follow(player);
		
		//add(tileMap);
		//add(guide);
		add(hM);
		add(vM);
		add(ref1);
		add(ref2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//player.getVel(hM.velocity.x, vM.velocity.y);
		//guide.getPlayerPos(player.x, player.y);
		setPlayerMov(hM, vM);
	
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
	
	private function setPlayerMov(hM:HorizontalMeter,vM:VerticalMeter):Void
	{
		if (hM.x<FlxG.width/2) 
		{
			player.setMovX(true);
		}
		if (hM.x>FlxG.width/2) 
		{
			player.setMovX(false);
		}
		if (vM.y<FlxG.height/2) 
		{
			player.setMovY(true);
		}
		if (vM.y>FlxG.height/2) 
		{
			player.setMovY(false);
		}
	}
	
}
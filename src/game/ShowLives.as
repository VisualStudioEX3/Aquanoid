package game 
{
	import org.flixel.*;
	
	public class ShowLives extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/lives.png")] private var live_img:Class;
		private var lives:Array;
		
		public function ShowLives() 
		{
			lives = new Array(new FlxSprite(), new FlxSprite(), new FlxSprite(),
							  new FlxSprite(), new FlxSprite(), new FlxSprite(),
							  new FlxSprite(), new FlxSprite())
							  
			
			var x:uint = 0;
			var y:uint = 0;
			var live:FlxSprite;
			for each (live in lives)
			{
				live.loadGraphic(live_img, false, false, 41, 16);
				live.setOriginToCorner();
				live.x = 16 + ((45 * x));
				live.y = 0;
				x++;
				add(live);
			}			
		}	
		
		override public function update():void 
		{
			var i:uint;
			var live:FlxSprite;
			for (i = 0; i < 8; i++)
			{
				live = lives[i];
				live.visible = i <= Global.Lives - 2;
			}			
			
			super.update();
		}
	}
}
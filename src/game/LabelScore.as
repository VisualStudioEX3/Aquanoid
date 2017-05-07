package game 
{
	import org.flixel.*;
	
	public class LabelScore extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/UI/numbers_font.png")] private var digits_img:Class;
		private var labelString:Array;
		
		public function LabelScore() 
		{
			labelString = new Array(new FlxSprite(),
									new FlxSprite(),
									new FlxSprite(),
									new FlxSprite(),
									new FlxSprite(),
									new FlxSprite())
			
			var i:uint;
			var char:FlxSprite;
			for each (char in labelString)
			{				
				i++;
				char.loadGraphic(digits_img, true, false, 23, 24);
				char.setOriginToCorner();
				char.x = 410 + 66 + (23 * i);
				char.y = 40;
				char.frameWidth = 23;
				char.frameHeight = 24;
				char.frames = 10;
				char.frame = 0;
				add(char);
			}
		}
		
		override public function update():void 
		{
			var i:uint;
			var scoreString:String = String(Global.Score);
			
			var x:uint;
			var y:uint = scoreString.length - 1;
			var c:FlxSprite;
			for (x = labelString.length - 1; x > 0; x--)
			{
				c = labelString[x];
				if (y >= 0)
					c.frame = uint(scoreString.charAt(y));
				else
					c.frame = 0;
				y--;
			}
			
			super.update();
		}
	}
}
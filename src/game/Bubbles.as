package game 
{
	import flash.desktop.ClipboardFormats;
	import org.flixel.*;
	
	public class Bubbles extends FlxSprite
	{
		[Embed (source = "../../content/graphics/game/bubble.png")] private var bubble_img:Class;
		
		public function Bubbles(x:uint, y:uint) 
		{
			super(x, y, bubble_img);			
			
			var des:uint = Global.GetRealRandom();
			if (des % 2 == 0)
				this.x += 4;
			else 
				this.x -= 3;
				
			var value:uint = Global.GetRealRandom();
			var scale:Number;
			if (value >= 0 && value < 3) 
				scale = 0.25;
			else if (value >= 3 && value < 6) 
				scale = 0.4;
			else if (value >= 6 && value <= 9) 
				scale = 0.35;
			
			this.scale.x = scale;
			this.scale.y = scale;
			
			this.alpha = 0.5;
			this.velocity.y = -32;
		}
		
		override public function update():void 
		{
			if (this.y < Global.water.y - 8) this.kill();
			super.update();
		}
	}

}
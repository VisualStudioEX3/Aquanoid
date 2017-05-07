package ui 
{
	import org.flixel.*;
	
	public class Title extends FlxSprite
	{
		[Embed (source = "../../content/graphics/label_title.png")] private var title_img:Class;
		
		private var timer:FlxTimer;
		
		public function Title() 
		{
			super(16, 64, title_img);
			antialiasing = true;
			angle = 5;
			
			timer = new FlxTimer();
			timer.start(0.1, 0, onTimer);
		}
		
		private var s:int = 1;
		private function onTimer(timer:FlxTimer):void
		{
			scale.x += 0.0025 * s;
			scale.y += 0.0025 * s;
			angle += 0.05 * s;
			
			if (scale.x > 1.025) s = -1;
			if (scale.x < 1) s = 1;
		}
	}

}
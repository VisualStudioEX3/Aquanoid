package game 
{
	import org.flixel.*;
	
	public class PointAdded extends FlxText
	{
		private var timer:FlxTimer;
		
		public function PointAdded(x:uint, y:uint, score:uint) 
		{
			super(x, y, 100, "+" + score.toString());
			shadow = 0x772300ff;
			size = 12;
			timer = new FlxTimer();
			timer.start(0.1, 0, onTimer);
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			y--;
			alpha-=0.25;
			if (alpha == 0) kill();
		}
	}

}
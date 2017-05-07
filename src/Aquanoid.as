package
{
	import flash.events.Event;
	import org.flixel.*;
	import states.*;
	import mochi.as3.*;
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class Aquanoid extends FlxGame
	{		
		public function Aquanoid()
		{			
			Levels.SetLevels();
			
			super(640, 480, Menu, 1);
			
			this.useSoundHotKeys = false;
			FlxG.volume = 1;
		}	
		
		override protected function onFocusLost(FlashEvent:Event = null):void 
		{
			if (!FlxG.paused && Global.Balls > 0 && Global.Bricks > 0) Global.ForcePaused = true;
			super.onFocusLost(FlashEvent);
		}
	}
}
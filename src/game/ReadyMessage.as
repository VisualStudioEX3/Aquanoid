package game 
{
	import org.flixel.*;
	
	public class ReadyMessage extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/ui/msg_ready.png")] private var ready_img:Class;
		[Embed (source = "../../content/graphics/game/ui/msg_go.png")] private var go_img:Class;
		
		private var timerShow:FlxTimer;
		private var timerScale:FlxTimer;
		private var background:FlxSprite;
		private var ready:FlxSprite;
		private var go:FlxSprite;
		private var step:uint = 0;
		
		public function ReadyMessage(paused:Boolean=false) 
		{						
			background = new FlxSprite(0, 0);
			background.makeGraphic(640, 480, 0x77000000);
			add(background);
			
			ready = new FlxSprite(80, 200, ready_img);
			ready.antialiasing = true;
			ready.scale = new FlxPoint(1, 1);
			add(ready);
			
			go = new FlxSprite(132, 200, go_img);
			go.antialiasing = true;
			go.scale = new FlxPoint(0.5, 0.5);
			go.exists = false;
			add(go);
			
			timerShow = new FlxTimer();
			timerShow.start(1, 3, onTimerShow);
			
			timerScale = new FlxTimer();
			timerScale.start(0.1, 0, onTimerScale);
			
			FlxG.paused = paused;
		}
		
		private function onTimerShow(timer:FlxTimer):void
		{
			step++;
			
			if (step == 1)
			{
				ready.exists = false;
				go.exists = true;
			}
			else if (step == 2)
			{
				if (FlxG.paused) FlxG.paused = false;
				this.kill();
			}
		}
		
		private function onTimerScale(timer:FlxTimer):void
		{
			if (step == 0)
			{
				ready.scale.x -= 0.005;
				ready.scale.y -= 0.005;
			}
			else
			{
				go.scale.x += 0.25;
				go.scale.y += 0.25;
				go.alpha -= 0.25;
			}
			
			background.alpha -= 0.05;
		}
	}
}
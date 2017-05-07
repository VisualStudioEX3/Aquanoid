package game 
{	
	import org.flixel.*;
	
	public class Water extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/water.png")] private var water_img:Class;
		[Embed (source = "../../content/audio/sounds/game/waves.mp3")] private var waves_snd:Class;
		
		private var body:FlxSprite;
		private var water1:FlxSprite;
		private var water2:FlxSprite;
		private var max:FlxSprite;
		
		private var scrollTimer:FlxTimer;
		private var mainTimer:FlxTimer;
		private var waterUpTimer:FlxTimer;
		private var waterEventTimer:FlxTimer;
		
		public var y:uint;
		
		public function Water(activeTimers:Boolean=true) 
		{
			body = new FlxSprite(16, FlxG.height - 32);
			body.makeGraphic(384, 32, 0xff0000ff);
			body.width = 384;
			body.height = 32;
			body.visible = false;
			add(body);
			
			y = body.y;
			
			water1 = new FlxSprite(0, body.y - 8, water_img);
			water1.solid = false;
			add(water1);
			
			water2 = new FlxSprite(water1.width, body.y - 8, water_img);
			water2.solid = false;
			add(water2);
			
			scrollTimer = new FlxTimer();
			scrollTimer.start(0.1, 0, waterScroll); 
			
			if (activeTimers)
			{
				mainTimer = new FlxTimer();
				mainTimer.start(7, 0, waterMainControl);
				
				waterUpTimer = new FlxTimer();				
				waterEventTimer = new FlxTimer();
			}
		}
		
		private function waterScroll(timer:FlxTimer):void
		{
			if (!FlxG.paused)
			{
				water1.x -= 8; if (water1.x + water1.width <= 0) water1.x = water1.width;
				water1.y = y;
				water2.x -= 8; if (water2.x + water2.width <= 0) water2.x = water2.width;				
				water2.y = y;
			}
		}
		
		private function waterMainControl(timer:FlxTimer):void 
		{
			if (Global.fx_active) FlxG.play(waves_snd, 0.7);
			waterUpTimer.start(0.1, 10, onTimerWaterUp);
		}
		
		private function onTimerWaterUp(timer:FlxTimer):void
		{
			 if (!FlxG.paused && !Global.PlayerDead)
			{
				y -= 1.25;
				body.y = y;
			} 
		} 
		
		private function onTimerWaterDown(timer:FlxTimer):void
		{
			if (!FlxG.paused && !Global.PlayerDead)
			{
				if (body.y < FlxG.height - 32)
				{
					y += 2.25;
					body.y = y;
				}
			}
		}
		
		public function WaterUp():void
		{
			if (Global.fx_active) FlxG.play(waves_snd, 0.7);
			
			waterEventTimer.start(0.1, 20, onTimerWaterUp);
			mainTimer.stop();
			mainTimer.start(7, 0, waterMainControl);
		}
		
		public function WaterDown():void
		{
			if (Global.fx_active) FlxG.play(waves_snd, 0.7);
			
			waterEventTimer.start(0.1, 20, onTimerWaterDown);
			mainTimer.stop();
			mainTimer.start(7, 0, waterMainControl);
		}
	}
}
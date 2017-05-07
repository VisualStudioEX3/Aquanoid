package game 
{
	import flash.system.System;
	import flash.utils.Timer;
	import org.flixel.*;
	
	public class Item extends FlxSprite
	{
		[Embed (source = "../../content/graphics/game/powerups.png")] private var item_img:Class;
		
		private var timer:FlxTimer;		
		
		public function Item(x:uint, y:uint) 
		{
			super(x, y);			
			this.loadGraphic(item_img, true, false, 32, 16);
			this.frames = 8;
			
			this.randomFrame();
			
			if (this.frame == 5) this.frame = 99;
			
			if (this.frame == 7)
			{
				Global.extraLifeCounter++;
				if (Global.extraLifeCounter == 10)
					Global.extraLifeCounter = 0;						
				else
					this.frame = 99;					
			}
			
			this.visible = (this.frame != 99);
			
			Global.lastItem = this.frame;
			
			this.velocity.y = 42;
			
			timer = new FlxTimer();
		}		
		
		override public function update():void 
		{
			this.moves = !FlxG.paused;
			if (this.frame == 99 || this.y > FlxG.height)
			{	
				timer.stop();
				this.kill();
			}
			
			if (this.solid && this.y > Global.water.y)
			{			
				this.solid = false;
				this.velocity.x = 0;
				this.velocity.y = 21;
				
				FlxG.state.add(new WaterSplash(this.x - 30 / 2, Global.water.y - 49 + 8));
				
				timer.start(0.15, 0, onTimer);
			}
			
			super.update();
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			Global.Bubbles.add(new Bubbles(this.x, this.y - 32));
		}
	}
}
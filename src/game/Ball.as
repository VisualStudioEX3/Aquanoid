package game 
{	
	import org.flixel.*;
	
	public class Ball extends FlxSprite
	{		
		[Embed (source = "../../content/graphics/game/ball.png")] private var ball_img:Class;
		private const step:uint = 25;
		
		private var timer:FlxTimer;
		private var waitTimer:FlxTimer;
		private var bubbleTimer:FlxTimer;
		
		public function Ball(x:uint, y:uint, maxVelocity:uint, velocity:FlxPoint, wait:Boolean) 
		{
			super(x, y, ball_img);
			this.antialiasing = true;
			this.setOriginToCorner();
			this.width = 8; this.scale.x = 0.7;
			this.height = 8; this.scale.y = 0.7;
			this.maxVelocity.x = maxVelocity;
			this.maxVelocity.y = maxVelocity;
			this.elasticity = 5;
			this.velocity = velocity;
			
			if (wait)
			{
				Global.StopBall = true;
				waitTimer = new FlxTimer();
				waitTimer.start(4, 1, launchBall);
			}
			
			this.timer = new FlxTimer();
			this.bubbleTimer = new FlxTimer();
			
			Global.Balls++;
		}
		
		private function launchBall(timer:FlxTimer):void
		{
			Global.StopBall = false;
		}
		
		override public function update():void 
		{
			if (Global.StopBall && timer.finished) timer.start(5, 1, onTimer);
			
			this.moves = !Global.StopBall;
			
			if (waitTimer != null) waitTimer.paused = FlxG.paused; 
			
			if (this.maxVelocity.x != Global.BallMaxSpeed)
			{
				this.maxVelocity.x = Global.BallMaxSpeed;
				this.maxVelocity.y = Global.BallMaxSpeed;
				
				if (this.velocity.x > 0) this.velocity.x += step; else this.velocity.x -= step;
				if (this.velocity.y > 0) this.velocity.y += step; else this.velocity.y -= step;
			}
			
			if (!this.solid) this.velocity.x = 0;
			
			if (this.solid && this.y > Global.water.y + 16)
			{
				if (Global.Balls == 1) Global.ui.Dont();
			
				this.solid = false;
				this.velocity.x = 0;
				this.velocity.y = 25;
				
				FlxG.state.add(new WaterSplash(this.x - 50 / 2, Global.water.y - 49 + 8));
				
				bubbleTimer.start(0.15, 0, onTimerBuuble);
				
				Global.Balls--;
			}
			
			if (this.y > FlxG.height)
			{
				bubbleTimer.stop();
				this.kill();
			}
			
			if (Global.StopBall)
			{
				this.x = Global.pad.Bounds.x + 50;
				this.y = Global.pad.Bounds.y - 10;
			}
			
			super.update();
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			Global.StopBall = false;
		}
		
		private function onTimerBuuble(timer:FlxTimer):void
		{
			Global.Bubbles.add(new Bubbles(this.x - 8, this.y - 32));
		}		
	}
}
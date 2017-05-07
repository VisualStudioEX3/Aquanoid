package game
{
	import org.flixel.*;
	

	public class Brick extends FlxSprite
	{	
		[Embed (source = "../../content/graphics/game/blocks.png")] private var brick_img:Class;
		[Embed (source = "../../content/audio/sounds/game/bricks/7.mp3")] private var brick7_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/bricks/8.mp3")] private var brick8_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/bricks/9.mp3")] private var brick9_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/bricks/break.mp3")] private var break_snd:Class;
		
		private var points:uint;
		private var type:uint;
		
		private var timer:FlxTimer;
		private var timerFix:FlxTimer;
		
		public var Index:uint = 0;
		
		public function Brick(column:uint, row:uint, type:uint, index:uint)
		{				
			super((32 * column) + 16, (16 * row) + 16);
			
			this.loadGraphic(brick_img, true, false, 32, 16, false);
			this.frames = 11;
			this.type = type;
			this.Index = index;
			
			switch (type)
			{				
				case 0:
					this.frame = 0;
					points = 25;
					this.health = 1;
					break;
				case 1: 
					this.frame = 1;
					points = 25;
					this.health = 1;
					break;
				case 2: 
					this.frame = 2;
					points = 25;
					this.health = 1;
					break;
				case 3: 
					this.frame = 3;
					points = 50;
					this.health = 1;
					break;
				case 4: 
					this.frame = 4;
					points = 50;
					this.health = 1;
					break;
				case 5: 
					this.frame = 5;
					points = 100;
					this.health = 1;
					break;
				case 6: 
					if (Global.LevelStatus[this.Index] == 2)
					{
						this.frame = 7;
						this.health = 1;
					}
					else
					{
						this.frame = 6;
						this.health = 2;
					}
					
					points = 200;					
					break;
				case 7: 
					this.frame = 9;
					this.health = -1;
					break;
			}
			
			if (type != 7) Global.Bricks++;
			this.immovable = true;
			
			timer = new FlxTimer();
			timerFix = new FlxTimer();
			timerFix.start(0.5, 0, onTimerFix);
		}
		
		override public function hurt(Damage:Number):void 
		{
			if (this.type == 7)			
			{
				if (Global.fx_active) FlxG.play(brick7_snd, 0.7);
				timer.start(0.05, 2, onTimer);				
			}
			else
			{
				super.hurt(1);
				
				if (this.health == 0)
				{
					if (Global.fx_active) FlxG.play(brick9_snd, 0.7);
					
					Global.Score += this.points;
					Global.LevelStatus[this.Index] = 1;
					Global.Bricks--;
					FlxG.state.add(new PointAdded(x, y, points));
					this.kill();
				}
				else
				{	
					if (Global.fx_active) FlxG.play(break_snd, 0.7);
					Global.LevelStatus[this.Index] = 2;
					this.frame++;
				}
			}
		}
		
		private function onTimer(timer:FlxTimer):void
		{
			if (this.frame == 9) this.frame = 10; else this.frame = 9;
		}
		
		private function onTimerFix(timer:FlxTimer):void
		{
			if (this.frame == 10) this.frame = 9;
		}
	}
}
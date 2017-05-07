package states
{
	import ui.*;
	import org.flixel.*;
	import game.*;
	
	public class Game extends FlxState
	{
		[Embed (source = "../../content/graphics/game/backgrounds/bg_1.jpg")] private var bg1_img:Class;	
		[Embed (source = "../../content/graphics/game/backgrounds/bg_2.jpg")] private var bg2_img:Class;
		[Embed (source = "../../content/graphics/game/backgrounds/bg_3.jpg")] private var bg3_img:Class;
		[Embed (source = "../../content/graphics/game/backgrounds/bg_4.jpg")] private var bg4_img:Class;
		[Embed (source = "../../content/graphics/game/backgrounds/bg_5.jpg")] private var bg5_img:Class;
		[Embed (source = "../../content/graphics/game/backgrounds/bg_6.jpg")] private var bg6_img:Class;
		[Embed (source = "../../content/graphics/game/scene.png")] private var front_img:Class;
		[Embed (source = "../../content/graphics/game/endline.png")] private var endline_img:Class;
		[Embed (source = "../../content/graphics/game/ui/hlp_pausegame.png")] private var pausehint_img:Class;
		[Embed (source = "../../content/audio/sounds/game/bricks/8.mp3")] private var brick8_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/bricks/9.mp3")] private var brick9_snd:Class;
		
		private var cursor:MouseCursor;		
		private var gameArea:GameArea;
		private var balls:FlxGroup;
		private var bricks:FlxGroup;
		private var endline:FlxSprite;
		private var items:FlxGroup;
		
		private var ballXOffset:uint = 50;
		
		private var ballSpeedTimer:FlxTimer;
		private var ballLaunchTimer:FlxTimer;
		private var resetStateTimer:FlxTimer;
		
		private var pauseDialog:PauseDialog;
		private var pauseHint:FlxSprite;
		
		override public function create():void
		{	
			super.create();
			
			Global.PlayerDead = false;
			Global.BallMaxSpeed = 100;
			Global.Balls = 0;
			
			gameArea = new GameArea();
			add(gameArea);
			
			var bg:FlxSprite = new FlxSprite(0, 0);
			
			if (Global.Level > 0 && Global.Level <= 5)
				bg.loadGraphic(bg1_img, true, false, 403, 480);
			else if (Global.Level > 5 && Global.Level <= 10)
				bg.loadGraphic(bg2_img, true, false, 403, 480);
			else if (Global.Level > 10 && Global.Level <= 15)
				bg.loadGraphic(bg3_img, true, false, 403, 480);
			else if (Global.Level > 15 && Global.Level <= 20)
				bg.loadGraphic(bg4_img, true, false, 403, 480);
			else if (Global.Level > 20 && Global.Level <= 25)
				bg.loadGraphic(bg5_img, true, false, 403, 480);
			else
				bg.loadGraphic(bg6_img, true, false, 403, 480);
				
			add(bg);
			
			endline = new FlxSprite(0, 150, endline_img);
			add(endline);
			
			Global.pad = new Pad();
			Global.pad.y = FlxG.height - 64;
			add(Global.pad);		
			
			balls = new FlxGroup();
			Global.pad.update();
			balls.add(new Ball(Global.pad.Bounds.x + 50, Global.pad.Bounds.y + 12, 100, new FlxPoint(75, -100), true));	
			add(balls);
			
			ballSpeedTimer = new FlxTimer();
			ballSpeedTimer.start(10, 0, ballSpeed);
			
			ballLaunchTimer = new FlxTimer();
			ballLaunchTimer.start(10, 0, null);
			
			bricks = new FlxGroup();
			this.LoadLevel();	
			
			items = new FlxGroup();
			add(items);
			
			// Agua:
			Global.water = new Water();
			add(Global.water);
			
			Global.Bubbles = new FlxGroup();
			add(Global.Bubbles);
			
			add(new FlxSprite(0, 0, front_img));
			
			Global.ui = new UI();
			add(Global.ui);
			
			add(new FXSwitch());
			add(new MusicSwitch());
			
			resetStateTimer = new FlxTimer();
			
			pauseHint = new FlxSprite(105, FlxG.height - 19, pausehint_img);
			add(pauseHint);
			
			add(new ReadyMessage());
			
			pauseDialog = new PauseDialog();
			add(pauseDialog);
			
			add(new MouseCursor());
			
			MusicJukebox.Play(MusicJukebox.inGame_mus);
		}
		
		private function LoadLevel():void
		{			
			var column:uint = 0;
			var row:uint = 0;
			var i:uint;
			var level:Level = Levels.list[Global.Level - 1];
			
			Global.Bricks = 0;
			
			for (i = 0; i < level.Bricks.length; i++)
			{				
				if (level.Bricks[i] > 0 && Global.LevelStatus[i] != 1) bricks.add(new Brick(column, row, level.Bricks[i] - 1, i));
				
				column++; 
				if (column == 12) 
				{
					column = 0;
					row++;
				}				
			}
			
			add(bricks);
		}
		
		override public function update():void
		{

			if (!FlxG.paused && Global.Balls > 0 && !Global.PlayerDead)
			{
				if (Global.ForcePaused || (FlxG.keys.justPressed("P") || FlxG.keys.justPressed("ESCAPE")))
					pauseDialog.ShowDialog();
				
				if (FlxG.keys.justPressed("SPACE"))
					Global.StopBall = false;
			}
			
			balls.active = !FlxG.paused;
			
			super.update();
			
			FlxG.collide(Global.pad, gameArea);
			if (!Global.PlayerDead && Global.Bricks > 0 && Global.pad.Bounds.y <= endline.y) DestroyPad(true);
			if (!Global.PlayerDead) FlxG.collide(Global.pad, items, getItem);
			FlxG.collide(balls, gameArea, hitSound);
			FlxG.collide(balls, bricks, hitBrick);
			FlxG.collide(balls, Global.pad, hitPad);
			
			if (Global.Bricks == 0 && !Global.ShowPassLevelDialog)
			{
				Global.ui.Success();
				FlxG.paused = true;
				resetStateTimer.start(1.5, 1, onTimerPassLevel);
			}
			
			if (!Global.PlayerDead && Global.Balls == 0)
			{
				DestroyPad(false);
			}
		}
		
		private function hitSound(ball:FlxSprite, wall:FlxSprite):void
		{
			if (Global.fx_active) FlxG.play(brick8_snd);
		}
		
		private function hitBrick(ball:FlxSprite, brick:FlxSprite):void
		{			
			brick.hurt(1);
			if (brick.frame < 6)
			{
				var value:uint = (FlxG.random() * 1);
				if (value == 0)
				{
					Global.makeItem++;
					if (Global.makeItem == 3)
					{
						Global.makeItem = 0;
						items.add(new Item(brick.x, brick.y));
					}
				}
			}
		}
		
		private function hitPad(ball:FlxSprite, pad:FlxSprite):void
		{				
			if (Global.fx_active) FlxG.play(brick9_snd);
			
			if ((ball.x > Global.pad.Bounds.x + 40) && (ball.x < Global.pad.Bounds.x + Global.pad.Bounds.width - 40))
			{
				if (ball.velocity.x > 0) ball.velocity.x = 50; else ball.velocity.x = -50;
				ball.velocity.y = -Math.abs(ball.maxVelocity.y);
			}
			else if (ball.x < Global.pad.Bounds.x + 32)
			{
				ball.velocity.x = -ball.maxVelocity.x * 2;
				ball.velocity.y = -Math.abs(ball.velocity.y / 2);
			}
			else if (ball.x > Global.pad.Bounds.x + Global.pad.Bounds.width - 32)
			{
				ball.velocity.x = ball.maxVelocity.x * 2;
				ball.velocity.y = -Math.abs(ball.velocity.y / 2);
			}
			else
			{
				ball.velocity.y = -Math.abs(ball.velocity.y * 2.5);
			}
			
			ball.velocity.y = -Math.abs(ball.velocity.y);
			
			if (ball.velocity.y > -30) ball.velocity.y = -30;
		}
		
		private function DestroyPad(force:Boolean):void		
		{
			if (force || (Global.Bricks > 0 && Global.Balls == 0))
			{
				Global.pad.KillMe();
				
				Global.Lives--;
				Global.PlayerDead = true;
				
				if (Global.Lives == 0)
				{
					resetStateTimer.start(3, 1, onTimerGameOver);
				}
				else
				{
					resetStateTimer.start(3, 1, onTimerResetState);
				}
			}
		}
		
		private function getItem(pad:FlxSprite, item:FlxSprite):void
		{
			switch (item.frame)
			{
				case 0:
					Global.Score += 50;
					FlxG.state.add(new PointAdded(item.x, item.y, 50));
					Global.pad.ScaleUp();
					Global.ui.GoodJob();
					break;
				case 1:
					Global.Score += 100;
					FlxG.state.add(new PointAdded(item.x, item.y, 100));
					Global.pad.ScaleDown(); 
					Global.ui.Oops();					
					break;
				case 2:
					Global.Score += 100;
					FlxG.state.add(new PointAdded(item.x, item.y, 100));
					Global.water.WaterUp(); 
					Global.ui.Oops();
					break;
				case 3:
					Global.Score += 25;
					FlxG.state.add(new PointAdded(item.x, item.y, 25));
					Global.water.WaterDown(); 
					Global.ui.GoodJob();
					break;
				case 4:
					Global.Score += 100;
					SoundFXLib.Play(SoundFXLib.slowBall);
					FlxG.state.add(new PointAdded(item.x, item.y, 100));
					Global.BallMaxSpeed = 100; 
					Global.ui.GoodJob();
					break;
				case 6:
					Global.Score += 75;
					FlxG.state.add(new PointAdded(item.x, item.y, 75));
					if (Global.Balls > 0 && Global.Balls < 3)
					{
						var firstBall:FlxSprite = balls.getFirstAlive() as FlxSprite;
						if (Global.Balls < 3) balls.add(new Ball(firstBall.x, firstBall.y, Global.BallMaxSpeed, new FlxPoint(-Global.BallMaxSpeed, firstBall.velocity.y / 1.5), false));
						if (Global.Balls < 3) balls.add(new Ball(firstBall.x, firstBall.y, Global.BallMaxSpeed, new FlxPoint(Global.BallMaxSpeed, firstBall.velocity.y / 1.5), false));
					}
					Global.ui.GoodJob();
					break;
				case 7:
					Global.Score += 1000;
					FlxG.state.add(new PointAdded(item.x, item.y, 1000));
					Global.Lives++; 
					Global.ui.GoodJob();
					break;
			}
			
			item.kill();
		}
		
		private function ballSpeed(timer:FlxTimer):void
		{
			const step:uint = 25;			
			if (!FlxG.paused) Global.BallMaxSpeed += step;
		}
		
		private function onTimerPassLevel(timer:FlxTimer):void
		{			
			if (Global.Level == 30) add(new EndGame()); else add(new LevelCompleted());
		}
		
		private function onTimerResetState(timer:FlxTimer):void
		{
			FlxG.resetState();
		}
		
		private function onTimerGameOver(timer:FlxTimer):void
		{
			Global.ui.GameOver();
			add(new GameOver());
		}
	}
}
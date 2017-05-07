package game 
{
	import org.flixel.*;
	
	public class UI extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/UI/faces/face_success.png")] private var face_success_img:Class;
		[Embed (source = "../../content/graphics/game/UI/faces/face_oops.png")] private var face_oops_img:Class;
		[Embed (source = "../../content/graphics/game/UI/faces/face_goodjob.png")] private var face_goodjob_img:Class;
		[Embed (source = "../../content/graphics/game/UI/faces/face_gameover.png")] private var face_gameover_img:Class;
		
		private var face_success:FlxSprite;
		private var face_oops:FlxSprite;
		private var face_goodJob:FlxSprite;
		private var face_gameOver:FlxSprite;
		
		[Embed (source = "../../content/graphics/game/UI/messages/msg_success.png")] private var msg_success_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_oops!.png")] private var msg_oops_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_goodjob.png")] private var msg_goodjob_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_gameover.png")] private var msg_gameover_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_dont.png")] private var msg_dont_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_finishgame.png")] private var msg_finishgame_img:Class;
		
		private var msg_success:FlxSprite;
		private var msg_oops:FlxSprite;
		private var msg_goodjob:FlxSprite;
		private var msg_gameover:FlxSprite;
		private var msg_dont:FlxSprite;
		private var msg_finishgame:FlxSprite;
		
		[Embed (source = "../../content/graphics/game/UI/label_score.png")] private var score_img:Class;
		
		private var label_score:FlxSprite;
		
		[Embed (source = "../../content/graphics/game/UI/label_level.png")] private var lbl_level_img:Class;
		[Embed (source = "../../content/graphics/game/UI/numbers_font.png")] private var digits_img:Class;
		
		private var label_level:FlxSprite;
		private var num_level:Array;
		
		[Embed (source = "../../content/audio/sounds/game/voices/Dont.mp3")] private var face_dont_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/GoodJob.mp3")] private var face_goodjob_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/ImSorry.mp3")] private var face_imsorry_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/Oops.mp3")] private var face_oops_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/Success.mp3")] private var face_success_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/YouWin.mp3")] private var face_youwin_snd:Class;
		
		private var timer_ui:FlxTimer;
		
		private var sprite_score:LabelScore;
		private var lives:ShowLives;
		
		private var soundLocked:Boolean = false;
		
		public function UI() 
		{
			label_score = new FlxSprite(410, 32, score_img);
			add(label_score);
			
			sprite_score = new LabelScore();
			add(sprite_score);
			
			label_level = new FlxSprite(415, 0, lbl_level_img);
			add(label_level);
			
			num_level = new Array(new FlxSprite(), new FlxSprite());
			var num:FlxSprite = num_level[0];
			num.loadGraphic(digits_img, false, false, 23, 24);
			num.x = 500;
			num.y = 8;
			num.frameWidth = 23;
			num.frameHeight = 24;
			num.frames = 10;
			num.frame = uint(Global.Level.toString().charAt(0));
			add(num);
			
			if (Global.Level > 9)
			{
				num = num_level[1];
				num.loadGraphic(digits_img, false, false, 23, 24);
				num.x = 500 + 23;
				num.y = 8;
				num.frameWidth = 23;
				num.frameHeight = 24;
				num.frames = 10;
				num.frame = uint(Global.Level.toString().charAt(1));
				add(num);
			}			
			
			face_success = new FlxSprite(450, 146, face_success_img);
			face_success.visible = true;
			add(face_success);
			
			face_oops = new FlxSprite(450, 146, face_oops_img);
			face_oops.visible = false;
			add(face_oops);
			
			face_goodJob = new FlxSprite(450, 146, face_goodjob_img);
			face_goodJob.visible = false;
			add(face_goodJob);
			
			face_gameOver = new FlxSprite(450, 146, face_gameover_img);
			face_gameOver.visible = false;
			add(face_gameOver);
			
			msg_oops = new FlxSprite(430, 350, msg_oops_img);
			msg_oops.visible = false;
			add(msg_oops);
			
			msg_goodjob = new FlxSprite(450, 350, msg_goodjob_img);
			msg_goodjob.visible = false;
			add(msg_goodjob);
			
			msg_dont = new FlxSprite(450, 350, msg_dont_img);
			msg_dont.visible = false;
			add(msg_dont);
			
			msg_success = new FlxSprite(380, 320, msg_success_img);
			msg_success.visible = false;
			add(msg_success);
			
			msg_gameover = new FlxSprite(32, 200, msg_gameover_img);
			msg_gameover.visible = false;
			add(msg_gameover);
			
			msg_finishgame = new FlxSprite(20, 150, msg_finishgame_img);
			msg_finishgame.visible = false;
			add(msg_finishgame);
			
			lives = new ShowLives();
			add(lives);
			
			timer_ui = new FlxTimer();
		}		
		
		public function Success():void
		{
			if (!soundLocked)
			{
				if (Global.fx_active) FlxG.play(face_success_snd);
				soundLocked = true;
			}
			
			timer_ui.stop();
			
			face_success.visible = false;
			face_oops.visible = false;
			face_goodJob.visible = true;
			face_gameOver.visible = false;
			
			msg_oops.visible = false;
			msg_goodjob.visible = false;
			msg_dont.visible = false;
			msg_success.visible = true;
			msg_gameover.visible = false;
			msg_finishgame.visible = false;
			
			timer_ui.stop();
			timer_ui.start(3, 1, onResetUIToDefault);
		}
		
		public function Oops():void
		{
			if (Global.Balls > 0)
			{
				if (Global.fx_active) FlxG.play(face_oops_snd);
				
				face_success.visible = false;
				face_oops.visible = true;
				face_goodJob.visible = false;
				face_gameOver.visible = false;
				
				msg_oops.visible = true;
				msg_goodjob.visible = false;
				msg_dont.visible = false;
				msg_success.visible = false;
				msg_gameover.visible = false;
				msg_finishgame.visible = false;
				
				timer_ui.stop();
				timer_ui.start(3, 1, onResetUIToDefault);
			}
		}
		
		public function Dont():void
		{
			if (Global.Balls > 0)
			{
				if (Global.fx_active) FlxG.play(face_dont_snd);
				
				face_success.visible = false;
				face_oops.visible = false;
				face_goodJob.visible = false;
				face_gameOver.visible = true;
				
				msg_oops.visible = false;
				msg_goodjob.visible = false;
				msg_dont.visible = true;
				msg_success.visible = false;
				msg_gameover.visible = false;
				msg_finishgame.visible = false;
				
				if (Global.Balls > 0)
				{
					timer_ui.stop();
					timer_ui.start(3, 1, onResetUIToDefault);
				}
			}
		}
		
		public function GoodJob():void
		{
			if (Global.Balls > 0)
			{
				if (Global.fx_active) FlxG.play(face_goodjob_snd);
				
				face_success.visible = false;
				face_oops.visible = false;
				face_goodJob.visible = true;
				face_gameOver.visible = false;
				
				msg_oops.visible = false;
				msg_goodjob.visible = true;
				msg_dont.visible = false;
				msg_success.visible = false;
				msg_gameover.visible = false;
				msg_finishgame.visible = false;
				
				timer_ui.stop();
				timer_ui.start(3, 1, onResetUIToDefault);
			}
		}
		
		public function GameOver():void
		{
			if (Global.fx_active) FlxG.play(face_imsorry_snd);
			
			timer_ui.stop();
			
			face_success.visible = false;
			face_oops.visible = false;
			face_goodJob.visible = false;
			face_gameOver.visible = true;
			
			msg_oops.visible = false;
			msg_goodjob.visible = false;
			msg_dont.visible = false;
			msg_success.visible = false;
			msg_gameover.visible = false;
			msg_finishgame.visible = false;
		}
		
		public function FinishGame():void
		{
			if (Global.fx_active) FlxG.play(face_youwin_snd);
			
			timer_ui.stop();
			
			face_success.visible = false;
			face_oops.visible = false;
			face_goodJob.visible = true;
			face_gameOver.visible = false;
			
			msg_oops.visible = false;
			msg_goodjob.visible = true;
			msg_dont.visible = false;
			msg_success.visible = false;
			msg_gameover.visible = false;
			msg_finishgame.visible = true;
		}
		
		private function onResetUIToDefault(timer:FlxTimer):void
		{
			face_success.visible = true;
			face_oops.visible = false;
			face_goodJob.visible = false;
			face_gameOver.visible = false;
			
			msg_oops.visible = false;
			msg_goodjob.visible = false;
			msg_dont.visible = false;
		}
	}
}
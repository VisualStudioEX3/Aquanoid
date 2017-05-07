package states 
{
	import game.Water;
	import org.flixel.*;
	import ui.*;
	
	public class Password extends FlxState
	{		
		[Embed (source = "../../content/graphics/game/UI/numbers_font.png")] private var digits_img:Class;
		[Embed (source = "../../content/graphics/game/scene.png")] private var front_img:Class;
		[Embed (source = "../../content/graphics/game/UI/faces/face_success.png")] private var face_success_img:Class;
		[Embed (source = "../../content/graphics/game/UI/faces/face_oops.png")] private var face_oops_img:Class;
		[Embed (source = "../../content/graphics/game/UI/faces/face_goodjob.png")] private var face_goodjob_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_success.png")] private var msg_success_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_oops!.png")] private var msg_oops_img:Class;
		[Embed (source = "../../content/graphics/game/backgrounds/bg_1.jpg")] private var bg1_img:Class;
		[Embed (source = "../../content/graphics/btn_back.png")] private var btn_back_img:Class;
		[Embed (source = "../../content/graphics/password/btn_ok.png")] private var btn_ok_img:Class;
		[Embed (source = "../../content/graphics/password/passBox.png")] private var passBox_img:Class;
		[Embed (source = "../../content/graphics/password/label_password.png")] private var pass_img:Class;
		[Embed (source = "../../content/graphics/password/hlp_passBox.png")] private var hint_img:Class;
		[Embed (source = "../../content/graphics/splash/loading.png")] private var loading_img:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/Oops.mp3")] private var face_oops_snd:Class;
		[Embed (source = "../../content/audio/sounds/game/voices/Success.mp3")] private var face_success_snd:Class;
		
		private var face_success:FlxSprite;
		private var face_oops:FlxSprite;
		private var face_goodJob:FlxSprite;
		private var msg_success:FlxSprite;
		private var msg_oops:FlxSprite;
		
		private var labelString:String = "";
		
		private var charIndex:uint = 0;
		private var charArray:Array;
		
		private var timer:FlxTimer;
		
		private var btn_ok:Button;
		private var btn_back:Button;
		private var lbl_pass:FlxSprite;
		private var dlg_pass:FlxSprite;
		
		private var loading:FlxSprite;
		
		private var shadowBox:FlxSprite;
		private var labelHint:FlxText;
		
		private var hint:FlxSprite;
		
		private const offSetY:int = -50;
		
		override public function create():void 
		{			
			super.create();
			
			add(new FlxSprite(0, 0, bg1_img));
			add(new Water(false));
			add(new FlxSprite(0,0, front_img));
			
			face_success = new FlxSprite(450, 146, face_success_img);
			face_success.visible = true;
			add(face_success);
			
			face_oops = new FlxSprite(450, 146, face_oops_img);
			face_oops.visible = false;
			add(face_oops);
			
			face_goodJob = new FlxSprite(450, 146, face_goodjob_img);
			face_goodJob.visible = false;
			add(face_goodJob);
			
			msg_oops = new FlxSprite(430, 350, msg_oops_img);
			msg_oops.visible = false;
			add(msg_oops);
			
			msg_success = new FlxSprite(380, 320, msg_success_img);
			msg_success.visible = false;
			add(msg_success);
			
			dlg_pass = new FlxSprite(88, 224 + offSetY, passBox_img);
			add(dlg_pass);
			
			lbl_pass = new FlxSprite(160, 185 + offSetY, pass_img);
			lbl_pass.antialiasing = true;
			lbl_pass.scale = new FlxPoint(1.25, 1.25);
			add(lbl_pass);
			
			btn_ok = new Button(140, 300 + offSetY, btn_ok_img, onClickOk);
			btn_ok.OnOverAngle = 10;
			btn_ok.OnOutAngle = 0;
			add(btn_ok);
			
			btn_back = new Button(200, 300 + offSetY, btn_back_img, onClickBack);
			btn_back.OnOverAngle = 10;
			btn_back.OnOutAngle = 0;
			add(btn_back);
			
			hint = new FlxSprite(36, 350 + offSetY, hint_img);
			add(hint);
			
			charArray = new Array(new FlxSprite(), new FlxSprite(), new FlxSprite(), new FlxSprite(), new FlxSprite())
			
			var i:uint;
			var char:FlxSprite;
			for each (char in charArray)
			{				
				i++;
				char.loadGraphic(digits_img, true, false, 23, 24);
				char.antialiasing = true;
				char.scale.x = 1.5;
				char.scale.y = 1.5;
				char.setOriginToCorner();
				char.x = 95 + (32 * i);
				char.y = 245 + offSetY;
				char.frameWidth = 23;
				char.frameHeight = 24;
				char.frames = 10;
				char.frame = 0;
				char.visible = false;
				add(char);
			}
			
			loading = new FlxSprite(150, 250, loading_img);
			loading.visible = false;
			add(loading);
			
			add(new FXSwitch());
			add(new MusicSwitch());
			add(new MouseCursor());
			
			timer = new FlxTimer();
		}
		
		override public function update():void 
		{
			if (charIndex < 5 && btn_back.active)
			{
				if (FlxG.keys.justPressed("ZERO") || FlxG.keys.justPressed("NUMPADZERO"))
				{
					charIndex++;
					labelString += "0";
				}
				else if (FlxG.keys.justPressed("ONE") || FlxG.keys.justPressed("NUMPADONE"))
				{
					charIndex++;
					labelString += "1";
				}
				else if (FlxG.keys.justPressed("TWO") || FlxG.keys.justPressed("NUMPADTWO"))
				{
					charIndex++;
					labelString += "2";
				}
				else if (FlxG.keys.justPressed("THREE") || FlxG.keys.justPressed("NUMPADTHREE"))
				{
					charIndex++;
					labelString += "3";
				}
				else if (FlxG.keys.justPressed("FOUR") || FlxG.keys.justPressed("NUMPADFOUR"))
				{
					charIndex++;
					labelString += "4";
				}
				else if (FlxG.keys.justPressed("FIVE") || FlxG.keys.justPressed("NUMPADFIVE"))
				{
					charIndex++;
					labelString += "5";
				}
				else if (FlxG.keys.justPressed("SIX") || FlxG.keys.justPressed("NUMPADSIX"))
				{
					charIndex++;
					labelString += "6";
				}
				else if (FlxG.keys.justPressed("SEVEN") || FlxG.keys.justPressed("NUMPADSEVEN"))
				{
					charIndex++;
					labelString += "7";
				}
				else if (FlxG.keys.justPressed("EIGHT") || FlxG.keys.justPressed("NUMPADEIGHT"))
				{
					charIndex++;
					labelString += "8";
				}
				else if (FlxG.keys.justPressed("NINE") || FlxG.keys.justPressed("NUMPADNINE"))
				{
					charIndex++;
					labelString += "9";
				}
			}
				
			if (FlxG.keys.justPressed("BACKSPACE") || FlxG.keys.justPressed("DELETE"))
			{ 
				if (charIndex > 0) 
				{
					charIndex--;
					labelString = labelString.substr(0, charIndex);
				}
				else
					labelString = "";
			}	
			else if (FlxG.keys.justPressed("ENTER") && btn_ok.active)
			{
				onClickOk();
			}
			else if (FlxG.keys.justPressed("ESCAPE") && btn_back.active)
			{
				onClickBack();
			}
			
			btn_ok.active = labelString.length == 5;
			
			super.update();
		}
		
		override public function draw():void
		{
			var i:uint;
			var char:FlxSprite;
			for each (char in charArray)
			{
				if (i < charIndex)
				{
					char.visible = true;
					char.frame = uint(labelString.charAt(i));
				}
				else
				{
					char.visible = false;
				}
				i++;
			}

			super.draw();
		}
		
		private var levelFound:Boolean = false;
		private function onTimerSuccess(timer:FlxTimer):void
		{
			FlxG.switchState(new Game() as FlxState);
		}
		
		private function onTimerRestore(timer:FlxTimer):void
		{
			if (levelFound)
			{
				lbl_pass.exists = false;
				dlg_pass.exists = false;
				btn_ok.exists = false;
				btn_back.exists = false;
				hint.exists = false;
				loading.visible = true;
				
				Global.Score = 0;
				Global.Lives = 3;
				Global.ResetLevelStatus();
				
				timer.start(3, 1, onTimerSuccess);
			}
			else
			{
				btn_back.active = true;
			}
			
			face_success.visible = true;
			face_oops.visible = false;				
			msg_oops.visible = false;
			face_goodJob.visible = false;				
			msg_success.visible = false;
		}
		
		private function onClickOk():Function
		{				
			levelFound = true;
			var level:int = Levels.GetIndexFromPassword(labelString);
			
			if (level > 0)
			{
				levelFound = true;
				Global.Level = level;
			}
			else
				levelFound = false;
				
			if (levelFound)
				FlxG.play(face_success_snd);
			else
				FlxG.play(face_oops_snd);
			
			face_success.visible = false;
			face_oops.visible = !levelFound;				
			msg_oops.visible = !levelFound;
			face_goodJob.visible = levelFound;				
			msg_success.visible = levelFound;
			btn_back.active = false;
			
			timer.start(2, 1, onTimerRestore);
			
			charIndex = 0;
			labelString = "";
			
			return null;
		}
		
		private function onClickBack():Function
		{
			FlxG.switchState(new Menu() as FlxState);
			return null;
		}
	}
}
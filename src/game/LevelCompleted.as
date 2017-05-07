package game 
{
	import org.flixel.*;
	import game.*;
	import ui.*;
	import states.*;
	
	public class LevelCompleted extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/UI/numbers_font.png")] private var digits_img:Class;
		[Embed (source = "../../content/graphics/game/UI/msg_complete.png")] private var msg_completed_img:Class;
		[Embed (source = "../../content/graphics/password/label_password.png")] private var pass_img:Class;
		[Embed (source = "../../content/graphics/game/UI/btn_continue.png")] private var btn_continue_img:Class;
		[Embed (source = "../../content/graphics/game/UI/btn_back.png")] private var btn_menu_img:Class;
		[Embed (source = "../../content/graphics/password/passBox.png")] private var passBox_img:Class;
		
		private var background:FlxSprite;
		private var congratulations:FlxSprite;
		private var passLevel:FlxSprite;
		private var btn_continue:Button;
		private var btn_returnMenu:Button;
		private var passArray:Array;
		private var timer:FlxTimer;
		
		private const offsetY:int = -50;
		
		public function LevelCompleted()
		{
			Global.ShowPassLevelDialog = true;
			FlxG.paused = true;
			
			background = new FlxSprite(0, 0);						
			background.makeGraphic(640, 480, 0x77000000);
			add(background);
			
			congratulations = new FlxSprite(10, 160 + offsetY, msg_completed_img);
			congratulations.antialiasing = true;
			congratulations.scale = new FlxPoint(0.9, 0.9);
			add(congratulations);
			
			add(new FlxSprite(88, 258 + offsetY, passBox_img));
			
			passLevel = new FlxSprite(160, 224 + offsetY, pass_img);
			add(passLevel);
			
			Global.ResetLevelStatus();
			Global.Level++;
			
			var level:Level = Levels.list[Global.Level - 1];
			var i:uint;
			var char:FlxSprite;
			passArray = new Array(new FlxSprite(), new FlxSprite(), new FlxSprite(), new FlxSprite(), new FlxSprite())
			for (i = 0; i < 5; i++)
			{
				char = passArray[i];
				char.loadGraphic(digits_img, true, false, 23, 24);
				char.antialiasing = true;
				char.scale.x = 1.5;
				char.scale.y = 1.5;
				char.setOriginToCorner();
				char.x = 130 + (32 * i);
				char.y = 280 + offsetY;
				char.frameWidth = 23;
				char.frameHeight = 24;
				char.frames = 10;
				char.frame = uint(level.Password.charAt(i));
				add(char);
			}
			
			btn_continue = new Button(130, 350 + offsetY, btn_continue_img, onClickContinue);
			add(btn_continue);
			
			btn_returnMenu = new Button(86, 400 + offsetY, btn_menu_img, onClickReturnMenu);
			add(btn_returnMenu);
			
			add(new MouseCursor());
			
			timer = new FlxTimer();
			timer.start(0.1, 0, onTimer);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ENTER"))
				onClickContinue();
			else if (FlxG.keys.justPressed("ESCAPE"))
				onClickReturnMenu();
				
			super.update();
		}
		
		override public function destroy():void 
		{
			Global.ShowPassLevelDialog = false;
			FlxG.paused = false;
			super.destroy();
		}
		
		private function onClickContinue():Function
		{
			FlxG.resetState();
			return null;
		}
		
		private function onClickReturnMenu():Function
		{
			FlxG.switchState(new Menu() as FlxState);
			this.kill();
			return null;
		}
		private var s:int = 1;
		private function onTimer(timer:FlxTimer):void
		{
			congratulations.scale.x += 0.0025 * s;
			congratulations.scale.y += 0.0025 * s;
			congratulations.angle += 0.05 * s;
			
			if (congratulations.scale.x > 0.925) s = -1;
			if (congratulations.scale.x < 0.9) s = 1;
		}
	}
}
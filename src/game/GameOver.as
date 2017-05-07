package game 
{
	import org.flixel.*;
	import game.*;
	import ui.*;
	import states.*;
	
	public class GameOver extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/UI/messages/msg_gameover.png")] private var msg_gameover_img:Class;
		[Embed (source = "../../content/graphics/game/UI/btn_back.png")] private var btn_menu_img:Class;
		
		private var background:FlxSprite;
		private var gameOver:FlxSprite;
		private var btn_returnMenu:Button;
		private var timer:FlxTimer;
		
		public function GameOver() 
		{
			background = new FlxSprite(0, 0);
			background.makeGraphic(640, 480, 0x77000000);
			add(background);
			
			gameOver = new FlxSprite(32, 200, msg_gameover_img);
			gameOver.antialiasing = true;
			add(gameOver);
			
			btn_returnMenu = new Button(88, 300, btn_menu_img, onClickReturnMenu);
			add(btn_returnMenu);
			
			add(new MouseCursor());
			
			timer = new FlxTimer();
			timer.start(0.1, 0, onTimer);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("ESCAPE"))
				onClickReturnMenu();
				
			super.update();
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
			gameOver.scale.x += 0.0025 * s;
			gameOver.scale.y += 0.0025 * s;
			gameOver.angle += 0.05 * s;
			
			if (gameOver.scale.x > 1.025) s = -1;
			if (gameOver.scale.x < 1) s = 1;
		}
	}
}
package game 
{
	import org.flixel.*;
	import game.*;
	import ui.*;
	import states.*;
	
	public class EndGame extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/UI/msg_complete.png")] private var msg_completed_img:Class;
		[Embed (source = "../../content/graphics/game/UI/messages/msg_finishgame.png")] private var msg_endgame_img:Class;
		[Embed (source = "../../content/graphics/game/UI/btn_back.png")] private var btn_menu_img:Class;
		
		private var background:FlxSprite;
		private var congratulations:FlxSprite;
		private var text:FlxSprite;
		private var btn_returnMenu:Button;
		
		private var timer:FlxTimer;
		
		public function EndGame() 
		{
			FlxG.paused = true;
			Global.ShowPassLevelDialog = true;
			
			background = new FlxSprite(0, 0);
			background.makeGraphic(640, 480, 0x77000000);
			add(background);
			
			congratulations = new FlxSprite(10, 120, msg_completed_img);
			congratulations.antialiasing = true;
			congratulations.scale = new FlxPoint(0.9, 0.9);
			add(congratulations);
			
			text = new FlxSprite(20, 155, msg_endgame_img);
			text.antialiasing = true;
			text.scale = new FlxPoint(0.6, 0.6);
			add(text);
			
			btn_returnMenu = new Button(88, 320, btn_menu_img, onClickReturnMenu);
			add(btn_returnMenu);
			
			add(new MouseCursor());
			
			timer = new FlxTimer();
			timer.start(0.1, 0, onTimer);
		}
		
		override public function destroy():void 
		{
			FlxG.paused = false;
			Global.ShowPassLevelDialog = false;
			super.destroy();
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
package game 
{
	import org.flixel.*;
	import states.Menu;
	import ui.*;
	
	public class PauseDialog extends FlxGroup
	{
		[Embed (source = "../../content/graphics/game/UI/messages/msg_pause.png")] private var pause_img:Class;
		[Embed (source = "../../content/graphics/game/UI/btn_menu.png")] private var btn_resume_img:Class;
		[Embed (source = "../../content/graphics/game/UI/btn_back.png")] private var btn_menu_img:Class;
		
		private var background:FlxSprite;
		private var pauseLogo:FlxSprite;
		private var btn_resume:Button;
		private var btn_returnMenu:Button;
		
		public function PauseDialog()
		{
			super();
			
			exists = false;
			
			background = new FlxSprite(0, 0);
			background.makeGraphic(640, 480, 0x77000000);
			add(background);
			
			pauseLogo = new FlxSprite(125, 160, pause_img);
			add(pauseLogo);
			
			btn_resume = new Button(140, 250, btn_resume_img, onClickResume);
			add(btn_resume);
			
			btn_returnMenu = new Button(90, 300, btn_menu_img, onClickReturnMenu);
			add(btn_returnMenu);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("P") || FlxG.keys.justPressed("ESCAPE"))
				onClickResume();
				
			super.update();
		}
		
		public function ShowDialog():void
		{
			Global.ForcePaused = false;
			FlxG.paused = true;			
			FlxG.keys.reset();
			exists = true;
		}
		
		private function onClickResume():Function
		{
			if (this.exists)
			{
				FlxG.paused = false;
				this.exists = false;
				FlxG.state.add(new ReadyMessage(true));
			}
			return null;
		}
		
		private function onClickReturnMenu():Function
		{
			FlxG.paused = false;
			FlxG.switchState(new Menu() as FlxState);
			this.kill();
			return null;
		}
	}
}
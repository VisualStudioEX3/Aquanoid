package states 
{
	import org.flixel.*;
	import ui.*;
	
	public class Credits extends FlxState
	{	
		[Embed (source = "../../content/graphics/sub_credits.png")] private var credits_img:Class;
		[Embed (source = "../../content/graphics/btn_back.png")] private var btn_back_img:Class;
		[Embed (source = "../../content/graphics/hlp_back.png")] private var btn_back_help_img:Class;
		[Embed (source = "../../content/graphics/logo_undead.png")] private var btn_undeadCode_img:Class;
		
		private var credits:FlxSprite;
		private var btn_back:Button;
		private var txt_back:FlxText;
		private var timer:FlxTimer;
		private var btn_undead:Button;
		
		override public function create():void 
		{			
			super.create();
			
			add(new Background());			
			
			credits = new FlxSprite(10, 20, credits_img);
			add(credits);
			
			var shadowBox:FlxSprite = new FlxSprite(215, FlxG.height - 20);
			shadowBox.makeGraphic(210, 20, 0x77000000);
			add(shadowBox);
			
			add(new FlxSprite(140, FlxG.height - 26, btn_back_help_img));
			
			btn_back = new Button(300 - (50 / 2), FlxG.height - 70, btn_back_img, onClick);
			btn_back.OnOverAngle = 10;
			btn_back.OnOutAngle = 0;
			add(btn_back);
			
			btn_undead = new Button(FlxG.width - 100, FlxG.height - 100, btn_undeadCode_img, btn_UndeadCode_OnClick, 1, 1.3);
			add(btn_undead);
			
			add(new FXSwitch());
			add( new MusicSwitch());
			
			add(new MouseCursor());
			
			timer = new FlxTimer();
			timer.start(0.1, 0, onTimer);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ESCAPE")) 
				onClick();
			super.update();
		}
		
		private function onClick():Function
		{
			FlxG.switchState(new Menu() as FlxState);
			return null;
		}
		
		private function btn_UndeadCode_OnClick():Function
		{
			Global.MoreGames();
			return null;
		}
		
		private var s:int = 1;
		private function onTimer(timer:FlxTimer):void
		{
			btn_back.scale.x += 0.025 * s;
			btn_back.scale.y += 0.025 * s;
			btn_back.angle += 0.05 * s;
			
			if (btn_back.scale.x > 1.025) s = -1;
			if (btn_back.scale.x < 0.8) s = 1;
		}
	}
}
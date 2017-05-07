package states 
{
	import org.flixel.*;
	import states.*;
	import ui.*;	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Menu extends FlxState
	{		
		[Embed (source = "../../content/graphics/menu/btn_play.png")] private var btn_play_img:Class;
		[Embed (source = "../../content/graphics/menu/btn_pass.png")] private var btn_pass_img:Class;
		[Embed (source = "../../content/graphics/menu/btn_help.png")] private var btn_help_img:Class;
		[Embed (source = "../../content/graphics/menu/btn_credits.png")] private var btn_credits_img:Class;
		[Embed (source = "../../content/graphics/logo_undead.png")] private var btn_undeadCode_img:Class;
		
		private var btn_play:Button;
		private var btn_pass:Button;
		private var btn_help:Button;
		private var btn_credits:Button;
		private var btn_undead:Button;
		
		override public function create():void 
		{	
			super.create();
			
            add(new Background());			
            add (new Title());
                    
            btn_play = new Button(200, 230, btn_play_img, btn_play_OnClick);
            btn_play.OnOverAngle = -5;
            btn_play.OnOutAngle = 0;
            add(btn_play);
            
            btn_pass = new Button(200, 230 + (60), btn_pass_img, btn_pass_OnClick);
            btn_pass.OnOverAngle = 5;
            btn_pass.OnOutAngle = 0;
            add(btn_pass);
            
            btn_help = new Button(200, 230 + (60 * 2), btn_help_img, btn_help_OnClick);
            btn_help.OnOverAngle = -5;
            btn_help.OnOutAngle = 0;
            add(btn_help);
            
            btn_credits = new Button(200, 230 + (60 * 3), btn_credits_img, btn_credits_OnClick);
            btn_credits.OnOverAngle = 5;
            btn_credits.OnOutAngle = 0;
            add(btn_credits);
            
            btn_undead = new Button(FlxG.width - 100, FlxG.height - 100, btn_undeadCode_img, btn_UndeadCode_OnClick, 1, 1.3);
            add(btn_undead);
            
            add(new FXSwitch());
            add( new MusicSwitch());
            
            add(new MouseCursor());
            
            MusicJukebox.Play(MusicJukebox.menu_mus);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		private function SiteLock():Boolean
		{
			var ad:URLRequest;
			var url:String = FlxG.stage.loaderInfo.url;
			var urlStart:Number = url.indexOf("://") + 3;		
			var urlEnd:Number = url.indexOf("/", urlStart);
			var domain:String = url.substring(urlStart, urlEnd);
			var LastDot:Number = domain.lastIndexOf(".") - 1;
			var domEnd:Number = domain.lastIndexOf(".", LastDot) + 1;
			
			domain = domain.substring(domEnd, domain.length);
			
			if (domain != "flashgamelicense.com") 
			{
				navigateToURL(new URLRequest("http://twitter.com/UndeadCode"), "_parent");

				return false;
			}
			
			return true;
		}
		
		private function btn_play_OnClick():Function
		{
			Global.Level = 1;
		
			Global.Score = 0;
			Global.Lives = 3;
			Global.ResetLevelStatus();
			FlxG.switchState(new Game() as FlxState);
			return null;
		}
		
		private function btn_pass_OnClick():Function
		{
			FlxG.switchState(new Password() as FlxState);
			return null;
		}
		
		private function btn_help_OnClick():Function
		{
			FlxG.switchState(new Help() as FlxState);
			return null;
		}
		
		private function btn_credits_OnClick():Function
		{
			FlxG.switchState(new Credits() as FlxState);
			return null;
		}
		
		private function btn_UndeadCode_OnClick():Function
		{
			Global.MoreGames();
			return null;
		}
	}
}
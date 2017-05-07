package ui 
{
	import org.flixel.*;
	
	public class FXSwitch extends FlxButton
	{
		[Embed (source = "../../content/graphics/game/ui/btn_fx_off.png")] private var img_off:Class;
		[Embed (source = "../../content/graphics/game/ui/btn_fx_on.png")] private var img_on:Class;
		
		private var _on:FlxSprite;
		private var _off:FlxSprite;
		
		public function FXSwitch() 
		{
			super(640 - 34, 2, null, onClick);
			
			_on = new FlxSprite(x, y, img_off);
			_off = new FlxSprite(x, y, img_on);
			
			onOver = onOverEvent;
			onOut = onOutEvent;
			
			onOutEvent();
			
			width = 32; height = 32;
		}
		
		override public function draw():void 
		{
			if (!Global.fx_active) _on.draw(); else _off.draw();
		}
		
		private function onClick():void
		{
			Global.fx_active = !Global.fx_active;
		}
		
		private function onOverEvent():Function
		{
			_on.alpha = 1;
			_off.alpha = 1;
			return null;
		}
	
		private function onOutEvent():Function
		{
			_on.alpha = 0.8;
			_off.alpha = 0.8;
			return null;
		}
	}
}
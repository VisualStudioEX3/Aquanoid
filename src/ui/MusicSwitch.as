package ui 
{
	import org.flixel.*;
	
	public class MusicSwitch extends FlxButton
	{
		[Embed (source = "../../content/graphics/game/ui/btn_music_off.png")] private var img_off:Class;
		[Embed (source = "../../content/graphics/game/ui/btn_music_on.png")] private var img_on:Class;
		
		private var _on:FlxSprite;
		private var _off:FlxSprite;
		
		public function MusicSwitch() 
		{
			super(640 - 70, 2, null, onClick);

			_on = new FlxSprite(x, y, img_off);
			_off = new FlxSprite(x, y, img_on);
			
			onOver = onOverEvent;
			onOut = onOutEvent;
			
			onOutEvent();
			
			width = 32; height = 32;
		}
		
		override public function draw():void 
		{
			if (!Global.mus_active) _on.draw(); else _off.draw();
		}
		
		private function onClick():void
		{
			Global.mus_active = !Global.mus_active;
			if (Global.mus_active) 
				FlxG.music.volume = 0.7; 
			else 
				FlxG.music.volume = 0;
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
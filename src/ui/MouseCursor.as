package ui 
{
	import org.flixel.*;
	public class MouseCursor extends FlxSprite
	{
		[Embed (source = "../../content/graphics/mouse.png")] private var cursor_img:Class;
		
		public function MouseCursor()
		{
			super(0, 0, cursor_img);
		}		
		
		override public function update():void 
		{
			x = FlxG.mouse.x;
			y = FlxG.mouse.y;
			
			super.update();
		}
	}
}
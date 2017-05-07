package ui 
{
	import org.flixel.*;
	
	public class Background extends FlxSprite
	{
		[Embed (source = "../../content/graphics/bg_mainmenu.jpg")] private var bg_img:Class;
		
		public function Background() 
		{
			super(0, 0, bg_img);
			setOriginToCorner();
		}		
	}

}
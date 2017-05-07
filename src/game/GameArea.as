package game
{
	import org.flixel.*;
	
	public class GameArea extends FlxGroup
	{
		internal const width:int = 384;
		
		public var left:FlxSprite;
		public var top:FlxSprite;
		public var right:FlxSprite;
		public var bottom:FlxSprite;
		
		public function GameArea() 
		{
			left = new FlxSprite(0, 0);
			left.makeGraphic(16, FlxG.height, 0xffffffff);
			left.immovable = true;
			add(left);
			
			top = new FlxSprite(16, 0);
			top.makeGraphic(width, 16, 0xffffffff);
			top.immovable = true;
			add(top);
			
			right = new FlxSprite(width + 16, 0);
			right.makeGraphic(16, FlxG.height, 0xffffffff);
			right.immovable = true;
			add(right);
		}
		
		override public function destroy():void 
		{
			remove(left);
			remove(top);
			remove(right);
			
			super.destroy();
		}
		
		override public function update():void 
		{
			left.update();
			top.update();
			right.update();
			
			super.update();
		}
		
		override public function draw():void 
		{
			left.draw();
			top.draw();
			right.draw();
			
			super.draw();
		}
	}
}
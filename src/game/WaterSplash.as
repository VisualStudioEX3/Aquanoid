package game 
{
	import org.flixel.*;
	
	public class WaterSplash extends FlxSprite
	{		
		[Embed (source = "../../content/graphics/game/water_splash.png")] private var watersplash_img:Class;
		[Embed (source = "../../content/audio/sounds/game/splash.mp3")] private var splash_snd:Class;
		
		public function WaterSplash(x:uint, y:uint) 
		{
			if (Global.fx_active) FlxG.play(splash_snd);
			
			super(x, y, null);
			this.loadGraphic(watersplash_img, true, false);
			this.frames = 4;
			this.frameWidth = 59;
			this.frameHeight = 49;
			this.frame = 0;
			this.addAnimation("splash", new Array(0, 1, 2, 3), 12, false);
			this.play("splash");
		}
		
		override public function update():void 
		{
			if (this.finished) this.kill();
			super.update();
		}
	}
}
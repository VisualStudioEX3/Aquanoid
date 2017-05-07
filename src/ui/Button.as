package ui 
{
	import org.flixel.*;
	
	public class Button extends FlxButton
	{
		[Embed (source = "../../content/audio/sounds/ui/mouse_click.mp3")] private var click_snd:Class;
		
		public var OnOverAngle:Number = 0;
		public var OnOutAngle:Number = 0;
		public var OnOverScale:Number = 1;
		public var OnOutScale:Number = 0.7;
		
		private var _onClickEvent:Function;
		
		public function Button(x:uint, y:uint, graphic:Class, onClickEvent:Function, onOutScale:Number = 0.7, onOverScale:Number = 1) 
		{
			super(x, y, null, onClickEvent);
			loadGraphic(graphic, false, false);
			width /= 1.25;
			height /= 1.25;
			centerOffsets();
			antialiasing = true;
			btn_OnOut();		
			_onClickEvent = onClickEvent;
			onOver = btn_OnOver;
			onOut = btn_OnOut;
			onDown = btn_OnDown;
			onUp = btn_OnUp;
			OnOutScale = onOutScale;
			OnOverScale = onOverScale;
			scale = new FlxPoint(onOutScale, onOutScale);
		}
		
		override public function draw():void 
		{			
			if (active) 
				alpha = 1; 
			else 
			{
				alpha = 0.5;
				btn_OnOut();
			}
				
			super.draw();
		}
		
		private function btn_OnDown():Function
		{
			if (active)
			{
				scale.x = OnOutScale;
				scale.y = OnOutScale;
				if (Global.fx_active) FlxG.play(click_snd);
			}
			return null;
		}
		
		private function btn_OnUp():Function
		{
			if (active)
			{
				scale.x = OnOverScale;
				scale.y = OnOverScale;
			
				_onClickEvent.call();
			}
			return null;
		}
		
		private function btn_OnOver():Function
		{
			if (active)
			{
				scale.x = OnOverScale;
				scale.y = OnOverScale;
				angle = OnOverAngle;				
			}
			return null;
		}
		
		private function btn_OnOut():Function
		{
			scale.x = OnOutScale;
			scale.y = OnOutScale;
			angle = OnOutAngle;
			return null;
		}
	}
}
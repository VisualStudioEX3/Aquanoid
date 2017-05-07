package game
{
	import org.flixel.*;
	
	public class Pad extends FlxGroup
	{
		private const sideWidth:int = 16;
		
		private const maxWidth:uint = 128;
		private const defaultWidth:uint = 96;
		private const minWidth:uint = 48;
		
		private var body:FlxSprite;
		
		[Embed (source = "../../content/graphics/game/lat_palette.png")] private var lat_palette_img:Class;
		[Embed (source = "../../content/graphics/game/body_palette.png")] private var body_img:Class;
		[Embed (source = "../../content/graphics/game/anim_lat_palette.png")] private var anim_lat_palette_img:Class;
		
		private var Center:FlxSprite;
		private var LeftSide:FlxSprite;
		private var RightSide:FlxSprite;
		
		private var DeathLeftSide:FlxSprite;
		private var DeathRightSide:FlxSprite;
		
		private var timerEvent:FlxTimer;
		
		public var Bounds:FlxRect;
		
		public var y:uint;
		
		public function Pad()
		{
			body = new FlxSprite(200, FlxG.height - 28);
			body.visible = false;
			body.maxVelocity.x = 300;
			body.maxVelocity.y = 0;
			body.acceleration.y = 10;
			body.drag.x = body.maxVelocity.x * 4;
			body.width = defaultWidth;
			body.height = 28;
			add(body);
			
			Center = new FlxSprite(body.x + 16, body.y);
			Center.loadGraphic(body_img, false, false, 16, 28);
			Center.solid = false;
			Center.setOriginToCorner();
			Center.scale.x = 4;
			add(Center);
			
			LeftSide = new FlxSprite(body.x - sideWidth, body.y, lat_palette_img);
			LeftSide.solid = false;
			add(LeftSide);
			
			RightSide = new FlxSprite(body.x + body.width, body.y, lat_palette_img);
			RightSide.scale.x = -1;
			RightSide.solid = false;
			add(RightSide);
			
			DeathLeftSide = new FlxSprite(body.x - sideWidth, body.y);
			DeathLeftSide.loadGraphic(anim_lat_palette_img, true, false, 16, 28);
			DeathLeftSide.frameWidth = 16;
			DeathLeftSide.frameHeight = 28;
			DeathLeftSide.frames = 4;
			DeathLeftSide.addAnimation("death", new Array(0, 1, 2, 3), 10, false);
			DeathLeftSide.solid = false;
			DeathLeftSide.exists = false;
			add(DeathLeftSide);
			
			DeathRightSide = new FlxSprite(body.x + body.width, body.y);
			DeathRightSide.loadGraphic(anim_lat_palette_img, true, false, 16, 28);
			DeathRightSide.frameWidth = 16;
			DeathRightSide.frameHeight = 28;
			DeathRightSide.frames = 4;
			DeathRightSide.addAnimation("death", new Array(0, 1, 2, 3), 10, false);
			DeathRightSide.scale.x = -1;
			DeathRightSide.solid = false;
			DeathRightSide.exists = false;
			add(DeathRightSide);
			
			Bounds = new FlxRect();
			
			timerEvent = new FlxTimer();
			
			Global.PlayerDead = false;
		}
		
		override public function destroy():void 
		{
			remove(LeftSide);
			remove(Center);
			remove(RightSide);
			
			remove(body);
			
			super.destroy();
		}
		
		override public function update():void 
		{
			body.acceleration.x = 0;
			if (!FlxG.paused)
			{
				if (!Global.PlayerDead)
				{
					if (FlxG.keys.LEFT)
						body.acceleration.x = -body.maxVelocity.x * 4;
					else if (FlxG.keys.RIGHT)
						body.acceleration.x = body.maxVelocity.x * 4;
				}
				
				if (Global.water != null) body.y = Global.water.y - 8;
				
				Center.x = body.x + sideWidth; Center.y = body.y;
				LeftSide.x = body.x; LeftSide.y = body.y;
				RightSide.x = body.x + body.width - sideWidth; RightSide.y = body.y;
				DeathLeftSide.x = LeftSide.x; DeathLeftSide.y = LeftSide.y;
				DeathRightSide.x = RightSide.x; DeathRightSide.y = RightSide.y;
				
				super.update();
				
				Bounds.x = body.x;
				Bounds.y = body.y;
				Bounds.width = body.width;
				Bounds.height = body.height;				
			}
		}
		
		public function ScaleUp():void
		{
			if (this.body.width <= defaultWidth)
			{
				SoundFXLib.Play(SoundFXLib.scaleUpPad);
				
				if (this.body.width == defaultWidth)
					timerEvent.start(0.1, 0, onDoubleSizing);
				else
					timerEvent.start(0.1, 0, onMinToDefaultSizing);
			}
		}
		
		public function ScaleDown():void
		{
			if (this.body.width >= defaultWidth)
			{
				SoundFXLib.Play(SoundFXLib.scaleDownPad);
				
				if (this.body.width == defaultWidth)
					timerEvent.start(0.1, 0, onHalfSizing);
				else
					timerEvent.start(0.1, 0, onDoubleToDefaultSizing);
			}
		}
		
		public function KillMe():void
		{
			SoundFXLib.Play(SoundFXLib.deadPad);
			timerEvent.start(0.1, 0, onDestroyPalette);
		}
		
		private function onDoubleSizing(timer:FlxTimer):void
		{
			if (this.body.width >= maxWidth)
			{
				timerEvent.stop();
			}
			else
			{
				this.body.width += 16;
				this.Center.scale.x++;
				
				if ((this.body.width + this.body.x) > 384) this.body.x -= (this.body.width + this.body.x) - 384 - 16;
			}
		}
		
		private function onMinToDefaultSizing(timer:FlxTimer):void
		{
			if (this.body.width >= defaultWidth)
			{
				timerEvent.stop();
			}
			else
			{
				this.body.width += 16;
				this.Center.scale.x++;
				
				if ((this.body.width + this.body.x) > 384) this.body.x -= (this.body.width + this.body.x) - 384 - 16;
			}
		}
		
		private function onHalfSizing(timer:FlxTimer):void
		{
			if (this.body.width <= minWidth)
			{
				timerEvent.stop();
			}
			else
			{
				this.body.width -= 16;
				this.Center.scale.x--;
			}
		}
		
		private function onDoubleToDefaultSizing(timer:FlxTimer):void
		{
			if (this.body.width <= defaultWidth)
			{
				timerEvent.stop();
			}
			else
			{
				this.body.width -= 16;
				this.Center.scale.x--;
			}
		}
		
		private function onDestroyPalette(timer:FlxTimer):void
		{
			if (this.body.width == sideWidth * 2)
			{
				if (!DeathLeftSide.exists)
				{					
					LeftSide.visible = false;
					RightSide.visible = false;
					Center.visible = false;
					DeathLeftSide.exists = true; DeathLeftSide.play("death");
					DeathRightSide.exists = true; DeathRightSide.play("death");
				}		
				
				if (DeathLeftSide.finished) 
				{
					DeathLeftSide.visible = false;
					DeathRightSide.visible = false;
					timerEvent.stop();
				}
			}
			else
			{
				this.body.width -= 16;
				this.Center.scale.x--;
			}
		}
	}
}
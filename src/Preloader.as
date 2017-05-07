package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shader;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.flixel.system.FlxPreloader;
	import org.flixel.FlxU;
	
	import mochi.as3.*;
	
	public dynamic class Preloader extends FlxPreloader
	{
		[Embed (source = "../content/graphics/splash/Splash.jpg")] private var bg_img:Class;
		[Embed (source = "../content/graphics/splash/loading.png")] private var loading_img:Class;
		
		private var loading:Bitmap;
		private var _bgBar:Bitmap;
		private var _progressBar:Bitmap;
		
		public function Preloader():void
		{
			if (SiteLock.CheckDomain(stage.loaderInfo.url, "visualstudioex3.com", "http://portfolio.visualstudioex3.com/2011/11/03/aquanoid/")) 
			{
				className = "Aquanoid";
				super();
			}
		}
		
		override protected function create():void 
		{
			_buffer = new Sprite();
			addChild(_buffer);
			
			_buffer.addChild(new Bitmap((new bg_img).bitmapData));
			
			loading = new Bitmap((new loading_img).bitmapData);
			loading.x = 260;
			loading.y = 350;
			loading.scaleX = 1;
			loading.scaleY = 1;
			loading.smoothing = true;
			_buffer.addChild(loading);
			
			_bgBar = new Bitmap(new BitmapData(1,7,false,0xffffff));
			_bgBar.x = 157;
			_bgBar.y = 397;
			_bgBar.width = 326;
			_bgBar.height = 38;
			_buffer.addChild(_bgBar);
			
			_bgBar = new Bitmap(new BitmapData(1,7,false,0x5f6aff));
			_bgBar.x = 158;
			_bgBar.y = 398;
			_bgBar.width = 324;
			_bgBar.height = 36;
			_buffer.addChild(_bgBar);
			
			_progressBar = new Bitmap(new BitmapData(1,7,false,0xffffff));
			_progressBar.x = 160;
			_progressBar.y = 400;
			_progressBar.width = 320;
			_progressBar.height = 32;
			_buffer.addChild(_progressBar);
			
			MochiAd.showPreGameAd({clip:this, id:"58186328031266d6", res:"640x480"});
		}
		
		override protected function update(Percent:Number):void 
		{
			_progressBar.width = 320 * Percent;
			super.update(Percent);
		}
	}
}
package  
{	
	import org.flixel.*;
	import game.*;
	import states.*;	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;	
	
	public class Global 
	{
		public static var Score:uint = 0;
		public static var Lives:uint = 3;
		public static var Level:uint = 1;
		
		public static var PlayerDead:Boolean = false;
		public static var ShowPassLevelDialog:Boolean = false;
		
		public static var ForcePaused:Boolean = false;
		
		public static var pad:Pad;
		public static var water:Water;
		public static var ui:UI;
		public static var Bubbles:FlxGroup;
		
		public static var lastItem:uint = -1;
		
		public static var makeItem:uint = 0;
		public static var extraLifeCounter:uint = 0;
		
		public static var BallMaxSpeed:uint = 100;
		public static var StopBall:Boolean = true;
		public static var PreStopBall:Boolean = false;
		public static var Balls:uint = 0;
		public static var Bricks:uint = 0;
		
		public static var fx_active:Boolean = true;
		public static var mus_active:Boolean = true;
		
		public static var LevelStatus:Array = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		);
		
		public static function ResetLevelStatus():void
		{
			LevelStatus = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			);
		}
		
		public static function MoreGames():void
		{
			navigateToURL(new URLRequest("http://undeadcodestudios.com"), "_blank");
		}
		
		public static function GetRealRandom():uint
		{
			var time:Date = new Date();
			var milliseconds:String = time.getMilliseconds().toString();
			return uint(milliseconds.charAt(milliseconds.length-1));
		}
	}
}
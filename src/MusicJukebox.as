package  
{
	import org.flixel.*;
	
	public class MusicJukebox 
	{
		[Embed (source = "../content/audio/music/B-Roll_64.mp3")] public static var menu_mus:Class;
		[Embed (source = "../content/audio/music/B-Roll (ska)_64.mp3")] public static var inGame_mus:Class;
				
		private static var musicPlaying:Class;
		public static function Play(music:Class):void
		{
			if (music != musicPlaying && Global.mus_active)
			{
				musicPlaying = music;
				FlxG.playMusic(musicPlaying, 0.7);
			}
		}
	}

}
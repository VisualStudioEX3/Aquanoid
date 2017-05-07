package  
{
	import org.flixel.*;
	
	public class Levels 
	{
		public static var list:Array = new Array(
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level(),
												new Level()												
		)
		
		public static function SetLevels():void
		{
			var level:Level;
			
			// 1:
			level = list[0];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0,
				0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0,
				0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
				0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
				0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
				0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			);
			level.Password = "46187";
			
			// 2:
			level = list[1];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0,
				0, 0, 2, 3, 2, 0, 0, 2, 3, 2, 0, 0,
				0, 0, 1, 3, 1, 0, 0, 1, 3, 1, 0, 0,
				0, 0, 2, 3, 2, 7, 7, 2, 3, 2, 0, 0,
				0, 0, 1, 3, 1, 0, 0, 1, 3, 1, 0, 0,
				0, 0, 2, 3, 2, 0, 0, 2, 3, 2, 0, 0,
				0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0
			);
			level.Password = "70021";
			
			// 3:
			level = list[2];
			level.Bricks = new Array(
				0, 0, 0, 3, 4, 3, 4, 3, 4, 3, 4, 3,
				0, 0, 0, 3, 4, 3, 4, 3, 4, 3, 4, 3,
				0, 0, 0, 3, 4, 3, 4, 3, 4, 3, 4, 3,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0,
				2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0
			);
			level.Password = "68532";
			
			// 4:
			level = list[3];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
				2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
				2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
				4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0,
				7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0
			);
			level.Password = "21256";
			
			// 5:
			level = list[4];
			level.Bricks = new Array(
				6, 6, 6, 6, 0, 0, 0, 0, 6, 6, 6, 6,
				5, 5, 5, 5, 0, 0, 0, 0, 5, 5, 5, 5,
				3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3,
				3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3,
				3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3,
				3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3,
				1, 1, 1, 1, 0, 7, 7, 0, 1, 1, 1, 1,
				1, 1, 1, 1, 7, 0, 0, 7, 1, 1, 1, 1,
				7, 7, 7, 7, 0, 0, 0, 0, 7, 7, 7, 7
				);
			level.Password = "84222";
			
			// 6:
			level = list[5];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 3, 6, 6, 6, 6, 3, 0, 0, 0,
				0, 0, 0, 3, 6, 6, 6, 6, 3, 0, 0, 0,
				0, 0, 0, 3, 6, 6, 6, 6, 3, 0, 0, 0,
				0, 0, 0, 3, 6, 6, 6, 6, 3, 0, 0, 0,
				0, 0, 0, 3, 3, 3, 3, 3, 3, 0, 0, 0,
				0, 0, 0, 3, 3, 7, 7, 7, 3, 0, 0, 0,
				0, 0, 0, 3, 3, 7, 3, 7, 3, 0, 0, 0,
				8, 8, 0, 3, 3, 7, 7, 7, 3, 0, 8, 8
			);
			level.Password = "50505";
			
			// 7:
			level = list[6];
			level.Bricks = new Array(
				0, 0, 7, 6, 5, 6, 5, 6, 5, 7, 0, 0,
				0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				8, 8, 1, 3, 1, 3, 1, 3, 1, 3, 8, 8,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
				0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0
			);
			level.Password = "12188";
			
			// 8:
			level = list[7];
			level.Bricks = new Array(
				5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
				5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
				0, 0, 0, 8, 8, 8, 8, 8, 8, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 6, 6, 6, 6, 0, 0, 0, 0,
				0, 0, 0, 0, 8, 8, 8, 8, 0, 0, 0, 0
			);
			level.Password = "13685";
			
			// 9:
			level = list[8];
			level.Bricks = new Array(
				0, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 0,
				0, 0, 0, 5, 5, 5, 5, 5, 5, 0, 0, 0,
				0, 0, 0, 0, 8, 8, 8, 8, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0,
				2, 2, 2, 0, 0, 2, 1, 0, 0, 2, 2, 2,
				8, 8, 8, 0, 0, 1, 2, 0, 0, 8, 8, 8,
				1, 1, 1, 0, 0, 2, 1, 0, 0, 1, 1, 1,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			);
			level.Password = "38351";
			
			// 10:
			level = list[9];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				3, 3, 3, 3, 1, 1, 0, 1, 1, 5, 5, 5,
				7, 7, 7, 7, 2, 2, 0, 2, 2, 7, 7, 7,
				3, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 5,
				3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 5, 5,
				7, 7, 7, 0, 0, 1, 1, 1, 0, 0, 7, 7,
				3, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 5,
				3, 3, 3, 3, 1, 1, 0, 1, 1, 5, 5, 5,
				7, 7, 7, 7, 2, 2, 0, 2, 2, 7, 7, 7
			);
			level.Password = "66623";
			
			// 11:
			level = list[10];
			level.Bricks = new Array(
				1, 4, 1, 4, 1, 0, 0, 1, 4, 1, 4, 1,
				4, 1, 4, 1, 4, 0, 0, 4, 1, 4, 1, 4,
				1, 4, 1, 4, 1, 0, 0, 1, 4, 1, 4, 1,
				4, 1, 4, 1, 4, 0, 0, 4, 1, 4, 1, 4,
				8, 8, 8, 8, 8, 0, 0, 8, 8, 8, 8, 8,
				2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			);
			level.Password = "35453";
			
			// 12:
			level = list[11];
			level.Bricks = new Array(
				6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 0, 0,
				2, 2, 2, 2, 2, 2, 2, 8, 8, 0, 0, 0,
				5, 5, 5, 5, 5, 8, 8, 0, 0, 0, 0, 0,
				5, 5, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0,
				8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 4, 4,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3,
				0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2
			);
			level.Password = "09984";
			
			// 13:
			level = list[12];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				7, 7, 7, 0, 7, 7, 7, 7, 0, 7, 7, 7,
				3, 3, 3, 0, 2, 2, 2, 2, 0, 3, 3, 3,
				3, 3, 3, 0, 2, 2, 2, 2, 0, 3, 3, 3,
				7, 7, 7, 0, 8, 8, 8, 8, 0, 7, 7, 7,
				3, 3, 3, 0, 1, 1, 1, 1, 0, 3, 3, 3,
				3, 3, 3, 0, 1, 1, 1, 1, 0, 3, 3, 3,
				7, 7, 7, 0, 7, 7, 7, 7, 0, 7, 7, 7
			);
			level.Password = "78698";
			
			// 14:
			level = list[13];
			level.Bricks = new Array(
				5, 5, 5, 5, 0, 0, 0, 0, 5, 5, 5, 5,
				3, 3, 3, 3, 0, 0, 0, 0, 3, 3, 3, 3,
				7, 7, 7, 7, 0, 0, 0, 0, 7, 7, 7, 7,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 8, 8, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 8, 8, 0, 0, 0, 0, 1,
				1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
				1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
				8, 8, 8, 0, 0, 0, 0, 0, 0, 8, 8, 8
			);
			level.Password = "98645";
			
			// 15:
			level = list[14];
			level.Bricks = new Array(
				3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 3, 3,
				3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 3, 3,
				5, 5, 5, 0, 0, 0, 0, 0, 0, 5, 5, 5,
				0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0,
				0, 0, 0, 1, 2, 4, 4, 2, 1, 0, 0, 0,
				0, 0, 1, 2, 4, 4, 4, 4, 2, 1, 0, 0,
				0, 0, 2, 4, 4, 4, 4, 4, 4, 2, 0, 0,
				7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7
			);
			level.Password = "73552";
			
			// 16:
			level = list[15];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				8, 8, 8, 0, 7, 7, 7, 7, 0, 8, 8, 8,
				3, 3, 3, 0, 2, 2, 2, 2, 0, 3, 3, 3,
				3, 3, 3, 0, 2, 2, 2, 2, 0, 3, 3, 3,
				7, 7, 7, 0, 7, 7, 7, 7, 0, 7, 7, 7,
				3, 3, 3, 0, 1, 1, 1, 1, 0, 3, 3, 3,
				3, 3, 3, 0, 1, 1, 1, 1, 0, 3, 3, 3,
				7, 7, 7, 0, 8, 8, 8, 8, 0, 7, 7, 7					
			);
			level.Password = "06841";
			
			// 17:
			level = list[16];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6,
				2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2,
				4, 4, 4, 4, 4, 0, 0, 4, 4, 4, 4, 4,
				8, 8, 8, 8, 8, 0, 0, 8, 8, 8, 8, 8,
				3, 3, 3, 3, 3, 0, 0, 3, 3, 3, 3, 3,
				2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2,
				1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1				
			);
			level.Password = "58413";
			
			// 18:
			level = list[17];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 1, 6, 6, 6, 6, 6, 6, 1, 0, 0,
				0, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 0,
				0, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 0,
				0, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7
			);
			level.Password = "29756";
			
			// 19:
			level = list[18];
			level.Bricks = new Array(
				8, 8, 8, 0, 0, 7, 7, 0, 0, 8, 8, 8,
				8, 8, 0, 0, 7, 4, 4, 7, 0, 0, 8, 8,
				8, 0, 0, 7, 3, 3, 3, 3, 7, 0, 0, 8,
				0, 0, 7, 4, 4, 4, 4, 4, 4, 7, 0, 0,
				0, 0, 7, 3, 3, 3, 3, 3, 3, 7, 0, 0,
				0, 0, 7, 4, 4, 4, 4, 4, 4, 7, 0, 0,
				8, 0, 0, 7, 3, 3, 3, 3, 7, 0, 0, 8,
				8, 8, 0, 0, 7, 4, 4, 7, 0, 0, 8, 8,
				8, 8, 8, 0, 0, 7, 7, 0, 0, 8, 8, 8
			);
			level.Password = "67851";
			
			// 20:
			level = list[19];
			level.Bricks = new Array(
				3, 3, 3, 8, 4, 4, 4, 4, 8, 3, 3, 3,
				3, 3, 3, 8, 4, 4, 4, 4, 8, 3, 3, 3,
				2, 2, 2, 8, 2, 2, 2, 2, 8, 2, 2, 2,
				2, 2, 2, 8, 1, 1, 1, 1, 8, 2, 2, 2,
				1, 1, 1, 8, 0, 0, 0, 0, 8, 1, 1, 1,
				1, 1, 1, 8, 0, 0, 0, 0, 8, 1, 1, 1,
				0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0,
				0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 0, 0,
				7, 7, 7, 8, 0, 0, 0, 0, 8, 7, 7, 7
			);
			level.Password = "05480";
			
			// 21:
			level = list[20];
			level.Bricks = new Array(
				6, 5, 6, 5, 6, 5, 6, 5, 6, 5, 6, 5,
				5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8,
				0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0
			);
			level.Password = "94521";
			
			// 22:
			level = list[21];
			level.Bricks = new Array(
				0, 0, 0, 0, 8, 8, 8, 8, 0, 0, 0, 0,
				0, 0, 8, 8, 3, 3, 3, 3, 8, 8, 0, 0,
				0, 8, 3, 3, 3, 3, 3, 3, 3, 3, 8, 0,
				0, 8, 3, 6, 6, 3, 3, 6, 6, 3, 8, 0,
				0, 8, 3, 6, 6, 3, 3, 6, 6, 3, 8, 0,
				0, 8, 8, 3, 3, 3, 3, 3, 3, 8, 8, 0,
				0, 0, 8, 3, 3, 6, 6, 3, 3, 8, 0, 0,
				0, 0, 8, 3, 3, 3, 3, 3, 3, 8, 0, 0,
				0, 0, 8, 0, 3, 0, 0, 3, 0, 8, 0, 0
			);
			level.Password = "28461";
			
			// 23:
			level = list[22];
			level.Bricks = new Array(
				4, 4, 4, 7, 0, 0, 0, 0, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 0, 0, 0, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 1, 1, 1, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 1, 1, 1, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 8, 8, 0, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 0, 0, 0, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 0, 0, 0, 7, 4, 4, 4,
				4, 4, 4, 7, 0, 0, 0, 0, 7, 4, 4, 4,
				8, 8, 8, 8, 0, 0, 0, 0, 8, 8, 8, 8
			);
			level.Password = "18657";
			
			// 24:
			level = list[23];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				2, 7, 7, 2, 7, 7, 2, 2, 2, 7, 2, 7,
				7, 2, 2, 8, 7, 2, 7, 2, 2, 7, 2, 7,
				2, 7, 2, 2, 7, 2, 7, 8, 2, 2, 7, 2,
				2, 2, 7, 8, 7, 7, 8, 0, 8, 2, 7, 2,
				2, 2, 7, 8, 7, 2, 8, 0, 8, 7, 2, 7,
				7, 7, 2, 8, 7, 2, 2, 8, 2, 7, 2, 7,
				2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			);
			level.Password = "51708";
			
			// 25:
			level = list[24];
			level.Bricks = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 8, 1, 1, 1, 1, 1, 1, 1, 1, 8, 0,
				0, 8, 0, 8, 8, 8, 8, 8, 8, 0, 8, 0,
				0, 8, 0, 8, 3, 3, 3, 3, 8, 0, 8, 0,
				0, 8, 0, 8, 2, 2, 2, 2, 8, 0, 8, 0,
				0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0,
				0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0,
				0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0
			);
			level.Password = "64578";
			
			// 26:
			level = list[25];
			level.Bricks = new Array(
				4, 4, 4, 4, 4, 0, 0, 4, 4, 4, 4, 4,
				2, 2, 2, 2, 2, 8, 8, 2, 2, 2, 2, 2,
				6, 6, 6, 6, 6, 8, 8, 6, 6, 6, 6, 6,
				2, 2, 2, 2, 2, 0, 0, 2, 2, 2, 2, 2,
				4, 4, 4, 4, 4, 0, 0, 4, 4, 4, 4, 4,
				8, 8, 8, 8, 8, 0, 0, 8, 8, 8, 8, 8,
				3, 3, 3, 3, 8, 0, 0, 8, 3, 3, 3, 3,
				2, 2, 2, 2, 8, 0, 0, 8, 2, 2, 2, 2,
				1, 1, 1, 1, 8, 0, 0, 8, 1, 1, 1, 1
			);
			level.Password = "84635";
			
			// 27:
			level = list[26];
			level.Bricks = new Array(
				5, 5, 5, 5, 4, 4, 4, 4, 5, 5, 5, 5,
				3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
				8, 8, 8, 8, 2, 2, 2, 2, 8, 8, 8, 8,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 8, 8, 8, 8, 0, 0, 0, 1,
				1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
				1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
				8, 8, 8, 8, 0, 0, 0, 0, 8, 8, 8, 8
			);
			level.Password = "87158";
			
			// 28:
			level = list[27];
			level.Bricks = new Array(
				4, 6, 8, 0, 0, 5, 5, 0, 0, 8, 6, 4,
				4, 6, 8, 0, 0, 5, 5, 0, 0, 8, 6, 4,
				4, 6, 8, 0, 0, 5, 5, 0, 0, 8, 6, 4,
				4, 6, 8, 5, 5, 8, 8, 5, 5, 8, 6, 4,
				0, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 0,
				0, 7, 8, 0, 0, 0, 0, 0, 0, 8, 7, 0,
				0, 0, 8, 0, 0, 0, 0, 0, 0, 8, 0, 0,
				0, 0, 8, 0, 0, 0, 0, 0, 0, 8, 0, 0,
				0, 0, 8, 0, 0, 0, 0, 0, 0, 8, 0, 0
			);
			level.Password = "92745";
			
			// 29:
			level = list[28];
			level.Bricks = new Array(
				5, 5, 5, 0, 0, 6, 6, 0, 0, 5, 5, 5,
				5, 5, 5, 0, 0, 6, 6, 0, 0, 5, 5, 5,
				8, 8, 8, 0, 0, 8, 8, 0, 0, 8, 8, 8,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 4, 4, 4, 0, 0, 4, 4, 4, 0, 0,
				0, 0, 8, 8, 8, 7, 7, 8, 8, 8, 0, 0,
				0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0,
				8, 8, 8, 0, 0, 8, 8, 0, 0, 8, 8, 8
			);
			level.Password = "44456";
			
			// 30:
			level = list[29];
			level.Bricks = new Array(
				6, 6, 1, 1, 1, 8, 8, 1, 1, 1, 6, 6,
				7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				5, 5, 5, 8, 8, 3, 3, 8, 8, 5, 5, 5,
				5, 5, 5, 8, 3, 3, 3, 3, 8, 5, 5, 5,
				5, 5, 5, 8, 2, 2, 2, 2, 8, 5, 5, 5,
				7, 7, 7, 8, 1, 1, 1, 1, 8, 7, 7, 7,
				8, 8, 8, 8, 8, 1, 1, 8, 8, 8, 8, 8,
				8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8
			);
			level.Password = "78646";
			
		}		
		
		public static function GetIndexFromPassword(password:String):int
		{
			var level:Level;
			var i:uint = 1;
			
			for each (level in list)
			{
				if (level.Password == password)	return i++;
				i++;
			}
			
			return -1;
		}
	}
}
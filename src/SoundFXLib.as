package  
{
	import sfxr.*;
	
	public class SoundFXLib 
	{
		public static const goldBounce:String = "2,,0.1486,0.0132,0.2856,0.7837,,0.0282,-0.0375,0.0008,-0.4952,0.0725,0.7074,,-0.3751,,-0.1867,0.0835,0.7635,-0.0456,-0.3529,0.0474,-0.0549,0.5";
		public static const normalBounce:String = "1,0.0008,0.5102,0.0041,0.1406,0.9518,,-0.4984,-0.001,0.8829,,0.8139,,0.2675,0.095,,-0.4082,0.0128,0.1244,-0.0884,0.5026,0.1482,-0.5061,0.5";
		public static const breakBounce:String = "1,,0.0364,,0.1435,0.3944,,-0.6775,,,,,,,,,,,1,,,0.0062,,0.5";
		public static const scaleUpPad:String = "3,0.1539,0.0896,0.1035,0.7263,0.5863,0.0027,-0.0796,-0.2889,0.0689,0.1117,0.0364,0.1932,0.0119,0.848,0.7061,-0.0354,0.1301,0.4628,0.0573,0.0182,0.6522,-0.0421,0.5";
		public static const scaleDownPad:String = "3,,0.01,0.21,0.5,0.85,,,,-0.0362,0.0526,-0.312,,0.8794,-0.0092,0.5365,-0.2821,-0.0002,0.668,0.9483,,,0.001,0.5";
		public static const deadPad:String = "3,0.0352,0.029,0.6062,0.4196,0.5,,0.7849,-0.8862,0.8028,0.3492,0.5061,,0.6594,0.271,,-0.8689,-0.0001,0.2639,-0.0426,-0.863,0.1282,-0.0203,0.28";
		public static const tripleBall:String = "3,0.0552,0.3487,0.2018,0.8026,0.0805,,0.4833,0.0012,0.02,0.907,-0.0681,,,0.1969,,0.0091,0.0344,0.6971,-0.0577,0.9043,0.048,0.5379,0.28";
		public static const slowBall:String = "2,0.1082,0.4454,0.0071,0.0128,0.0967,,0.1272,-0.0258,,0.5687,0.524,0.4215,0.9433,-0.1394,,-0.6661,-0.6675,0.9974,-0.0195,,,0.0352,0.28";
		
		private static var synth:SfxrSynth = new SfxrSynth();
		
		public static function Play(data:String, mutated:Boolean=false):void
		{
			if (Global.fx_active) 
			{
				synth.params.setSettingsString(data);
				if (mutated) synth.playMutated(0.025); else synth.play();
			}
		}
	}

}
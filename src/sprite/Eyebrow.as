package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Eyebrow extends FlxSprite 
	{
		private var WHICH:int;
		[Embed(source = "../sprite/assets/Eyebrows.png")] private var browPNG:Class;
		public function Eyebrow(WHICH:int,X:Number=0, Y:Number=0) 
		{
			this.WHICH = WHICH;
			super(X, Y);
			loadGraphic(browPNG, true, false, 29, 30 , true);
			addAnimation("leftidle", [0], 0, false);
			addAnimation("rightidle", [1], 0, false);	
			
			if (WHICH == 0)
			play("leftidle");
			else
			play("rightidle")
		}
		
	}

}
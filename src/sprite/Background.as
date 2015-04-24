package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Background extends FlxSprite 
	{
			[Embed(source = "../sprite/assets/Space.png")] private var bgPNG:Class;
		public function Background(X:Number=0, Y:Number=0) 
		{
		
			
			super(X, Y);
			loadGraphic(bgPNG, true, true, 500, 500, false);
		
			
		
		}
		
	}

}
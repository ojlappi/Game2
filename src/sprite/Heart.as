package sprite 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Heart extends FlxSprite 
	{
		public var full:Boolean = true;
		public var 	absolutePoint;
			[Embed(source = "../sprite/assets/Heart.png")] private var heartPNG:Class;
		public function Heart(X:Number,Y:Number ) 
		{
			super(X, Y);
			absolutePoint = new FlxPoint(X, Y);
			loadGraphic(heartPNG, true, true, 20, 20, false);
			addAnimation("full", [0], 0, false);
			addAnimation("empty", [1], 0, false);
		}
		
		
	}

}
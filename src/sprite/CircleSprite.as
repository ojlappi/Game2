package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class CircleSprite extends FlxSprite 
	{
		[Embed(source = "../sprite/assets/Circle.png")] private var CirclePNG:Class;
		public function CircleSprite(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(CirclePNG,true, false, 297,297 , true);
			addAnimation("idle", [0], 0, false);
			addAnimation("flip", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,0], 20, false);
		}
			override public function update():void {
				if (finished)
				play("idle");
			}
	}

}
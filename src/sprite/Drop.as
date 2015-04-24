package sprite 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Drop extends FlxSprite 
	{
		
		private var splash:Boolean;
		[Embed(source = "../sprite/assets/Drop.png")] private var dropPNG:Class;
		public function Drop(X:Number, Y:Number)
		{
			width = 15;
			height = 15;
			super(X-width/2, Y-height/2);
			loadGraphic(dropPNG, true, true, 15, 15, false);
			addAnimation("inAir", [8,9,10,0], 5, false);
			addAnimation("splash", [1, 2, 3, 4, 5, 6,7], 15, false);
			addAnimation("tear",[11,12,13],17,false);
			acceleration.y = 50;
			
			
			
		}
		override public function update():void {
			if (splash) {
				if (finished)
				kill();
			}
			else if (FlxU.getDistance(getMidpoint(),Registry.circle.getMidpoint() )>140) {
			splash = true;
			play("splash");
			moves = false;
			}else if(finished)
			play("inAir");
			angle = Math.atan(  velocity.x/-velocity.y) * 360 / (2 * Math.PI);
				
		}
		
	}

}
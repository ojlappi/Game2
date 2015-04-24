package sprite {
	import org.flixel.FlxSprite;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Projectile  extends FlxSprite
	{
		public var spin:int;
		
		public function Projectile(X:Number,Y:Number) 
		{super(X, Y);
			
		}
		override public function update():void {
			if (touching==FlxObject.FLOOR&&spin != 0) {
				velocity.x = velocity.x +velocity.x*1.5*spin;
				spin = 0;
			}
			if (Math.abs(velocity.x) < 10 && Math.abs(velocity.y) < 10&&touching==FlxObject.FLOOR)
			kill();
		}
		
	}

}
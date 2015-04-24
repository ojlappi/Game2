package sprite {
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Tongue extends FlxSprite 
	{
		private var counter:int = 0;
		public var removed:Boolean = false;
		[Embed(source = "../sprite/assets/Tongue.png")] private var tungPNG:Class;
		public function Tongue(X:Number, Y:Number) 
		{
			width = 27;
			
			super(X-width/2, Y);
			loadGraphic(tungPNG,true, true,27,77,false);
			
		}override public function update():void {
			counter++;
		angle = Math.atan((Registry.player.getMidpoint().x - getMidpoint().x) / -(Registry.player.getMidpoint().y - getMidpoint().y)) * 360 / (2 * Math.PI) + 180 * (Registry.player.getMidpoint().y > getMidpoint().y?0:1);
			if(overlaps(Registry.player)){
				if (Registry.player.jumpvelocity > 0) {
					Registry.player.jumpvelocity--;
				}
				if (counter > 40){
				removed = true;
				Registry.underLayer.remove(this);
				counter = 0;
			}
			}
			else if (counter > 20){
				removed = true;
				Registry.underLayer.remove(this);
				counter = 0;
			}
		}

}
}
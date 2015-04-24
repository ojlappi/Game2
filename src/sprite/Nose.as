package sprite 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Nose extends FlxSprite 
	{
			[Embed(source = "../sprite/assets/Nose.png")] private var nosePNG:Class;
		public function Nose(X:Number, Y:Number) 
		{
		
			
			
			super(X, Y);
			loadGraphic(nosePNG, true, true, 50, 90, false);
			addAnimation("idle", [0], 0, false);
			addAnimation("hurt", [1, 2,2,2,2,2], 15, false);
			immovable = true;
			
		
		}override public function update():void {
		if ((Registry.player.y > getMidpoint().y) && overlaps(Registry.player) && Math.abs(FlxG.camera.angle) < 10 && Registry.player.jumpvelocity > 0&&(!Registry.eyes.members[0].sees&&!Registry.eyes.members[1].sees)) {
		
			play("hurt");
			
		}
		else if(finished)
			play("idle");
		
		}
		
	}

}
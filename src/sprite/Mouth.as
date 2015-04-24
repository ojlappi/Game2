package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Mouth extends FlxSprite 
	{
		private var count:int = 10;
		public var tongue:Tongue 
		private var bleuh:Boolean=false;
		[Embed(source = "../sprite/assets/Mouth.png")] private var mouthPNG:Class;
		public function Mouth(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(mouthPNG,true, true,58,36,false);
			addAnimation("idle", [0], 0, false);
			addAnimation("chew", [0, 1, 2, 3], 15, true);
			addAnimation("open", [4],0, false);
			width = 58;
			height = 36;
			tongue= new Tongue(getMidpoint().x,y-20);
			immovable = true;
			play("chew");
		}
		override public function update():void {
			if (Registry.player.jumpvelocity>0&&overlaps(Registry.player)&&(Registry.eyes.members[0].sees||Registry.eyes.members[1].sees)){
				
				Registry.underLayer.add(tongue);
				play("open");
				bleuh = true;
				
				
			}else {	
				
				if (bleuh && tongue.removed) {
				play("chew");
				tongue.removed = false;
				bleuh = false;
				}
				if (count < 0) {
					var drop:Drop = new Drop(getMidpoint().x , getMidpoint().y+1);
					Registry.projectiles.add(drop);
					drop.velocity.x = Math.random() * 70 - 35;
					drop.play("inAir");
					count = 70;
				}
				if(!bleuh)
				count--;
			}
		}
		
		}

}
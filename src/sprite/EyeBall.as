package sprite 
{
	import org.flixel.*
	
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class EyeBall extends FlxSprite
	{
		public var group:FlxGroup;
		public var sees:Boolean;
		private var counter:int;
		[Embed(source = "../sprite/assets/EyeLidsAlt.png")] private var lidsPNG:Class;
		public function EyeBall(X:Number,Y:Number) 
		{
			counter = 0;
			sees = true;
			super(X, Y);
			loadGraphic(lidsPNG,true, false,19,19,false);
			group = new FlxGroup;
			group.add(new White(X, Y));
			group.add(new Pupil(X,Y));
			addAnimation("roll", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 20, true);
			addAnimation("idle", [0], 0, false);
			addAnimation("hurt", [10,11], 6, true);
			
			immovable = true;
			
		}
		override public function update():void {
			var dx:Number = getMidpoint().x - Registry.player.getMidpoint().x+10;
			var dy:Number = getMidpoint().y - Registry.player.getMidpoint().y+10;
			var pyth:Number = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
			group.members[1].x = getMidpoint().x - dx * 5 / pyth;
			group.members[1].y = getMidpoint().y - dy * 5 / pyth;
			
			
			if (overlaps(Registry.player))
			sees = false;
			
			if (!sees) {
				play("hurt");
				counter++;
				if (counter % 40 == 0) {
				var drop:Drop = new Drop(getMidpoint().x, y + 25);				
				Registry.projectiles.add(drop)
				drop.play("tear");
				
				
				
				}
				if (counter>200){
					sees = true;
					counter = 0;
					play("idle");
				}
			}
		}
		
	}

}
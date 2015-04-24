package sprite {
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Player extends FlxSprite 
	{
		
	public var jumpvelocity:Number = 0;
	private const gravity:Number=0.5;
	public var absolutePoint:FlxPoint;
	private var hurtCounter:int = 0;
	public var isHurt:Boolean = false;
	


	
		
		[Embed(source = "../sprite/assets/Character.png")] private var playerPNG:Class;
		public function Player(X:Number, Y:Number)
		{
			super(X, Y);	
			loadGraphic(playerPNG,true, true, 20, 20, false);
			
			absolutePoint = new FlxPoint(0, 0);
			health = 5;
			
			
			
			
			
		}
		public function jump():void {
			if(absolutePoint.y==0)
			jumpvelocity = 7;
		}
		override public function update():void {
				absolutePoint.y += jumpvelocity;
				jumpvelocity -= gravity;
			
			if (FlxG.keys.UP)
				jumpvelocity += 0.3;
				
			if (absolutePoint.y < 0){
				absolutePoint.y = 0;
				jumpvelocity = 0;
				}
				if (!flickering&&FlxG.overlap(Registry.projectiles,this)){
				hurt(1);
				flicker(2);
				}
		}
		override public function hurt(Damage:Number):void {
			super.hurt(Damage);
			for each(var h:FlxSprite  in Registry.health.members) {
				
				if ((h as Heart).full){
					(h as Heart).full = false;
					
					h.play("empty");
				break;
				}
			}
		}
	}
}


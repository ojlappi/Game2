package  
{

	import org.flixel.*;
	import sprite.*

	public class PlayState extends FlxState
	{
		
	
	private var velocity:Number=0;
	private var maxVelocity:Number=2;
	private var mouth:Mouth;
	private var leftEye:EyeBall;
	private var rightEye:EyeBall;
	private var nose:Nose;
	private var background:Background;
		public function PlayState() 
		{
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff144954;
			//construct and add all sprites
			initialise();
			//
			FlxG.camera.follow(Registry.circle,FlxCamera.STYLE_LOCKON);
			
		}
		private function initialise(): void {
			Registry.circle = new CircleSprite(-297/2, -297/2);
			
			Registry.player = new Player(Registry.circle.getMidpoint().x, 297 / 2 - 22);
		
			mouth = new Mouth(-30, 71);
			nose = new Nose(-26,-20);
			leftEye=new EyeBall( -49, -15);
			rightEye=new EyeBall(30,-15);
			
			background=new Background(-250,-250)
			add(background);
			add(Registry.circle);
			add(nose);
			add(mouth);	
			add(leftEye.group);
			add(rightEye.group);
			add(leftEye);
			add(rightEye);
			
			Registry.eyes.add(leftEye);
			Registry.eyes.add(rightEye);
			
			add(new Eyebrow(0,-55, -40));
			add(new Eyebrow(1, 24, -40));
			
			add(Registry.underLayer);
			add(Registry.projectiles);
			add(Registry.player);
			add(Registry.health);
			for (var i:int = 0; i < Registry.player.health;i++ )
			Registry.health.add(new Heart(i*25, 180));
			
		
			}
		
		override public function update():void
		{
			
			super.update();				
			if (FlxG.keys.SPACE)
				Registry.circle.play("flip");
			//Controls
			
				if (FlxG.keys.LEFT)
					velocity += -0.1;
				else if (FlxG.keys.RIGHT)
					velocity += 0.1;
				else
					velocity = velocity * 0.9;
				if (FlxG.keys.justPressed("UP"))
					Registry.player.jump();
				
			if (Math.abs(velocity) > maxVelocity)
				velocity = velocity *maxVelocity/Math.abs(velocity); velocity
				
			//Rotating the camera according ot input
			FlxG.camera.angle+= velocity;
			//Calculating the position of the player
			Registry.player.x = -Registry.player.width/2+Math.sin(FlxG.camera.angle*2*Math.PI/360)*(297/2-Registry.player.height/2-Registry.player.absolutePoint.y);
			Registry.player.y = -Registry.player.height/2+Math.cos(FlxG.camera.angle*2*Math.PI/360)*(297/2-Registry.player.height/2-Registry.player.absolutePoint.y);
			Registry.player.angle = -FlxG.camera.angle;
			
			background.angle = -FlxG.camera.angle;
			for each(var h:Heart in Registry.health.members) {
			
				h.angle = -FlxG.camera.angle;
			}
			}
		
	}
}

package  
{
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxLinkedGroup;
	import sprite.CircleSprite;
	import sprite.Player;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Registry 
	{
		public static var circle:CircleSprite;
		public static var player:Player;
		public static var projectiles:FlxGroup = new FlxGroup;
		public static var underLayer:FlxGroup = new FlxGroup;
		public static var enemies:FlxGroup = new FlxGroup;
		public static var eyes:FlxGroup = new FlxGroup;
		public static var health:FlxGroup = new FlxGroup;

		public function Registry() 
		{
			
		}
		
	}

}
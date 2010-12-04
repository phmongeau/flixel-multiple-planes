package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		private var moveSpeed:Number;
        public var jumpPower:int;

		public function Player(X:int, Y:int):void
		{
			super(X, Y);

            createGraphic(10, 10, 0xffff0000);
			
			moveSpeed =  100;
			drag.x = 200;
			maxVelocity.x = moveSpeed;
            acceleration.y = 500; //Gravity
            jumpPower = 300;
            maxVelocity.y = jumpPower * 10;
            health = 10;
            FlxG.follow(this);
		}
		
		override public function update():void
		{
			if (FlxG.keys.LEFT)
			{
				velocity.x -= moveSpeed * FlxG.elapsed * 3;
			}
			
			if (FlxG.keys.RIGHT)
			{
				velocity.x += moveSpeed * FlxG.elapsed * 3;
			}
            if (FlxG.keys.justPressed("SPACE") && velocity.y == 0)
            {
                velocity.y -= jumpPower;
            }
			super.update();
		}
	}
}


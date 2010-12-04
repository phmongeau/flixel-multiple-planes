package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="rampSel.png")] private var ImgRamp2:Class;
		[Embed(source="ramp.png")] private var ImgRamp:Class;

        private var player:Player;
        private var floor1:FlxSprite;
        private var floor2:FlxSprite;
        private var playerLayer:int;

		override public function create():void
		{
            FlxG.showBounds = true;

            floor2 = new FlxSprite(20, 60).loadGraphic(ImgRamp2);
            floor2.fixed = true;
            floor2.scrollFactor = new FlxPoint(0.7, 0.7);
            add(floor2);

            floor1 = new FlxSprite(20, 70);
            floor1.loadGraphic(ImgRamp);
            floor1.fixed = true;
            add(floor1);

            playerLayer = 0;
            player = new Player(50, 50);
            add(player);

		}

        override public function update():void
        {
            if(playerLayer == 0)
                FlxU.collide(player, floor1);
            else
                FlxU.collide(player, floor2);

            if(FlxG.keys.UP && FlxG.keys.justPressed("SPACE"))
            {
                playerLayer = 1;
                player.scrollFactor = floor2.scrollFactor;
            }
            if(FlxG.keys.DOWN && FlxG.keys.justPressed("SPACE"))
            {
                playerLayer = 0;
                player.scrollFactor = floor1.scrollFactor;
            }

            super.update();
        }
	}
}

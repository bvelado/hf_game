package state;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;
import entity.Player;
import map.Level;

class PlayState extends FlxState {

  var _timer:FlxTimer;
  var _player:Player;

	override public function create():Void {
		super.create();

    _player = new Player(FlxG.width / 2, FlxG.height / 2);
    add(_player);

    var level = new Level();
    
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

    _player.update(elapsed);
	}
}

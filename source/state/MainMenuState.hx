package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MainMenuState extends FlxState {

  var _titleText:FlxText;
  var _playButton:FlxButton;

	override public function create():Void {
		super.create();

    _titleText = new FlxText(0, 0, 0, "Super jeu de\nFoot-Voiture", 48);
    _titleText.screenCenter();

    _playButton = new FlxButton(0,0,"Jouer", function() {
      FlxG.switchState(new state.PlayState());
    });
    _playButton.screenCenter();
    _playButton.y += 120;

    add(_titleText);
    add(_playButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}

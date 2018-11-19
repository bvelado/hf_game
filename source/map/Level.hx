package map;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.math.FlxPoint;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class Level extends FlxSprite {

  var mapLoader:FlxOgmoLoader;
  var layers:Array<FlxTilemap>;

  public function new(){
    super();

    layers = new Array<FlxTilemap>();
    mapLoader = new FlxOgmoLoader(AssetPaths.level01__oel);
    
    var layer1 = mapLoader.loadTilemap(AssetPaths.terrain__png, 64, 64, "layer_1");
    var layer2 = mapLoader.loadTilemap(AssetPaths.terrain__png, 64, 64, "layer_2");
    var layer3 = mapLoader.loadTilemap(AssetPaths.terrain__png, 64, 64, "layer_3");

    
  }
}
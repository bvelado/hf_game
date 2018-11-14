package map;

import flixel.graphics.FlxGraphic;
import flash.display.BitmapData;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxTileFrames;

class Level extends TiledMap {

  static var PATH_ROOT:String = "assets/data/maps/";

  public function new(){
    super("assets/data/maps/map01.xml", PATH_ROOT);

    var tilesheetsFrames:Array<FlxTileFrames> = new Array<FlxTileFrames>();
    for(tileset in tilesetArray) {
      // A little hacky but had to because loadGraphic doesn't
      // like xxx/../yyy relative paths (apparently)
      var path = haxe.io.Path.normalize(PATH_ROOT + tileset.imageSource);
      // var graphic = FlxGraphic.
    }

    for(layer in layers){
      switch(layer.type){
        case TiledLayerType.TILE: 
          addTileLayer(layer);
        case TiledLayerType.OBJECT:
        default:
      }
    }
  }

  private function addTileLayer(layer:TiledLayer){
    // var layerTilemap:FlxTilemap = new FlxTilemap();
    // var tileLayer = cast(layer, TiledTileLayer);
    // layerTilemap.loadMapFromArray(
    //   tileLayer.tileArray,
    //   width,
    //   height, 
    //   _tilesByLayer[0],
    //   tileWidth,
    //   tileHeight,
    //   FlxTileMapAutoTiling.OFF,
    //   0);
  }

}
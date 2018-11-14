/*
 * MIT License
 *
 * Copyright (c) 2018 Baptiste Velado
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package entity;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxG;

class Player extends Entity {
	static var ANIMATION_FPS:Int = 5;
	static var WIDTH:Int = 64;
	static var HEIGHT:Int = 64;
	static var MOVE_SPEED:Float = 140;

	public function new(x:Float, y:Float) {
		super(x, y);

    loadGraphic("assets/images/player.png", true, 64, 64);
    animation.add("idle_south", [0]);
    animation.add("idle_north", [3]);
    animation.add("idle_east", [6]);
    animation.add("idle_west", [9]);
    animation.add("walk_south", [0, 1, 0, 2], ANIMATION_FPS, true);
    animation.add("walk_north", [3, 4, 3, 5], ANIMATION_FPS, true);
    animation.add("walk_east", [6, 7, 6, 8], ANIMATION_FPS, true);
    animation.add("walk_west", [9, 10, 9, 11], ANIMATION_FPS, true);

		drag.x = drag.y = 1600;
	}

	public override function update(dt:Float) {
		move();

    super.update(dt);
	}

  private function move() {
			var _up:Bool = false;
			var _down:Bool = false;
			var _left:Bool = false;
			var _right:Bool = false;
      var speed:Float = MOVE_SPEED;

			_up = FlxG.keys.anyPressed([UP, W]);
			_down = FlxG.keys.anyPressed([DOWN, S]);
			_left = FlxG.keys.anyPressed([LEFT, A]);
			_right = FlxG.keys.anyPressed([RIGHT, D]);

			var mA:Float = 0; // our temporary angle
			if (_up) // the player is pressing UP
			{
				mA = -90; // set our angle to -90 (12 o'clock)
				if (_left)
					mA -= 45; // if the player is also pressing LEFT, subtract 45 degrees from our angle - we're moving up and left
				else if (_right)
					mA += 45; // similarly, if the player is pressing RIGHT, add 45 degrees (up and right)
				facing = FlxObject.UP; // the sprite should be facing UP
			} else if (_down) // the player is pressing DOWN
			{
				mA = 90; // set our angle to 90 (6 o'clock)
				if (_left)
					mA += 45; // add 45 degrees if the player is also pressing LEFT
				else if (_right)
					mA -= 45; // or subtract 45 if they are pressing RIGHT
				facing = FlxObject.DOWN; // the sprite is facing DOWN
			} else if (_left) // if the player is not pressing UP or DOWN, but they are pressing LEFT
			{
				mA = 180; // set our angle to 180 (9 o'clock)
				facing = FlxObject.LEFT; // the sprite should be facing LEFT
			} else if (_right) // the player is not pressing UP, DOWN, or LEFT, and they ARE pressing RIGHT
			{
				mA = 0; // set our angle to 0 (3 o'clock)
				facing = FlxObject.RIGHT; // set the sprite's facing to RIGHT
			} else {
        speed = 0;
      }

			// determine our velocity based on angle and speed
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);

			if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
				// if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
			{
				switch (facing) {
					case FlxObject.LEFT:
						animation.play("walk_west");
					case FlxObject.RIGHT:
						animation.play("walk_east");
					case FlxObject.UP:
						animation.play("walk_north");
					case FlxObject.DOWN:
						animation.play("walk_south");
				}
			} else {
				switch (facing) {
					case FlxObject.LEFT:
						animation.play("idle_west");
					case FlxObject.RIGHT:
						animation.play("idle_east");
					case FlxObject.UP:
						animation.play("idle_north");
					case FlxObject.DOWN:
						animation.play("idle_south");
				}
			}
		}
}

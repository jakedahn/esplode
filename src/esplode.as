/**
 * Esplode
 * Visual shenanigans for Special Topics class.
 *
 * @author		Jake Dahn
 * @version		0.1
 */

/*
Licensed under the MIT License

Copyright (c) 2010 Jake Dahn

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

package
{

  import flash.events.*;
  import flash.display.*;
  import flash.utils.*;
  import caurina.transitions.Tweener;

  public class esplode extends Sprite
  {
  
    /**
     * @constructor
     */
    public function esplode()
    {
      super();
      stage.addEventListener( Event.ENTER_FRAME, initialize );
    }
  
    private function initialize(event:Event):void
    {
      stage.removeEventListener( Event.ENTER_FRAME, initialize );    
    
      stage.addEventListener(MouseEvent.MOUSE_MOVE, function(){
        var circle:Sprite = generateCircle();
        var initialSize:Number = 0;
      
        Tweener.addTween(circle, {alpha: 0, time: 5});
        Tweener.addTween(circle, {scaleX: .5, time: 1});
        Tweener.addTween(circle, {scaleY: .5, time: 1});
      
        stage.addChild(circle);
      
        setInterval(function(){
          stage.removeChild(circle)
        }, 5000);
      
      });

    }
  
    public function generateCircle():Sprite
    {
      var colorArray:Array = new Array(0xFFFF33, 0xFFFFFF, 0x79DCF4, 0xFF3333, 0xFFCC33, 0x99CC33);
      var randomColor:Number = Math.floor(Math.random()*colorArray.length);
      var ellipse:Sprite = new Sprite();
    
      ellipse.graphics.beginFill(colorArray[randomColor]);
      ellipse.graphics.drawCircle(Math.random()*1000, Math.random()*1000, 100);    
    
      ellipse.alpha = 1;
      ellipse.scaleX = 0;
      ellipse.scaleY = 0;
      return ellipse;
    }
  }

}

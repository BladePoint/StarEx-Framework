// starEx - https://github.com/BladePoint/starEx
// Copyright Doublehead Games, LLC. All rights reserved.
// This code is open source under the MIT License - https://github.com/BladePoint/starEx/blob/main/LICENSE
// Use in conjunction with Starling - https://gamua.com/starling/

package starEx.display {

	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starEx.display.IAperture;
	import starEx.display.IApertureContainer;
	import starEx.utils.ApertureObject;
	import starEx.utils.ApertureUtils;
	import starEx.utils.PoolEx;
	/* An ApertureSprite can be assigned a color, which will multiply the colors of all its IAperture children. */
	public class ApertureSprite extends Sprite implements IAperture, IApertureContainer {

		private var true_AO:ApertureObject, mult_AO:ApertureObject;
		private var _apertureLock:Boolean;
		public function ApertureSprite(colorHex:uint=0xffffff) {
			true_AO = ApertureObject.getInstance(colorHex);
			mult_AO = ApertureObject.getInstance(colorHex);
			super();
		}
		public function setHex(colorHex:uint=0xffffff):void {
			true_AO.hex = colorHex;
			multiplyColor();
		}
		public function getHex(index:uint=0):uint {
			return true_AO.hex;
		}
		public function getMultHex():uint {
			return mult_AO.hex;
		}
		public function setRGB(r:uint=255,g:uint=255,b:uint=255):void {
			true_AO.rgb(r,g,b);
			multiplyColor();
		}
		public function getMultRGB():Array {
			var returnA:Array = PoolEx.getArray();
			returnA[0] = mult_AO.r;
			returnA[1] = mult_AO.g;
			returnA[2] = mult_AO.b;
			return returnA;
		}
		public function getRGB(index:uint=0):Array {
			var returnA:Array = PoolEx.getArray();
			returnA[0] = true_AO.r;
			returnA[1] = true_AO.g;
			returnA[2] = true_AO.b;
			return returnA;
		}
		public function getMultAO():ApertureObject {return mult_AO;}
		public function setAperture(decimal:Number):void {
			if (decimal < 0 || decimal > 1) return;
			var roundInt:uint = Math.round(decimal*255);
			setRGB(roundInt,roundInt,roundInt);
		}
		public function set apertureLock(boolean:Boolean):void {_apertureLock = boolean;}
		public function get apertureLock():Boolean {return _apertureLock;}
		public function multiplyColor():void {
			ApertureUtils.multiplyChildren(this);
		}
		public function calcMult(parentMult_AO:ApertureObject,index:uint=0):void {
			if (parentMult_AO) mult_AO.hex = ApertureObject.multiply(true_AO,parentMult_AO);
			else mult_AO.hex = true_AO.hex;
		}
		override public function addChild(child:DisplayObject):DisplayObject {
			super.addChild(child)
			ApertureUtils.multiplyChild(child);
			return child;
		}
		override public function addChildAt(child:DisplayObject,index:int):DisplayObject {
			super.addChildAt(child,index);
			ApertureUtils.multiplyChild(child);
			return child;
		}
		override public function dispose():void {
			ApertureObject.putInstance(true_AO);
			ApertureObject.putInstance(mult_AO);
			true_AO = mult_AO = null;
			super.dispose();
		}
	}

}

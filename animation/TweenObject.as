// starEx - https://github.com/BladePoint/starEx
// Copyright Doublehead Games, LLC. All rights reserved.
// This code is open source under the MIT License - https://github.com/BladePoint/starEx/blob/main/LICENSE
// Use in conjunction with Starling - https://gamua.com/starling/

package starEx.animation {

	/* A poolable object with a single property for tweening. */
	public class TweenObject {
		static private const instancePool:Vector.<TweenObject> = new <TweenObject>[];
		static public function getInstance(initialT:Number=0):TweenObject {
			if (instancePool.length == 0) return new TweenObject(initialT);
			else {
				var tweenObject:TweenObject = instancePool.pop();
				tweenObject.t = initialT;
				return tweenObject;
			}
		}
		static public function putInstance(tweenObject:TweenObject):void {
			if (tweenObject) instancePool[instancePool.length] = tweenObject;
		}

		public var t:Number;
		public function TweenObject(initialT:Number=0) {
			t = initialT;
		}
	}

}

// starEx - https://github.com/BladePoint/starEx
// Copyright Doublehead Games, LLC. All rights reserved.
// This code is open source under the MIT License - https://github.com/BladePoint/starEx/blob/main/LICENSE
// Use in conjunction with Starling - https://gamua.com/starling/

package starEx.text {

	import starEx.display.ApertureQuad;
	import starEx.text.Char;
	import starEx.text.TextFormatEx;
	/* All fonts used with TextFormatEx must implement IFont. */
	public interface IFont {
		function initFormat(textFormat:TextFormatEx):void;
		function getChar(charID:int):Char;
		function getCharQuad(char:Char):ApertureQuad;
		function putCharQuad(charQuad:ApertureQuad):void;
		function getLineQuad(w:Number,h:Number):ApertureQuad;
		function putLineQuad(lineQuad:ApertureQuad):void;
		function dispose():void;
		function get name():String;
		function get size():Number;
		function get type():String;
		function get distanceFont():Boolean;
		function get multiChannel():Boolean;
		function get padding():Number;
		function get lineHeight():Number;
		function get offsetX():Number;
		function get offsetY():Number;
		function get italicRadians():Number;
		function set italicRadians(radians:Number):void;
		function get sinItalicRadians():Number;
		function get lineThicknessProportion():Number;
		function set lineThicknessProportion(decimal:Number):void;
		function get baselineProportion():Number;
		function set baselineProportion(decimal:Number):void;
		function get underlineProportion():Number;
		function set underlineProportion(decimal:Number):void;
	}

}

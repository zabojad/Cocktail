/*
 * Cocktail, HTML rendering engine
 * http://haxe.org/com/libs/cocktail
 *
 * Copyright (c) Silex Labs
 * Cocktail is available under the MIT license
 * http://www.silexlabs.org/labs/cocktail-licensing/
*/
package cocktail.core.geom;

/**
 * This file contains geometry themed struct and enums
 */

//////////////////////////////////////////////////////////////////////////////////////////
// General geometry structures and enums
//////////////////////////////////////////////////////////////////////////////////////////
 
	//////////////////////////////////////////////////////////////////////////////////////////
	// Structures
	//////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * represent a rectangle
	 */
	typedef RectangleData = {
		var x:Float;
		var y:Float;
		var width:Float;
		var height:Float;
	}
	
	/**
	 * Represents a point in 2d space
	 */
	typedef PointData = {
		var x:Float;
		var y:Float;
	}
	
	/**
	 * Represents a width and
	 * height dimension
	 */
	typedef DimensionData = {
		var width:Float;
		var height:Float;
	}

//////////////////////////////////////////////////////////////////////////////////////////
// Matrix structures and enums
//////////////////////////////////////////////////////////////////////////////////////////

	//////////////////////////////////////////////////////////////////////////////////////////
	// Structures
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Represents the values of a 3x3 Matrix
	 */
	typedef MatrixData = {
		var a:Float;
		var b:Float;
		var c:Float;
		var d:Float;
		var e:Float;
		var f:Float;
	}


/**
 * Cocktail, HTML rendering engine
 * http://haxe.org/com/libs/cocktail
 *
 * Copyright (c) Silex Labs
 * Cocktail is available under the MIT license
 * http://www.silexlabs.org/labs/cocktail-licensing/
 */
package cocktail.core.dom; 

/**
 * @see https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#processinginstruction
 * @author Thomas Fétiveau
 */
class ProcessingInstruction extends CharacterData
{
	//readonly attribute DOMString target;
	public var target(default, never) : DOMString;
	
	public function new()
	{
		super();
	}
	
	////////////////////
	// PROPERTIES
	////////////////////
	override public function get_nodeType() : Int
	{
		return DOMConstants.PROCESSING_INSTRUCTION_NODE;
	}
	override public function get_nodeName() : DOMString
	{
		return target;
	}
	override public function get_nodeValue() : Null<DOMString>
	{
		return data;
	}
	override public function set_nodeValue( nv : DOMString ) : Null<DOMString>
	{
		// FIXME DOMInternals.replaceData( this, 0, length, nv );
		return data;
	}
	override public function get_textContent() : Null<DOMString>
	{
		return data;
	}
	override public function set_textContent( nv : DOMString ) : Null<DOMString>
	{
		// FIXME DOMInternals.replaceData( this, 0, length, nv );
		return data;
	}
}
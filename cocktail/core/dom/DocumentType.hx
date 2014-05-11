/**
 * Dominos, HTML5 parser.
 * @see https://github.com/silexlabs/dominos
 *
 * @author Thomas Fétiveau, http://www.tokom.fr
 * Copyrights SilexLabs 2013 - http://www.silexlabs.org/ -
 * License MIT
 */
package cocktail.core.dom; 

/**
 * @see https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#documenttype
 * 
 * @author Thomas Fétiveau
 */
class DocumentType extends Node
{
	/**
	 * @see https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-documenttype-name
	 */
	public var name( default, null ) : DOMString;
	/**
	 * @see https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-documenttype-publicid
	 */
	public var publicId( default, null ) : DOMString;
	/**
	 * @see https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-documenttype-systemid
	 */
	public var systemId( default, null ) : DOMString;

	/**
	 * When a doctype is created, its name is always given. Unless explicitly given when a doctype is created, its public ID and system ID are the empty string. 
	 * @param	name
	 * @param	?publicId
	 * @param	?systemId
	 */
	public function new( name : DOMString, ?publicId : DOMString = "", ?systemId : DOMString = "" )
	{
		super();
		this.name = name;
		this.publicId = publicId;
		this.systemId = systemId;
	}
	
	//////////////////
	// PROPERTIES
	//////////////////
	
	override public function get_nodeType() : Int
	{
		//return DOMConstants.DOCUMENT_TYPE_NODE;
		return DOMConstants.DOCUMENT_TYPE_NODE;
	}
	override public function get_nodeName() : DOMString
	{
		return name;
	}
}
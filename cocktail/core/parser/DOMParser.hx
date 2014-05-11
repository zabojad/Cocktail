/*
 * Cocktail, HTML rendering engine
 * http://haxe.org/com/libs/cocktail
 *
 * Copyright (c) Silex Labs
 * Cocktail is available under the MIT license
 * http://www.silexlabs.org/labs/cocktail-licensing/
*/
package cocktail.core.parser;

import cocktail.core.dom.Attr;
import cocktail.core.dom.Document;
import cocktail.core.dom.DocumentFragment;
import cocktail.core.dom.Element;
import cocktail.core.dom.DOMConstants;
import cocktail.core.dom.NamedNodeMap;
import cocktail.core.dom.NodeList;
import cocktail.core.dom.Node;
import cocktail.core.html.HTMLConstants;
import cocktail.core.html.HTMLElement;

/**
 * This class is now used as a proxy class for Cocktail to the Dominos parser
 * 
 * @author Yannick DOMINGUEZ & Thomas Fétiveau
 */
class DOMParser 
{
	///
	// API
	//

	//public static function parse(html:String, ownerDocument:Document):Node
	public static function parse(html : String) : Document
	{
		//return doSetInnerHTML(Parser.parse(html).firstElement(), ownerDocument);
		return HTMLParser.parse(html);
	}

	/**
	 * @see http://domparsing.spec.whatwg.org/#concept-parse-fragment
	 */
	static public function parseFragment( markup : String, ? context : Element = null ) : DocumentFragment
	{
		// If the context element's node document is an HTML document: let algorithm be the HTML fragment parsing algorithm.

		// If the context element's node document is an XML document: let algorithm be the XML fragment parsing algorithm.

		// Invoke algorithm with markup as the input, and context element as the context element.
		// Let new children be the nodes returned.
		var newChildren : NodeList = HTMLParser.parseFragment(markup, context);

		// Let fragment be a new DocumentFragment whose node document is context element's node document.
		var fragment : DocumentFragment = new DocumentFragment();
		fragment.ownerDocument = context.ownerDocument;

		// Append each node in new children to fragment (in order).
		for (n in newChildren) {

			fragment.appendChild(n);
		}
		return fragment;
	}

	
	/**
	 * Take an HTML DOM element and serialize it
	 * and its children into an HTML string
	 */
	public static function serialize(node : Node) : String
	{
		return HTMLSerializer.serialize(node);
	}
}
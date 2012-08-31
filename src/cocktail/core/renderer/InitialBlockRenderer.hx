/*
 * Cocktail, HTML rendering engine
 * http://haxe.org/com/libs/cocktail
 *
 * Copyright (c) Silex Labs
 * Cocktail is available under the MIT license
 * http://www.silexlabs.org/labs/cocktail-licensing/
*/
package cocktail.core.renderer;

import cocktail.core.background.BackgroundManager;
import cocktail.core.dom.Node;
import cocktail.core.html.HTMLElement;
import cocktail.port.NativeElement;
import cocktail.core.geom.GeomData;
import cocktail.core.style.formatter.BlockFormattingContext;
import cocktail.core.style.formatter.FormattingContext;
import cocktail.core.style.StyleData;
import cocktail.core.style.CoreStyle;
import haxe.Log;
import cocktail.core.renderer.RendererData;
import cocktail.core.layer.LayerRenderer;
import cocktail.core.font.FontData;
import haxe.Timer;

/**
 * This is the root ElementRenderer of the rendering
 * tree, generated by the HTMLHTMLElement, which is the root
 * of the DOM tree
 * 
 * @author Yannick DOMINGUEZ
 */
class InitialBlockRenderer extends BlockBoxRenderer
{
	/**
	 * class constructor.
	 */
	public function new(node:HTMLElement) 
	{
		super(node);
		
		//call the attachement method itself as it is 
		//supposed to be called by parent ElementRenderer
		//otherwise
		attach();
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN PRIVATE ATTACHEMENT METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Overriden as initial block renderer always create
	 * a new layer
	 */
	override private function attachLayer():Void
	{
		layerRenderer = new LayerRenderer(this);
	}
	
	/**
	 * Overriden as initial block renderer always delete
	 * its own layer
	 */
	override private function detachLayer():Void
	{
		layerRenderer = null;
	}
	
	/**
	 * never attach to containing block as it has
	 * none
	 */
	override private function attachContaininingBlock():Void
	{
		
	}
	
	/**
	 * same as above for detach
	 */
	override private function detachContainingBlock():Void
	{
		
	}

	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN PRIVATE INVALIDATION METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * As the initial block renderer has no containing block,
	 * invalidate the document instead
	 */
	override private function invalidateContainingBlock(invalidationReason:InvalidationReason):Void
	{
		invalidateDocumentLayoutAndRendering();
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN PUBLIC HELPER METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * The initial block renderer is always considered positioned,
	 * as it always lays out the positioned children for whom it is
	 * the first positioned ancestor
	 */
	override public function isPositioned():Bool
	{
		return true;
	}
	
	/**
	 * The initial block container always establishes a block formatting context
	 * for its children
	 */
	override public function establishesNewFormattingContext():Bool
	{
		return true;
	}
	
	/**
	 * Overriden as initial block container alwyas establishes a new
	 * stacking context and creates the root LayerRenderer of the
	 * LayerRenderer tree
	 */
	override public function establishesNewStackingContext():Bool
	{
		return true;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN PRIVATE HELPER METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Overriden as the scontaining dimensionsn for the scrollbars
	 * appearing for the initial containing block are the viewport's
	 */
	override private function getScrollbarContainerBlock():ContainingBlockData
	{
		var width:Float = cocktail.Lib.window.innerWidth;
		var height:Float = cocktail.Lib.window.innerHeight;
		
		var windowData:ContainingBlockData = {
			isHeightAuto:false,
			isWidthAuto:false,
			width:width,
			height:height
		}
		
		return windowData;
	}
	
	/**
	 * When dispatched on the HTMLHTMLElement,
	 * the scroll event must bubble to be dispatched
	 * on the Document and Window objects
	 */
	override private function mustBubbleScrollEvent():Bool
	{
		return true;
	}
	
	/**
	 * A computed value of visible for the overflow on the initial
	 * block renderer is the same as auto, as it is likely that
	 * scrollbar must be displayed to scroll through the document
	 */
	override private function treatVisibleOverflowAsAuto():Bool
	{
		return true;
	}
	
	/**
	 * Retrieve the dimension of the Window
	 */
	override private function getWindowData():ContainingBlockData
	{	
		var width:Float = cocktail.Lib.window.innerWidth;
		var height:Float = cocktail.Lib.window.innerHeight;
		
		var windowData:ContainingBlockData = {
			isHeightAuto:false,
			isWidthAuto:false,
			width:width,
			height:height
		}
		
		//scrollbars dimension are removed from the Window dimension
		//if displayed to return the actual available space
		
		if (_verticalScrollBar != null)
		{
			windowData.width -= _verticalScrollBar.coreStyle.computedStyle.width;
		}
		
		if (_horizontalScrollBar != null)
		{
			windowData.height -= _horizontalScrollBar.coreStyle.computedStyle.height;
		}
		
		return windowData;
	}
	
	/**
	 * The dimensions of the initial
	 * block renderer are always the same as the Window's
	 */
	override public function getContainerBlockData():ContainingBlockData
	{
		return getWindowData();
	}
	
	/**
	 * Returns itself as containing block, which is used
	 * during layout
	 */
	override private function getContainingBlock():FlowBoxRenderer
	{	
		return this;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN GETTER
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * overriden as the bounds of the initial block container
	 * are always those of the Window (minus scrollbars dimensions
	 * if displayed)
	 */
	override private function get_bounds():RectangleData
	{
		var containerBlockData:ContainingBlockData = getContainerBlockData();
		
		var width:Float = containerBlockData.width;
		var height:Float = containerBlockData.height;
		
		return {
			x:0.0,
			y:0.0,
			width:width,
			height:height
		};
	}
	
	/**
	 * For the initial container, the bounds and
	 * global bounds are the same
	 */
	override private function get_globalBounds():RectangleData
	{
		return bounds;
	}
	
}
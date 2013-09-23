// ActionScript file
package myComponents
{
    // itemRenderers/tree/myComponents/MyTreeItemRenderer.as
    import mx.collections.*;
    import mx.controls.treeClasses.*;

    public class MyTreeItemRenderer extends TreeItemRenderer
    {

        // Define the constructor.      
        public function MyTreeItemRenderer() {
            super();
        }
        
        // Override the set method for the data property
        // to set the font color and style of each node.        
        override public function set data(value:Object):void {
            super.data = value;
            if (super.listData != null) {
            if(TreeListData(super.listData).hasChildren)
            {
//                setStyle("color", 0xff0000);
                setStyle("fontWeight", 'bold');
            }
            else
            {
                setStyle("color", 0x000000);
                setStyle("fontWeight", 'normal');
            } 
            }
        }
     
        // Override the updateDisplayList() method 
        // to set the text for each tree node.      
        override protected function updateDisplayList(unscaledWidth:Number, 
            unscaledHeight:Number):void {
       
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if(super.data)
            {
                if(TreeListData(super.listData).hasChildren)
                {
                    var tmp:XMLList = new XMLList(TreeListData(super.listData).item);
                    //trace(tmp[0]);
                    if (tmp[0].hasOwnProperty('name')) {
	                   	var myStr2:String = tmp[0].name;
                    	super.label.text = TreeListData(super.listData).label + myStr2;
                    } else if (tmp[0].hasOwnProperty('id')) {
	                   	var myStr3:String = tmp[0].name;
                    	super.label.text = TreeListData(super.listData).label + myStr3;
                    } else {
                   		var myStr:int = tmp[0].children().length();
                    	super.label.text =  TreeListData(super.listData).label + 
                        	"(" + myStr + ")";
                     }
               }
            }
        }
        
    }
    

}


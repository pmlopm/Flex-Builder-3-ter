// ActionScript file
package myComponents
{
    // itemRenderers/tree/myComponents/MyTreeItemRenderer.as
    import mx.collections.*;
    import mx.controls.treeClasses.*;

    public class MyTaskRenderer extends TreeItemRenderer
    {

        //var btn:Button;
        // Define the constructor.      
        public function MyTaskRenderer() {
            super();
		 }  
  
        // Override the set method for the data property
        // to set the font color and style of each node.        
        override public function set data(value:Object):void {
            super.data = value;
            if (super.listData != null) {
		            if(TreeListData(super.listData).hasChildren)
		            {
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
       
            var tmp:XMLList;
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if(super.data)
            {
                    tmp = new XMLList(TreeListData(super.listData).item);
                    //trace(tmp[0]);
                   	super.label.text = TreeListData(super.listData).label + tmp[0].@name;
                   	super.toolTip = tmp[0].@path;
//                    if (tmp[0].hasOwnProperty('appId')) {
//	  					super.label.text = TreeListData(super.listData).label + "///"+ tmp[0].@name;                    	
//                    } else if (tmp[0].hasOwnProperty('name')) {
//	                   	var myStr2:String = tmp[0].name;
//                    	super.label.text = TreeListData(super.listData).label + myStr2;
//                    } else if (tmp[0].hasOwnProperty('id')) {
//	                   	var myStr3:String = tmp[0].name;
//                    	super.label.text = TreeListData(super.listData).label + myStr3;
//                    } else {
//                   		var myStr:int = tmp[0].children().length();
//                   		if (myStr > 0) {
//	                    	super.label.text =  TreeListData(super.listData).label + 
//    	                    	"(" + myStr + ")";
//    	                } else {
//    	                	if (tmp[0] == ""){
//    	                		tmp = new XMLList(TreeListData(super.listData).item);
//    	                	}
//    	                	if (TreeListData(super.listData).label == "") {
//    	                		var source:XML = (this.document as PersonalTimeKeeper5).inflowTypesData.source[0];
//    	                		trace(source.type.(@id==tmp.@typeId).@name);
//    	                		super.label.text =  source.type.(@id==tmp.@typeId).@name + "//" + tmp.@name;
//    	                	} else {
//     	                		super.label.text =  TreeListData(super.listData).label;
//    	                	}
//    	                }
//                     }
          }
        }
        
    }
}


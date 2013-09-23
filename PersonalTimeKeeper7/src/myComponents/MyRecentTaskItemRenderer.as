// ActionScript file
package myComponents
{
    import flash.events.ContextMenuEvent;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    // itemRenderers/tree/myComponents/MyTreeItemRenderer.as
    import mx.collections.*;
    import mx.controls.treeClasses.*;
    import mx.controls.Alert;

    public class MyRecentTaskItemRenderer extends TreeItemRenderer
    {

        //var btn:Button;
        // Define the constructor.      
        public function MyRecentTaskItemRenderer() {
            super();
 			var contextMenu:ContextMenu = new ContextMenu();  
 			var menuItems:Array = [];  
 			var edit:ContextMenuItem;
 			edit = new ContextMenuItem("Remove");  
 			edit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, contextMenuItemSelectHandler);  
 			menuItems.push(edit);  
			contextMenu.customItems = menuItems;  
 			this.contextMenu = contextMenu;  
		 }  
  
		private function contextMenuItemSelectHandler(event:ContextMenuEvent):void {  
 			if (event.currentTarget.caption == 'Remove') {
 				Alert.show('remove current task');
 				data.@isVisible="false";
 			}
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
            trace(super.label.text);
            if (super.data)
            {
	            tmp = new XMLList(TreeListData(super.listData).item);
                //trace(tmp[0]);
               	super.label.text = TreeListData(super.listData).label + tmp[0].@path;
           		var myStr:int = tmp[0].children().length();
           		if (myStr > 0) {
	               	super.label.text =  TreeListData(super.listData).label + 
                   	"(" + myStr + ")";
   	            } else {
/*   		           	if (tmp[0] == ""){
   	                		tmp = new XMLList(TreeListData(super.listData).item);
   	               	}
*/
   	               	if (TreeListData(super.listData).label == "") {
   	               		var source:XML = (this.document as PersonalTimeKeeper6).inflowTypesData.source[0];
   	               		super.label.text =  tmp.@type + "//" + tmp.@name;
   	               		trace(source.type.(@id==tmp.@typeId).@name + "###" + super.label.text);
   	               	} else {
  	               		//super.label.text = TreeListData(super.listData).label;
  	               		trace("-----");
  	               		//super.visible = false;
   	               	}
                }
            }
        }
        
    }
}


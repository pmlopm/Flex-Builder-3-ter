// ActionScript file
package myComponents
{
    // itemRenderers/tree/myComponents/MyTreeItemRenderer.as
    import flash.events.ContextMenuEvent;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    
    import mx.collections.*;
    import mx.controls.Alert;
    import mx.controls.Button;
    import mx.controls.treeClasses.*;
 
    public class MyPrefTreeItemRenderer extends TreeItemRenderer
    {

        //var btn:Button;
        // Define the constructor.      
        public function MyPrefTreeItemRenderer() {
            super();
 			var contextMenu:ContextMenu = new ContextMenu();  
 			var menuItems:Array = [];  
 			var edit:ContextMenuItem;
//			edit = new ContextMenuItem("Add to prefs");  
// 			edit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, treeViewContextMenuItemSelectHandler);  
// 			menuItems.push(edit);  
 			edit = new ContextMenuItem("Hide current");  
 			edit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, treeViewContextMenuItemSelectHandler);  
 			menuItems.push(edit);  
  			edit = new ContextMenuItem("Show all children");  
 			edit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, treeViewContextMenuItemSelectHandler);  
 			menuItems.push(edit);  
			contextMenu.customItems = menuItems;  
 			this.contextMenu = contextMenu;  
		}  
 
 		private function treeViewContextMenuItemSelectHandler(event:ContextMenuEvent):void {  
 			if (event.currentTarget.caption == 'Add to prefs') {
 				//Alert.show('Add to prefs');
 				data.@isVisible="true";
 			} else if (event.currentTarget.caption == 'Hide current') {
 				data.@isVisible = "false";
 				(this.document as PersonalTimeKeeper6).savePrefTree();
 			}  else if (event.currentTarget.caption == 'Show all children') {
 				for each (var child:XML in (data as XML).children()) {
 					child.@isVisible = "true";	
 				}
 				(this.document as PersonalTimeKeeper6).savePrefTree();
 				//data.@isVisible = "true";
 			} else {
 				
 			}
 		}
        
 
        override protected function createChildren():void {
        	super.createChildren();
        }

        // Override the set method for the data property
        // to set the font color and style of each node.        
        override public function set data(value:Object):void {
//        	trace(value.toString().substring(1,32) + "/" + (((XML)(value).@isVisible)) + "/");
//        	if ((value != null) && ((!("@isVisible" in (XML)(value))) || (((XML)(value).@isVisible) != "false"))) {
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
//         	} else {
//         		super.data = null;
//         	}
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


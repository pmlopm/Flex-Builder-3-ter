package myComponents
{
    //import model.OCModelLocator;
   
    import mx.collections.ICollectionView;
    import mx.collections.XMLListCollection;
    import mx.controls.treeClasses.DefaultDataDescriptor;
    import mx.controls.treeClasses.ITreeDataDescriptor;
   
    public class ResourceTreeDataDescriptor extends DefaultDataDescriptor implements ITreeDataDescriptor
    {
        //private var model:OCModelLocator = OCModelLocator.getInstance();

 

        public function ResourceTreeDataDescriptor()
        {
        }
       
        /**
         * Returns children whose 'status' attribute is not 'deleted'.
         *
         * Since the data in the model need to be preserved, a copy is made to return to the tree control
         * with only those elements that need to be displayed.
         *
         */
        override public function getChildren(node:Object, model:Object=null):ICollectionView
        {
            // generate XMLList collection of immediate elements of the node
            var nodeElementsOriginal:XMLListCollection = new XMLListCollection(node.elements());
           
            // get an empty XMLList ready to add children whose status indicate that they need to be visible
            var nodeElementList:XMLList = new XMLList();
           
            for each (var resource:XML in nodeElementsOriginal) {
                // as the status indicate, decide to add / ignore the child
                //trace(resource.toXMLString());
                if (resource.@isVisible == 'true') {
                    nodeElementList += resource;
                }
            }
           
            // get XMLListCollection from the XMLList
            var nodeElements:XMLListCollection = new XMLListCollection(nodeElementList);

 

            return nodeElements;
        }
       
        public function hasChildren(node:Object, model:Object=null):Boolean
        {
            if (node.resource != "") {
                return true;
            } else {
                return false;
            }
        }
       
       public function isBranch(node:Object, model:Object=null):Boolean
        {
            if (node.@isBranch == "true") {
                return true;
            } else {
                return false;
            }
        }
       
        public function getData(node:Object, model:Object=null):Object
        {
            return node.resource;
        }
       
        public function addChildAt(parent:Object, newChild:Object, index:int, model:Object=null):Boolean
        {
            return false;
        }
       
        public function removeChildAt(parent:Object, child:Object, index:int, model:Object=null):Boolean
        {
            return false;
        }
    }
}
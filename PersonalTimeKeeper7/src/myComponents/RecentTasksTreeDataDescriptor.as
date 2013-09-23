package myComponents
{
    //import model.OCModelLocator;
   
    import mx.collections.ICollectionView;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.collections.XMLListCollection;
    import mx.controls.treeClasses.DefaultDataDescriptor;
    import mx.controls.treeClasses.ITreeDataDescriptor;
   
    public class RecentTasksTreeDataDescriptor extends DefaultDataDescriptor implements ITreeDataDescriptor
    {
        //private var model:OCModelLocator = OCModelLocator.getInstance();

		private var nameSort:Sort; 


        public function RecentTasksTreeDataDescriptor()
        {
        	nameSort = new Sort();
            nameSort.fields = [new SortField('@name', true)];
        }
       
	    public override function getChildren(node:Object, model:Object = null):ICollectionView {
	      var collection:XMLListCollection;
	      collection = new XMLListCollection(new XMLList((node as XML).*.(@isVisible=='show')));    	
      	  collection.sort = nameSort;
      	  collection.refresh();
	      return collection;
		}
	
	    public override function hasChildren(node:Object, model:Object = null):Boolean {
	       var test : Boolean=  (getChildren(node,model) as XMLListCollection).length > 0;
	       return test;
		}
	
	    public override function isBranch(node:Object, model:Object = null):Boolean {
	        var test : Boolean = hasChildren(node, model);
	        return test;
	    }
	}
}

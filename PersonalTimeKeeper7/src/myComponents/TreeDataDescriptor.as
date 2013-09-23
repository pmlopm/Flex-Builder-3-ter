package myComponents
{
    //import model.OCModelLocator;
   
    import mx.collections.ICollectionView;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.collections.XMLListCollection;
    import mx.controls.treeClasses.DefaultDataDescriptor;
    import mx.controls.treeClasses.ITreeDataDescriptor;
   
    public class TreeDataDescriptor extends DefaultDataDescriptor implements ITreeDataDescriptor
    {
        //private var model:OCModelLocator = OCModelLocator.getInstance();

		private var nameSort:Sort; 


        public function TreeDataDescriptor()
        {
        	nameSort = new Sort();
            nameSort.fields = [new SortField('@name', true)];
        }
       
	    public override function getChildren(node:Object, model:Object = null):ICollectionView {
	      var collection:XMLListCollection = new XMLListCollection((node as XML).application)
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

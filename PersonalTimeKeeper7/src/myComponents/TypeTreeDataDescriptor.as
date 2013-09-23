package myComponents
{
    //import model.OCModelLocator;
   
    import mx.collections.ICollectionView;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.collections.XMLListCollection;
    import mx.controls.treeClasses.DefaultDataDescriptor;
    import mx.controls.treeClasses.ITreeDataDescriptor;
   
    public class TypeTreeDataDescriptor extends DefaultDataDescriptor implements ITreeDataDescriptor
    {
        //private var model:OCModelLocator = OCModelLocator.getInstance();

		private var nameSort:Sort; 


        public function TypeTreeDataDescriptor()
        {
        	nameSort = new Sort();
            nameSort.fields = [new SortField('@id', true)];
        }
       
	    public override function getChildren(node:Object, model:Object = null):ICollectionView {
		    var collection:XMLListCollection = new XMLListCollection((node as XML).type)
	      	collection.sort = nameSort;
	      	collection.refresh();
	      	return collection;
		}	
	}
}

// ActionScript file
        import mx.events.DividerEvent;	    

		private var UNDEFINED:String = "--Undefined--";
		private var stateUndefined:String="undefined";
		private var stateDefined:String="defined";
		public var stateReported:String="reported";
		public var stateFailed:String="failed";

        public function isToday(date:Date) : Boolean
        {
        		var target:int = date.fullYear*10000 + (date.month+1)*100 + date.date;
        		var now:Date = new Date();
        		var current:int = now.fullYear*10000 + (now.month+1)*100 + now.date;
        		return (target == current);
        }
        
		private function dateOfMonday(day:Date):Date {
			var dayNr:int = day.getDay();
			var mondayDate:Date = new Date();
			mondayDate.setTime(day.getTime() - ((dayNr-1)*24*3600*1000)); 
			return mondayDate;
		}

		// what is the date of Wednesday in the week of date?
		private function dateOfDayOnDate(day:int,date:Date):Date {
			var dateOfDay:Date = new Date();
			dateOfDay.setTime(date.getTime() - (date.getDay() - day)*86400000);
			return dateOfDay;
		}
			
		//return Date this week of a day specified by its name
		//e.g. what is the date of Monday this week?
		private function dateOfDay(day:int):Date {
			return dateOfDayOnDate(day, new Date());	
		}
			
		private function convertDateToInflowFormat(date: String):String {
			var year:String = date.substr(0,4);
			var month:String=date.substr(5,2);
			var day:String=date.substr(8,2);
			var time:String="08:00:00"; //date.substr(11,8);
			var inflowDate:String=day+"-"+month+"-"+year+" "+time;
			return inflowDate;
			
		}
		
		private function removePadding(s:String):String {
			while (s.charAt() == "-") {
				s = s.substr(1);
			}
			return s;
		}
		
        private function columnResized(event:DividerEvent):void {
        	trace(event.target);
        	trace(perfGrid.getItemAt(event.dividerIndex).@task + "#" + perfGrid.getItemAt(event.dividerIndex).@duration);	
        	trace("duration before: " + event.dividerIndex + " + " + event.delta + " + " + perfGrid.getItemAt(event.dividerIndex).@task + " + " + perfGrid.getItemAt(event.dividerIndex).@duration);

       		perfGrid.getItemAt(event.dividerIndex).@duration = (Number(perfGrid.getItemAt(event.dividerIndex).@duration) + Number(event.delta)).toString();
      		trace("duration after : " + perfGrid.getItemAt(event.dividerIndex).@duration);
           	trace("end date       : " + perfGrid.getItemAt(event.dividerIndex).@end);
           	trace("start before   : " + perfGrid.getItemAt(event.dividerIndex).@start);
           	perfGrid.getItemAt(event.dividerIndex).@start = dateFormatter.format(recalculateStartdate(perfGrid.getItemAt(event.dividerIndex).@end, perfGrid.getItemAt(event.dividerIndex).@duration));
           	trace("start after    : " + perfGrid.getItemAt(event.dividerIndex).@start);
        	var idx:int = event.dividerIndex+1;
        	perfGrid.getItemAt(idx).@end = perfGrid.getItemAt(event.dividerIndex).@start;
        	trace(perfGrid.getItemAt(idx).@end);
        	trace(perfGrid.getItemAt(idx).@start);
        	perfGrid.getItemAt(idx).@duration = calculateDuration(perfGrid.getItemAt(idx).@end, perfGrid.getItemAt(idx).@start);
        	trace(perfGrid.getItemAt(idx).@duration);
        }
        
		public function stepperChanged():void
        {
//          		trace("duration before: " + grid.selectedItem + " + " + grid.selectedItem.@duration);
//          		trace("stepper value  : " + sideStepper.value);
//          		grid.selectedItem.@duration = sideStepper.value;
//          		trace("duration after : " + grid.selectedItem.@duration);
//           		trace("end date       : " + grid.selectedItem.@end);
//           		trace("start before   : " + grid.selectedItem.@start);
//           		grid.selectedItem.@start = dateFormatter.format(recalculateStartdate(grid.selectedItem.@end, grid.selectedItem.@duration));
//           		trace("start after    : " + grid.selectedItem.@start);
//        		var idx:int = grid.selectedIndex+1;
//        		perfGrid.getItemAt(idx).@end = grid.selectedItem.@start;
//        		trace(perfGrid.getItemAt(idx).@end);
//        		trace(perfGrid.getItemAt(idx).@start);
//        		perfGrid.getItemAt(idx).@duration = calculateDuration(perfGrid.getItemAt(idx).@end, perfGrid.getItemAt(idx).@start);
//        		trace(perfGrid.getItemAt(idx).@duration);
        }
			
//		private function buildMenu(iconMenu:NativeMenu, nodes:XMLList, level:int):void {
//			for each (var item:XML in nodes) {
//					var command1:NativeMenuItem = iconMenu.addItem(new NativeMenuItem(padding(level) + item.@name));
//					command1.addEventListener(Event.SELECT, function(event:Event):void {
//						tree.findString(removePadding(event.target.label));
//						endTask();
//					});
//				if (item.children().length() > 0) {
//					buildMenu(iconMenu, item.children(), level+1);
//				}
//			}			
//		}
		


// ActionScript file
			private function loadPerfGridMonday(): void {
				perfGridMonday = loadDailyPerfGrid(1);				
			}
			
			private function loadPerfGridTuesday(): void {
				perfGridTuesday = loadDailyPerfGrid(2);				
			}
			
			private function loadPerfGridWednesday(): void {
				perfGridWednesday = loadDailyPerfGrid(3);				
			}
			
			private function loadPerfGridThursday(): void {
				perfGridThursday = loadDailyPerfGrid(4);
			}
			
			private function loadPerfGridFriday(): void {
				perfGridFriday = loadDailyPerfGrid(5);
			}
			
			private function loadDailyPerfGrid(day:int):XMLListCollection {
				var dayStr:String = dayFormatter.format(dateOfDay(day));
				var file:File = File.documentsDirectory.resolvePath("PersonalTimeKeeper5/InflowPerf"+dayStr+".xml");
				if (file.exists) {
					var fileStream:FileStream = new FileStream();
					fileStream.open(file, FileMode.READ);
					var data:XML = XML(fileStream.readUTFBytes(fileStream.bytesAvailable));
					fileStream.close();
					var list:XMLList = data.children();
					return new XMLListCollection(list);
				} else {
					return null;
				}
			}
			private function loadWeekGrid(): void {
				var week:XML = <list/>;
				var weekByDay:XML = <list Monday="" Tuesday="" Wednesday="" Thursday="" Friday=""/>;
				
				//add tasks
				loadPerfGridMonday();
				for each (var mondayTask:XML in perfGridMonday) {
					trace(mondayTask.@task);
					if (week.task.(@name==mondayTask.@task && @description==mondayTask.@name).length() == 0) {
						var mondayNewTask:XML = new XML();
						mondayNewTask=<task/>;
						mondayNewTask.@name=mondayTask.@task;
						mondayNewTask.@description=mondayTask.@name;
						week.appendChild(mondayNewTask);
					}
				}
				//add durations
				for each (var task:XML in perfGridMonday) {
					trace(task.@task);
					var taskSummary:XMLList = week.task.(@name==task.@task && @description==mondayTask.@name) ;
					if (taskSummary.hasOwnProperty("@Monday")) {
						taskSummary.@Monday = Number(taskSummary.@Monday) + Number(task.@duration);
					} else {
						taskSummary.@Monday = task.@duration;
					}
				}
				//add tasks
				loadPerfGridTuesday();
				for each (var tuesdayTask:XML in perfGridTuesday) {
					trace(tuesdayTask.@task);
					if (week.task.(@name==tuesdayTask.@task && @description==tuesdayTask.@name).length() == 0) {
						var tuesdayNewTask:XML = new XML();
						tuesdayNewTask=<task/>;
						tuesdayNewTask.@name=tuesdayTask.@task;
						tuesdayNewTask.@description=tuesdayTask.@name;
						week.appendChild(tuesdayNewTask);
					}
				}
				//add durations
				for each (var task2:XML in perfGridTuesday) {
					trace(task2.@task);
					var taskSummary2:XMLList = week.task.(@name==task2.@task && @description==task2.@name);
					if (taskSummary2.hasOwnProperty("@Tuesday")) {
						taskSummary2.@Tuesday = Number(taskSummary2.@Tuesday) + Number(task2.@duration);
					} else {
						taskSummary2.@Tuesday = task2.@duration;
					}
				}
				//add tasks
				loadPerfGridWednesday();
				for each (var task3:XML in perfGridWednesday) {
					trace(task3.@task);
					if (week.task.(@name==task3.@task && @description==task3.@name).length() == 0) {
						var newTask:XML = new XML();
						newTask=<task/>;
						newTask.@name=task3.@task;
						newTask.@description = task3.@name
						week.appendChild(newTask);
					}
				}
				//add durations
				for each (var task1:XML in perfGridWednesday) {
					trace(task1.@task);
					var taskSummary5:XMLList = week.task.(@name==task1.@task && @description==task.@name);
					if (taskSummary5.hasOwnProperty("@Wednesday")) {
						taskSummary5.@Wednesday = Number(taskSummary5.@Wednesday) + Number(task1.@duration);
					} else {
						taskSummary5.@Wednesday = task1.@duration;
					}
				}
				//add tasks
				loadPerfGridThursday();
				for each (var task6:XML in perfGridThursday) {
					trace(task6.@task);
					if (week.task.(@name==task6.@task && @description==task6.@name).length() == 0) {
						var newTask3:XML = new XML();
						newTask3=<task/>;
						newTask3.@name=task6.@task;
						newTask3.@description = task6.@name
						week.appendChild(newTask3);
					}
				}
				//add durations
				for each (var task4:XML in perfGridThursday) {
					trace(task4.@task);
					var taskSummary3:XMLList = week.task.(@name==task4.@task && @description==task4.@name);
					if (taskSummary3.hasOwnProperty("@Thursday")) {
						taskSummary3.@Thursday = Number(taskSummary3.@Thursday) + Number(task4.@duration);
					} else {
						taskSummary3.@Thursday = task4.@duration;
					}
				}
				//add tasks
				loadPerfGridFriday();
				for each (var task5:XML in perfGridFriday) {
					trace(task5.@task);
					if (week.task.(@name==task5.@task && @description==task5.@name).length() == 0) {
						var newTask2:XML = new XML();
						newTask2=<task/>;
						newTask2.@name=task5.@task;
						newTask2.@description = task5.@name
						week.appendChild(newTask2);
					}
				}
				//add durations
				for each (var task7:XML in perfGridFriday) {
					trace(task7.@task);
					var taskSummary4:XMLList = week.task.(@name==task7.@task&& @description==ttask7ask6.@name);
					if (taskSummary4.hasOwnProperty("@Friday")) {
						taskSummary4.@Friday = Number(taskSummary4.@Friday) + Number(task7.@duration);
					} else {
						taskSummary4.@Friday = task7.@duration;
					}
				}
				weekGrid = new XMLListCollection(week.task);

				for each (var row:XML in weekGrid) {
					if (row.@name != UNDEFINED) {
						weekByDay.@Monday = Number(weekByDay.@Monday) + Number(row.@Monday);
						weekByDay.@Tuesday = Number(weekByDay.@Tuesday) + Number(row.@Tuesday);
						weekByDay.@Wednesday = Number(weekByDay.@Wednesday) + Number(row.@Wednesday);
						weekByDay.@Thursday = Number(weekByDay.@Thursday) + Number(row.@Thursday);
						weekByDay.@Friday = Number(weekByDay.@Friday) + Number(row.@Friday);						
					}
				}
				weekByDayGrid = new XMLListCollection(new XMLList(weekByDay));
			}

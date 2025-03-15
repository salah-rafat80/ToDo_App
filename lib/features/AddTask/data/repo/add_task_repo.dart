import 'package:dartz/dartz.dart';
import 'package:todo/features/AddTask/data/model/add_task_model.dart';

 class AddTaskRepo {
   List<AddTaskModel> addTaskList = [];

   AddTaskRepo._internal();
   static AddTaskRepo instance = AddTaskRepo._internal();
   static getinstance (){
     return instance;
   }
  Future<Either<String, void>> addTask({required AddTaskModel task})async {
    try {
      if(task.titleTask.isEmpty){
        return left("task name can't be empty");
      }else{
        await Future.delayed(Duration(seconds: 3));
        addTaskList.add(task);
      return right(null);
      }
    } catch (e) {
      return left("error");
    }
  }


 }
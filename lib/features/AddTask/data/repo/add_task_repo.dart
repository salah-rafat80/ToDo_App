import 'package:dartz/dartz.dart';
import 'package:todo/core/resources_manager/network/api_helper.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';
import 'package:todo/features/AddTask/data/model/add_task_model.dart';

 class AddTaskRepo {


   AddTaskRepo._internal();
   static AddTaskRepo instance = AddTaskRepo._internal();
   static getinstance (){
     return instance;
   }
   ApiHelper apiHelper = ApiHelper();

   Future<Either<String, void>> addTask({required AddTaskModel task})async {
    ApiResponse response = await apiHelper.postRequest(
      url: EndPoints.newTask,
      data:{
        "title":task.titleTask,
        "description":task.description,
        },
        isAuthorized: true,


    );
    if (response.status) {
      return right(response.message);
    } else {
      return left(response.message);
    }
  }


 }
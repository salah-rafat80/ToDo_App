import 'package:dartz/dartz.dart';
import 'package:todo/core/resources_manager/network/api_helper.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';
import 'package:todo/features/Home/data/model/tasks_response_model.dart';
import 'package:todo/features/Home/data/model/user_data_model.dart';

class HomeRepo {
  HomeRepo._internal();

  static HomeRepo instance = HomeRepo._internal();

  static getinstance() {
    return instance;
  }

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List<Tasks>>> getTasks() async {
    ApiResponse response = await apiHelper.getRequest(
      url: EndPoints.myTasks,
      isAuthorized: true,
    );

    TasksResponseModel tasksResponseModel = TasksResponseModel.fromJson(
        response.data!);
    if (response.status) {
      if (tasksResponseModel.tasks == null) {
        return left(response.message);
      }
      return right(tasksResponseModel.tasks!);
    } else {
      return left(response.message);
    }
  }


  Future<Either<String, String>> getUserData() async {
    ApiResponse response = await apiHelper.getRequest(
      url: EndPoints.getUserData,
      isAuthorized: true,
    );

    if (response.status) {
      UserDataModel responseModel = UserDataModel.fromJson(response.data!);
      return right(responseModel.user!.username!);
    } else {
      return left(response.message);
    }
  }
}
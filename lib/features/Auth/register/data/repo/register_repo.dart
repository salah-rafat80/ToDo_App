import 'package:dartz/dartz.dart';
import 'package:todo/core/resources_manager/network/api_helper.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';

class AuthRepo {
  AuthRepo._internal();

  static AuthRepo instance = AuthRepo._internal();

  static getinstance() {
    return instance;
  }

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> register({
    required String name,
    required String password,
  }) async {

     ApiResponse response = await apiHelper.postRequest(
        url: EndPoints.register,
        data: {"username": name, "password": password},
       isAuthorized: false,

      );

      if (response.status ) {
        return right(response.message);
      }else{
        return left(response.message);
      }

  }
}

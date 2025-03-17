import 'package:dartz/dartz.dart';
import 'package:todo/core/local/local_data.dart';
import 'package:todo/core/resources_manager/network/api_helper.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';
import 'package:todo/features/Auth/login/data/model/login_response_model.dart';
class LoginRepo {
  LoginRepo._internal();

  static LoginRepo instance = LoginRepo._internal();

  static getinstance() {
    return instance;
  }

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, UserModel>> login({
    required String name,
    required String password,
  }) async {
    ApiResponse response = await apiHelper.postRequest(
      url: EndPoints.login,
      data: {"username": name, "password": password},
      isAuthorized: false,
    );

    if (response.status) {
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data!);
      if (loginResponseModel.user == null) {
        return left(response.message);
      }
      LocalData.accessToken = loginResponseModel.accessToken!;
      LocalData.refreshToken = loginResponseModel.refreshToken!;
      return right(loginResponseModel.user!);
    } else {
      return left(response.message);
    }
  }
}

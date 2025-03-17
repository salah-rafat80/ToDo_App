import 'package:dartz/dartz.dart';
import 'package:todo/core/resources_manager/network/api_helper.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';

class ChangePassRepo {
  ChangePassRepo._internal();

  static ChangePassRepo instance = ChangePassRepo._internal();

  static getinstance() {
    return instance;
  }

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,

  }) async {

    ApiResponse response = await apiHelper.postRequest(
      url: EndPoints.changePassword,
      data: {"current_password": currentPassword, "new_password": newPassword,
      "new_password_confirm": newPasswordConfirm},
      isAuthorized: true,

    );

    if (response.status ) {
      return right(response.message);
    }else{
      return left(response.message);
    }

  }
}

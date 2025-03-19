import 'package:dartz/dartz.dart';
import 'package:todo/core/resources_manager/network/api_helper.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';

class ChangeNameRepo {
  ChangeNameRepo._internal();

  static final ChangeNameRepo instance = ChangeNameRepo._internal();

  static ChangeNameRepo getInstance() { // Fixed method name
    return instance;
  }

  final ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> changeName({

    required String newName,
  }) async {
    ApiResponse response = await apiHelper.putRequest(
      url: EndPoints.updateProfile,
      data: {
        "username": newName,
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

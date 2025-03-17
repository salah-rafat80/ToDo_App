import 'package:dio/dio.dart';
import 'package:todo/core/local/local_data.dart';
import 'package:todo/core/resources_manager/network/api_response.dart';
import 'package:todo/core/resources_manager/network/end_points.dart';

class ApiHelper {
  static final ApiHelper _singleton = ApiHelper._internal();

  factory ApiHelper() => _singleton;

  ApiHelper._internal();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<ApiResponse> getRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.get(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }


  Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.post(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> putRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.put(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }
  Future<ApiResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.delete(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }

}



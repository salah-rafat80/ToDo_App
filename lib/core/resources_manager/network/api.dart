import 'package:dio/dio.dart';

//wrapper
class APIHelper {
  static   APIHelper? _instance ;
  late final Dio _dio;
  factory APIHelper() {
    _instance ??= APIHelper._internal();
    return _instance!;
  }

  APIHelper._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://nti-production.up.railway.app/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  Dio get dio => _dio;

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } catch (e) {
      return Future.error(e);
    }
  }
}

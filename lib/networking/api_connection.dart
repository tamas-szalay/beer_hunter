import 'package:dio/dio.dart' as dio;

abstract class ApiConnection {
  Future<dio.Response<T>> restGet<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    bool authenticated = true,
  });

  Future<dio.Response<T>> restDelete<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool authenticated = true,
  });

  Future<dio.Response<T>> restPost<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool withAppId = false,
    bool authenticated = true,
  });

  Future<dio.Response<T>> restPut<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool authenticated = true,
  });
}

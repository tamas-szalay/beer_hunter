import 'package:beer_hunter/networking/api_connection.dart';
import 'package:beer_hunter/networking/error_parser.dart';
import 'package:dio/dio.dart';

class RemoteApiConnection implements ApiConnection {
  final String _baseUrl;
  final ErrorParser _errorParser;
  final Dio _client = Dio();

  RemoteApiConnection(this._baseUrl, this._errorParser) {
    _client.options.baseUrl = _baseUrl;
  }

  @override
  Future<Response<T>> restGet<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    bool authenticated = true,
  }) async {
    try {
      return await _client.get(
        path,
        queryParameters: queryParams,
      );
    } catch (e) {
      throw _errorParser.parseAsError(e);
    }
  }

  @override
  Future<Response<T>> restDelete<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool authenticated = true,
  }) async {
    try {
      return await _client.delete(
        path,
        queryParameters: queryParams,
        data: body,
      );
    } catch (e) {
      throw _errorParser.parseAsError(e);
    }
  }

  @override
  Future<Response<T>> restPost<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool withAppId = false,
    bool authenticated = true,
  }) async {
    try {
      return await _client.post(
        path,
        queryParameters: queryParams,
        data: body,
      );
    } catch (e) {
      throw _errorParser.parseAsError(e);
    }
  }

  @override
  Future<Response<T>> restPut<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool authenticated = true,
  }) async {
    try {
      return await _client.put(
        path,
        queryParameters: queryParams,
        data: body,
      );
    } catch (e) {
      throw _errorParser.parseAsError(e);
    }
  }
}
